// See README.md for license details.
//package PositMultiply
package example 

//import PositDef._
import chisel3._
import chisel3.util._
import chisel3.core.Bundle

class PositMultiply(width: Int = 8, es: Int = 1, trailing_bits: Int = 2) extends Module {
  val io = IO(new Bundle {
    val a = Input(new UnpackedPosit(width = 8, es = 1))
    val b = Input(new UnpackedPosit(width = 8, es = 1))
    val out = Output(new UnpackedPosit(width = 8, es = 1))
    val trailingBits = Output(UInt(trailing_bits.W))
    val stickyBit = Output(UInt(1.W))
  })

  val LOCAL_FRACTION_BITS: Int  = PositDef.getFractionBits(width, es)//: Int = 4
  val LOCAL_UNSIGNED_EXPONENT_BITS: Int = PositDef.getUnsignedExponentBits(width, es)//: Int = 5
  val LOCAL_MAX_UNSIGNED_EXPONENT: Int = PositDef.getMaxUnsignedExponent(width, es)//: Int = 24
  val LOCAL_EXPONENT_BIAS: Int = PositDef.getExponentBias(width, es)//: Int = 12

  // Number of bits for the exponent bias
  val EXP_BIAS_BITS: Int = PositDef.clog2(LOCAL_EXPONENT_BIAS)  //Int = 4

  // Size of the product a * b
  val EXP_PRODUCT_BITS: Int = LOCAL_UNSIGNED_EXPONENT_BITS + 1 //Int = 6
  val FRAC_PRODUCT_BITS: Int = (LOCAL_FRACTION_BITS + 1) * 2 //Int = 10

  val abSign = Wire(UInt(1.W))
  val abExp = Wire(UInt(EXP_PRODUCT_BITS.W)) //EXP_PRODUCT_BITS
  val abExpTooSmall = Wire(UInt(1.W)) //Better to be a Bool, or a UInt???
  val abExpTooLarge = Wire(UInt(1.W))
  val abExpShift = Wire(UInt(1.W))

  val finalExpExtended = Wire(UInt(EXP_PRODUCT_BITS.W))
  val finalExp = Wire(UInt(LOCAL_UNSIGNED_EXPONENT_BITS.W))
  val abUnshiftedProduct = Wire(UInt(FRAC_PRODUCT_BITS.W))
  val abShiftedProduct = Wire(UInt(FRAC_PRODUCT_BITS.W))
  val underflowShift = Wire(UInt(EXP_BIAS_BITS.W))
  val underflowProduct = Wire(UInt((trailing_bits + 1).W))

  val underflowSticky = Wire(UInt(1.W))
  val normalTrailingBits = Wire(UInt(trailing_bits.W))
  val normalStickyBit = Wire(UInt(1.W))

  //TODO-TEST ShiftRight, outputs underflowProduct and underflowSticky
  val shiftRightWithSticky = Module(new ShiftRightSticky(OUT_WIDTH = trailing_bits + 1,
    IN_WIDTH = FRAC_PRODUCT_BITS, SHIFT_VAL_WIDTH = EXP_BIAS_BITS))

  shiftRightWithSticky.io.in := abShiftedProduct
  shiftRightWithSticky.io.shift := underflowShift
  underflowProduct:= shiftRightWithSticky.io.out
  underflowSticky := shiftRightWithSticky.io.sticky

  val unusedStickyAnd = Wire(UInt(1.W))
  unusedStickyAnd := shiftRightWithSticky.io.stickyAnd
  //underflowProduct := 0.U //in current test, is 000
  //underflowSticky  := 1.U //in current test, is 1


  //TODO-TEST ZeroPadRight, outputs normalTrailingBits
  val zeroPadRight = Module(new ZeroPadRight(inWidth = FRAC_PRODUCT_BITS - 2 - LOCAL_FRACTION_BITS,
                                      outWidth = trailing_bits))
  zeroPadRight.io.in := abShiftedProduct(FRAC_PRODUCT_BITS-2-LOCAL_FRACTION_BITS-1, 0)
    normalTrailingBits := zeroPadRight.io.out
  //normalTrailingBits := 3.U //in current test, is 11

