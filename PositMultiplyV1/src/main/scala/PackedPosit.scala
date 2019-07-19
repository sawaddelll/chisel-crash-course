// See README.md for license details.
//package PositDef

//for lazy testing
package example
import chisel3._
import chisel3.core.Bundle
import chisel3.util._

class PackedPosit (width: Int, es : Int) extends Bundle {
  val bits = UInt(width.W)

  override def cloneType =
    new PackedPosit(width, es).asInstanceOf[this.type]
}

object PackedPositFunctions {
  def zeroPackedBits(width: Int): UInt =
    0.U(width.W)

  def infPackedBits(width: Int): UInt =
    Cat(1.U(1.W), 0.U((width-1).W))


}



