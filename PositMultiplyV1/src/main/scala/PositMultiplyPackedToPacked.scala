// See README.md for license details.
//package PositMultiply
package example

//import PositDef._
import chisel3._
import chisel3.util._
import chisel3.core.Bundle

class PositMultiplyPackedToPacked(width: Int = 8, es: Int = 1, trailing_bits: Int = 2) extends Module {
  val io = IO(new Bundle{
    val a = Input(new PackedPosit(width = width, es = es))
    val b = Input(new PackedPosit(width = width, es = es))
    val out = Output(new PackedPosit(width = width, es = es))
    val trailingBits = Output(UInt(trailing_bits.W))
    val stickyBit = Output(UInt(1.W))
  })

  val decA = Wire(new UnpackedPosit(width, es))
  val decB = Wire(new UnpackedPosit(width, es))
  val decOut = Wire(new UnpackedPosit(width, es))
  //val roundOut = Wire(new UnpackedPosit(width, es))

  val decodeA = Module(new PositDecode(width, es))
  decodeA.io.in := io.a
  decA := decodeA.io.out

  val decodeB = Module(new PositDecode(width, es))
  decodeB.io.in := io.b
  decB := decodeB.io.out

  val multiply = Module(new PositMultiply(width, es, trailing_bits = trailing_bits))
  multiply.io.a := decA
  multiply.io.b := decB
  decOut := multiply.io.out
  io.trailingBits := multiply.io.trailingBits
  io.stickyBit := multiply.io.stickyBit
  /*
  val round = Module(new PositRoundToNearestEven(width, es))
  round.io.in := decOut
  round.io.trailingBits := io.trailingBits
  round.io.stickyBit := io.stickyBit
  roundOut := round.io.out
  */
  val encode = Module(new PositEncode(width, es))
  encode.io.in := decOut
  io.out := encode.io.out


}
