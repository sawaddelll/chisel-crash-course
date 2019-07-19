// See README.md for license details.
//package PositMultiply
package example

//import PositDef._
import chisel3._
import chisel3.util._
import chisel3.core.Bundle

class PositEncode(width: Int = 8, es: Int = 1) extends Module {
  val io = IO(new Bundle {
    val in = Input(new UnpackedPosit(width, es))
    val out = Output(new PackedPosit(width, es))
  })

  val LOCAL_MAX_REGIME_FIELD_SIZE: Int = PositDef.getMaxRegimeFieldSize(width)
  val LOCAL_MAX_SIGNED_REGIME: Int = PositDef.getMaxSignedRegime(width)
  val LOCAL_UNSIGNED_REGIME_BITS: Int = PositDef.getUnsignedRegimeBits(width)
  val LOCAL_SIGNED_REGIME_BITS: Int = PositDef.getSignedRegimeBits(width)
  val LOCAL_ES_BITS: Int = PositDef.getESBits(width, es)

  val signedRegime = Wire(SInt(LOCAL_SIGNED_REGIME_BITS.W))

  val shiftBits = Wire(UInt((LOCAL_SIGNED_REGIME_BITS-1).W))

  val posRegime = Wire(UInt(1.W))

  val esAndFraction = Wire(SInt(LOCAL_MAX_REGIME_FIELD_SIZE.W))

  val esAndFractionShifted = Wire(SInt(LOCAL_MAX_REGIME_FIELD_SIZE.W))

  // arithmetic right shift, to extend the leading 1 if present
  // esAndFractionShifted = esAndFraction >>> shiftBits
  // ShiftRightArithmetic #(.WIDTH(LOCAL_MAX_REGIME_FIELD_SIZE),
  //                         .SHIFT_VAL_WIDTH(LOCAL_SIGNED_REGIME_BITS-1))
  //TODO: This was made as a separate module to track resource usage, is that necessary?
  esAndFractionShifted := esAndFraction >> shiftBits

  val firstBits = Wire(Bits(2.W))
  when(posRegime === 1.U) {
    firstBits := 2.U //TODO: How do you write binary?
  } .otherwise {
    firstBits := 1.U
  }

  if (es > 0) {
    esAndFraction := Cat(firstBits, Cat(io.in.exponent(es-1, 0), io.in.fraction)).asSInt
  } else {
    esAndFraction := Cat(firstBits, io.in.fraction).asSInt
  }
  //TODO: add functions to Unpacked/Packed Posits to do stuff like below, somehow (just separate modules?)
  //signedRegime = in.signedRegime(in.data)
  signedRegime := UnpackedPositFunctions.signedRegime(io.in, width, es)//TODO-TEST THIS

  posRegime := (signedRegime >= 0.S)

  // Example:
  // encoding 0000 0001 001x 01xx 10xx 110x 1110 1111
  // sgn regime  x   -3   -2   -1    0    1    2    3
  // uns regime  x    0    1    2    3    4    5    6
  // regime bits 4    4    3    2    2    3    4    4

  // Equivalent of posRegime ? signedRegime : -signedRegime - 1
  // Our shift width only needs to encode the maximum positive regime
  when(posRegime === 1.U) {
    shiftBits := signedRegime(LOCAL_SIGNED_REGIME_BITS-2, 0).asUInt()

  } .otherwise {
    // Subtract 1 from the signed regime; as 2s complement is
    // the inverse plus one //TODO: is this something that needs to be added, or is already taken care of with this?
    //unsigned'(~signedRegime[LOCAL_SIGNED_REGIME_BITS-2:0]);
    shiftBits :=(~signedRegime(LOCAL_SIGNED_REGIME_BITS-2, 0)).asUInt()
  }

  val outBitsVec = Wire(Vec(width, Bool()))
  io.out.bits := outBitsVec.asUInt
  when(io.in.isZero) {
    //TODO: TEST Another posit bundle function
    //out.data = out.zeroPacked();
    outBitsVec := PackedPositFunctions.zeroPackedBits(width)
  } .elsewhen(io.in.isInf) {
    //TODO: TEST Another posit bundle function
    outBitsVec := PackedPositFunctions.infPackedBits(width)
    //out.data = out.infPacked();
  } .otherwise {
    outBitsVec(width-1) := io.in.sign
    for (i <- width-2 to 0 by -1) {
      outBitsVec(i) := esAndFractionShifted(i)
    }
    //io.out.bits(width-2, 0) := esAndFractionShifted
  }



}
