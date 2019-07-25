// See README.md for license details.
//package PositMultiply
package example

//import PositDef._
import chisel3._
import chisel3.util._
import chisel3.core.Bundle

// Round helper for posits that performs the proper fraction/ES truncation based
// on exponent, so we can determine the bits that need rounding (for arithmetic
// or geometric rounding)
class PositRoundHelper(width: Int = 8, es: Int = 1, trailing_bits: Int = 2) extends Module {
  val io = IO(new Bundle{
    val in = Input(new UnpackedPosit(width = width, es = es))
    val inTrailingBits = Input(UInt(trailing_bits.W))
    val inStickyBit = Input(UInt(1.W))

    // The adjusted (ES, fraction) with possible space for ES overflow
    // FIXME: remove ES overflow bit
    // This is (0, ES, fraction) right shifted by excessRegimeBits
    val postShift = Output(UInt((1 + es + PositDef.getFractionBits(width, es) + trailing_bits).W))

    // We assume the regime always takes two bits in the encoding. This determines
    // how many more bits we need to shift. This is also the number of bits that
    // postShift has been shifted right
    val excessRegimeBits = Output(UInt((PositDef.getUnsignedRegimeBits(width) - 1).W))

    // The resulting sticky bit from the shift
    val outStickyBit = Output(UInt(1.W))
  })

  val LOCAL_UNSIGNED_EXPONENT_BITS: Int = PositDef.getUnsignedExponentBits(width, es)
  val LOCAL_UNSIGNED_REGIME_BITS: Int = PositDef.getUnsignedRegimeBits(width)
  val LOCAL_SIGNED_REGIME_BITS: Int = PositDef.getSignedRegimeBits(width)
  val LOCAL_FRACTION_BITS: Int = PositDef.getFractionBits(width, es)

  val SHIFT_ROUND_SIZE: Int = 1 + // overflow bit
                              es +
                              LOCAL_FRACTION_BITS

  val unsignedRegime = Wire(UInt(LOCAL_UNSIGNED_REGIME_BITS.W))
  val signedRegime = Wire(UInt(LOCAL_SIGNED_REGIME_BITS.W))
  val preShift = Wire(UInt((SHIFT_ROUND_SIZE + trailing_bits).W))
  val postShiftSticky = Wire(UInt(1.W))

  //
  // General algorithm:
  // We have a fixed bit width exponent / fraction which may or may not overflow
  // in a posit representation.
  //
  // If the exponent is within bounds, it is still possible that some (or all)
  // of the fraction bits will be truncated, or some (or all) of the ES bits
  // will be truncated.
  //
  // Based on the exponent, we determine whether or not overflow will occur, and
  // we determine how many of the [ES, fraction] bits will go away.
  // No truncation happens if the regime takes 2 bits, which is the minimum.
  // Any additional regime bit results in truncation.
  // excessRegimeBits is the number of bits that we need to truncate and shift
  // by.
  //

  /*
  ShiftRightSticky #(.IN_WIDTH(SHIFT_ROUND_SIZE+TRAILING_BITS),
                     .OUT_WIDTH(SHIFT_ROUND_SIZE+TRAILING_BITS),
                     .SHIFT_VAL_WIDTH(LOCAL_UNSIGNED_REGIME_BITS-1))
  srs(.in(preShift),
      .shift(excessRegimeBits),
      .out(postShift),
      .sticky(postShiftSticky),
      .stickyAnd());
   */

  val unusedStickyAnd = Wire(UInt(1.W))
  val shiftRightSticky = Module(new ShiftRightSticky(IN_WIDTH = SHIFT_ROUND_SIZE + trailing_bits,
    OUT_WIDTH = SHIFT_ROUND_SIZE + trailing_bits, SHIFT_VAL_WIDTH = LOCAL_UNSIGNED_REGIME_BITS - 1))

  shiftRightSticky.io.in := preShift
  shiftRightSticky.io.shift := io.excessRegimeBits
  io.postShift := shiftRightSticky.io.out
  postShiftSticky := shiftRightSticky.io.sticky
  unusedStickyAnd := shiftRightSticky.io.stickyAnd

  if(es == 0) {
    preShift := Cat(0.U(1.W), Cat(io.in.fraction, io.inTrailingBits))
  } else {
    preShift := Cat(0.U(1.W), Cat(io.in.exponent(es-1, 0), Cat(io.in.fraction, io.inTrailingBits)))
  }

  assert(LOCAL_UNSIGNED_EXPONENT_BITS - es == LOCAL_UNSIGNED_REGIME_BITS)

  unsignedRegime := UnpackedPositFunctions.unsignedRegime(io.in, width = width, es = es)

  signedRegime := UnpackedPositFunctions.signedRegime(io.in, width, es)

  // The FRACTION_BITS is based on the maximum possible fraction size, that is
  // N - 3. Any regime encoding with more than 2 bits will truncate the
  // fraction and/or ES.

  // Example:
  // encoding 0000 0001 001x 01xx 10xx 110x 1110 1111
  // sgn regime  x   -3   -2   -1    0    1    2    3
  // uns regime  x    0    1    2    3    4    5    6
  // regime bits 4    4    3    2    2    3    4    4
  // exc bits    x    2    1    0    0    1    2    3(*)
  // FIXME: (*) not true for max regime. Does this matter?

  when(signedRegime >= 0.U) {
    io.excessRegimeBits := signedRegime(LOCAL_SIGNED_REGIME_BITS-2, 0).asUInt
  } .otherwise {
    io.excessRegimeBits := (~signedRegime(LOCAL_SIGNED_REGIME_BITS-2, 0)).asUInt
  }
  io.outStickyBit := io.inStickyBit | postShiftSticky

}
