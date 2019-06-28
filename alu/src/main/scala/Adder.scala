package example

import chisel3._
import chisel3.util._


class ALU(dataBits: Int = 8) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(dataBits.W))
    val b = Input(UInt(dataBits.W))
    val ctrl = Input(UInt(3.W))
    val result = Output(UInt(dataBits.W))
    val negative = Output(Bool())
    val zero = Output(Bool()) 
    val overflow = Output(Bool())
    val product = Output(UInt((dataBits*2).W))
  })
  val out = Wire(UInt(dataBits.W))
  io.negative := io.result(dataBits-1)
  io.zero     := ~(io.result.orR)
  val addition = io.a + io.b
  val storedValue  = RegNext(out, 0.U)
  storedValue := out
  val passThrough::add::subtract::multiply::divide::and::or::xor::Nil = Enum(8)
  io.product := 0.U((2*dataBits).W)
  when(io.ctrl === passThrough) {
    out := io.a
  } .elsewhen(io.ctrl === add) {
    out := io.a + io.b
  } .elsewhen(io.ctrl === subtract) {
    out := io.a - io.b
  } .elsewhen(io.ctrl === multiply) {
    io.product := io.a * io.b
    out := io.product
  } .elsewhen(io.ctrl === divide) {
    out := io.a / io.b
  } .elsewhen(io.ctrl === and) {
    out := io.a & io.b
  } .elsewhen(io.ctrl === or) {
    out := io.a | io.b
  } .elsewhen(io.ctrl === xor) {
    out := io.a ^ io.b
  } .otherwise {
    out := 0.U(dataBits.W)
  }

  io.result := storedValue
  io.overflow := (io.a(dataBits-1) === io.b(dataBits-1)) && (out(dataBits-1) =/= io.a(dataBits-1))
}

object Elaborate extends App {
  chisel3.Driver.execute(args, () => new ALU)
}