  abSign := io.a.sign ^ io.b.sign

  // FIXME: handle posit sign / fraction encoding (2s complement)?
  // Posits always have a leading 1
  abUnshiftedProduct := Cat(1.U(1.W), io.a.fraction) * Cat(1.U(1.W), io.b.fraction)

  // The product result may be of the form 01.bbbb, or 1b.bbbb. In the latter
  // case, our exponent is adjusted by 1.
  abExpShift := abUnshiftedProduct(FRAC_PRODUCT_BITS-1)

  // FIXME: case where we are right at the limit, and the +1 from abExpShift
  // causes an overflow? This might not be possible though except for some
  // very specific (N, es) choices.
  abExp := io.a.exponent + io.b.exponent + abExpShift

  // This is the product with the exponent abExp, which takes into account the
  // shift needed for the location of the leading one.
  // It is thus in the form 1.bbbb, with only a single leading digit
  when (abExpShift.asBool()) {
    abShiftedProduct := abUnshiftedProduct
  } .otherwise {
    abShiftedProduct := Cat(abUnshiftedProduct(FRAC_PRODUCT_BITS-2, 0), 0.U(1.W))
  }

  // (a_unsigned - bias) + (b_unsigned - bias) >= min signed (-bias)
  // a_u + b_u >= bias
  abExpTooSmall := (abExp < LOCAL_EXPONENT_BIAS.U)

  // Highest representable exponent is 2 * bias + MAX_UNSIGNED_EXPONENT
  abExpTooLarge := (abExp > (LOCAL_EXPONENT_BIAS + LOCAL_MAX_UNSIGNED_EXPONENT).U)

  finalExpExtended := abExp - LOCAL_EXPONENT_BIAS.U

  finalExp := finalExpExtended(LOCAL_UNSIGNED_EXPONENT_BITS-1, 0)

  // For abExpTooSmall, we need to shift right by (bias - abExp) to determine
  // the trailing and sticky bits.
  // This is only used in the case abExp < bias, so it can be narrower
  underflowShift := LOCAL_EXPONENT_BIAS.U - abExp(EXP_BIAS_BITS-1, 0)

  io.out.isInf := io.a.isInf || io.b.isInf

  io.out.isZero := (!io.out.isInf) && (io.a.isZero || io.b.isZero)

  io.out.sign := (!io.out.isInf) && abSign.asBool()

  when(io.out.isZero || io.out.isInf) {
    io.out.exponent := 0.U
  } .elsewhen(abExpTooLarge.asBool()) {
    io.out.exponent := LOCAL_MAX_UNSIGNED_EXPONENT.U
  } .otherwise {
    io.out.exponent := finalExp
  }

  when(io.out.isInf || io.out.isZero || abExpTooLarge.asBool()) {
    io.out.fraction := 0.U
  } .otherwise {
    io.out.fraction := abShiftedProduct(FRAC_PRODUCT_BITS-2, FRAC_PRODUCT_BITS-2-LOCAL_FRACTION_BITS+1)
  }

  when(io.out.isInf || io.a.isZero || io.b.isZero || abExpTooLarge.asBool()) {
    io.trailingBits := 0.U
  } .elsewhen(abExpTooSmall.asBool()) {
    io.trailingBits := underflowProduct(trailing_bits-1, 0)
  } .otherwise {
    io.trailingBits := normalTrailingBits
  }

  when(io.out.isInf || io.a.isZero || io.b.isZero || abExpTooLarge.asBool()) {
    io.stickyBit := 0.U
  } .elsewhen(abExpTooSmall.asBool()) {
    io.stickyBit := underflowSticky
  } .otherwise {
    io.stickyBit := normalStickyBit
  }

  if (FRAC_PRODUCT_BITS-2-LOCAL_FRACTION_BITS-trailing_bits >= 1) {
    normalStickyBit := abShiftedProduct(FRAC_PRODUCT_BITS-2-LOCAL_FRACTION_BITS-trailing_bits-1, 0).orR
  } else {
    normalStickyBit := 0.U
  }

}

