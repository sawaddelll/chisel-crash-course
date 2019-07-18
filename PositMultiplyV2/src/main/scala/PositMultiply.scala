package example

import chisel3._
import chisel3.util._
import chisel3.core.Bundle

class UnpackedPosit (width: Int, es : Int) extends Bundle {
  val isZero = Bool()
  val isInf  = Bool()
  val sign   = Bool()
  val exponent = UInt(5.W/* es.W need to change this since it is unpacked, not packed*/ ) //TODO: based on PositDef function, which take in width and es
  val fraction = UInt(4.W/*width.W*/) //TODO: based on PositDef function

  override def cloneType =
    new UnpackedPosit(width, es).asInstanceOf[this.type]

}

class PositMultiply(width: Int = 8, es: Int = 1, trailing_bits: Int = 2) extends Module {
  val io = IO(new Bundle {
    val a = Input(new UnpackedPosit(width = 8, es = 1))
    val b = Input(new UnpackedPosit(width = 8, es = 1))
    val out = Output(new UnpackedPosit(width = 8, es = 1))
    val trailingBits = Output(UInt(trailing_bits.W))
    val stickyBit = Output(UInt(1.W))
  })

  val LOCAL_FRACTION_BITS : Int = 4
  val LOCAL_UNSIGNED_EXPONENT_BITS : Int = 5
  val LOCAL_MAX_UNSIGNED_EXPONENT : Int = 24
  val LOCAL_EXPONENT_BIAS : Int = 12
  val EXP_BIAS_BITS : Int = 4
  val EXP_PRODUCT_BITS : Int = 6
  val FRAC_PRODUCT_BITS : Int = 10

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

  //TODO ShiftRight, outputs underflowProduct and underflowSticky
  underflowProduct := 0.U //in current test, is 000
  underflowSticky  := 1.U //in current test, is 1

  //TODO ZeroPadRight, outputs normalTrailingBits
  normalTrailingBits := 0.U //in current test, is 11

  abSign := io.a.sign ^ io.b.sign

  abUnshiftedProduct := Cat(1.U(1.W), io.a.fraction) * Cat(1.U(1.W), io.b.fraction)

  abExpShift := abUnshiftedProduct(FRAC_PRODUCT_BITS-1)

  abExp := io.a.exponent + io.b.exponent + abExpShift

  when (abExpShift.asBool()) {
    abShiftedProduct := abUnshiftedProduct
  } .otherwise {
    abShiftedProduct := Cat(abUnshiftedProduct(FRAC_PRODUCT_BITS-2, 0), 0.U(1.W))
  }


  abExpTooSmall := (abExp < LOCAL_EXPONENT_BIAS.U)

  abExpTooLarge := (abExp > (LOCAL_EXPONENT_BIAS + LOCAL_MAX_UNSIGNED_EXPONENT).U)

  finalExpExtended := abExp - LOCAL_EXPONENT_BIAS.U

  finalExp := finalExpExtended(LOCAL_UNSIGNED_EXPONENT_BITS-1, 0)

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
    io.out.fraction := abShiftedProduct(FRAC_PRODUCT_BITS-2, FRAC_PRODUCT_BITS-2-LOCAL_FRACTION_BITS)
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

