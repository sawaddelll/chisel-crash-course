// See README.md for license details.
//package PositDef
package example

import chisel3._
//import chisel3.util._
import chisel3.core.Bundle
//import PositDef._

class UnpackedPosit (width: Int, es : Int) extends Bundle {
  val isZero = Bool()
  val isInf  = Bool()
  val sign   = Bool()
  val exponent = UInt(PositDef.getUnsignedExponentBits(width, es).W) //.5.W/
  val fraction = UInt(PositDef.getFractionBits(width, es).W) //4.W

  override def cloneType =
    new UnpackedPosit(width, es).asInstanceOf[this.type]

}

object UnpackedPositFunctions {
  def signedRegime(unpackedPosit: UnpackedPosit, width: Int, es: Int): SInt = {
    val BITS: Int = PositDef.getUnsignedRegimeBits(width)
    val answer = Wire(SInt(PositDef.getSignedRegimeBits(width).W))
    answer := (unpackedPosit.exponent(PositDef.getUnsignedExponentBits(width, es) - 1, es) -
      PositDef.getMaxSignedRegime(width).asUInt).asSInt()
    return answer
  }
  
  def unsignedRegime(unpackedPosit: UnpackedPosit, width: Int, es: Int): UInt = {
    val answer = Wire(UInt(PositDef.getUnsignedRegimeBits(width).W))
    answer := unpackedPosit.exponent(PositDef.getUnsignedExponentBits(width, es)-1, 0)
    return answer
  }
}
