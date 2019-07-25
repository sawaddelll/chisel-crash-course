// See README.md for license details.
package PositMultiply

import PositDef._
import chisel3._
import chisel3.util._
import chisel3.core.Bundle


// In the case that zero is passed, the keep bit is by definition zero, but the
// trailing and sticky bits may be non-zero, in which case we may round up to
// the minimum posit.
class PositRoundToNearestEven(width: Int = 8, es: Int = 1) extends Module {
  val io = IO(new Bundle{
    val in = Input(new UnpackedPosit(width, es))
    val trailingBits = Input(UInt(2.W))
    val stickyBit = Input(UInt(1.W))
    val out = Output(new UnpackedPosit(width, es))

  })
  val TRAILING_BITS: Int = 2
  val LOCAL_MAX_UNSIGNED_REGIME: Int = PositDef.getMaxUnsignedRegime(width)
  val LOCAL_UNSIGNED_EXPONENT_BITS: Int = PositDef.getUnsignedExponentBits(width, es)
  val LOCAL_MAX_UNSIGNED_EXPONENT: Int = PositDef.getMaxUnsignedExponent(width, es)
  val LOCAL_UNSIGNED_REGIME_BITS: Int = PositDef.getUnsignedRegimeBits(width)
  val LOCAL_FRACTION_BITS: Int  = PositDef.getFractionBits(width, es)
  val SHIFT_ROUND_SIZE: Int = 1 + // overflow bit
                              es +
                              LOCAL_FRACTION_BITS

  // Output from the round helper
  val postShift = Wire(UInt((SHIFT_ROUND_SIZE + TRAILING_BITS).W))
  val excessRegimeBits = Wire(UInt((LOCAL_UNSIGNED_REGIME_BITS-1).W))
  val roundStickyBit = Wire(UInt(1.W))

  val roundHelper = Module(new PositRoundHelper(width = width, es = es, trailing_bits = TRAILING_BITS))
  roundHelper.io.in := io.in
  roundHelper.io.inTrailingBits := io.trailingBits
  roundHelper.io.inStickyBit := io.stickyBit
  postShift := roundHelper.io.postShift
  excessRegimeBits := roundHelper.io.excessRegimeBits
  roundStickyBit := roundHelper.io.outStickyBit

  // Round logic
  val roundDown = Wire(UInt(1.W))

  val r2ne = Module(new RoundToNearestEven)
  r2ne.io.keepBit := postShift(2)
  r2ne.io.trailingBits := postShift(1, 0)
  r2ne.io.stickyBit := roundStickyBit
  roundDown := r2ne.io.roundDown

  val zeroRoundUp = Wire(UInt(1.W))
  val overflow = Wire(UInt(1.W))
  val roundUnsignedRegime = Wire(UInt(LOCAL_UNSIGNED_REGIME_BITS.W))
  val postShiftRound = Wire(UInt(SHIFT_ROUND_SIZE.W))
  val postRoundExponent = Wire(UInt(LOCAL_UNSIGNED_EXPONENT_BITS.W))


  // The (es, fraction) realigned
  val reShift = Wire(UInt(SHIFT_ROUND_SIZE.W))

  reShift := postShiftRound << excessRegimeBits

  if (es == 0) {
    postRoundExponent := roundUnsignedRegime
  } else {
    postRoundExponent := Cat(roundUnsignedRegime, reShift(SHIFT_ROUND_SIZE - 2, SHIFT_ROUND_SIZE - 2 - es + 1))
  }

  postShiftRound := postShift(SHIFT_ROUND_SIZE + TRAILING_BITS - 1, TRAILING_BITS) + !roundDown

  // Increment the regime if there was a carry in the round increment above
  roundUnsignedRegime := UnpackedPositFunctions.unsignedRegime(io.in, width, es) + reShift(SHIFT_ROUND_SIZE - 1)
  overflow := (roundUnsignedRegime >= LOCAL_MAX_UNSIGNED_REGIME.U)

  // If we have a zero, we may still round up in these cases, as the keep
  // bit is by definition 0:
  // x | 1 0 1 : round up
  // x | 1 1 0 : round up
  // x | 1 1 1 : round up
  zeroRoundUp := io.in.isZero &&
    // We use the original input trailing and sticky bits
    (io.trailingBits(1) && (io.trailingBits(0) || io.stickyBit.asBool))

  io.out.sign := io.in.sign
  io.out.isZero := io.in.isZero && !zeroRoundUp
  io.out.isInf := io.in.isInf

  when(io.in.isZero || io.in.isInf) {
    io.out.exponent := 0.U(LOCAL_UNSIGNED_EXPONENT_BITS.W)
  } .otherwise {
    when(overflow.asBool) {
      io.out.exponent := LOCAL_MAX_UNSIGNED_EXPONENT.U(LOCAL_UNSIGNED_EXPONENT_BITS.W)
    } .otherwise {
      io.out.exponent := postRoundExponent
    }
  }

  when (overflow.asBool || (io.in.isZero || io.in.isInf)) {
    io.out.fraction := 0.U(LOCAL_FRACTION_BITS.W)
  } .otherwise {
    io.out.fraction := reShift(LOCAL_FRACTION_BITS - 1, 0)
  }

}
