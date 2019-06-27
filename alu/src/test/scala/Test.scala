package example.test

import chisel3._
import chisel3.util._

import example._

class DataGen(dataBits: Int = 8) extends Module {
  val io = IO(new Bundle {
    val a = Output(UInt(dataBits.W))
    val b = Output(UInt(dataBits.W))
    val y = Input(UInt(dataBits.W))
    val prod = Input(UInt((dataBits*2).W))
    val ovfl = Input(Bool())
    val zero = Input(Bool())
    val neg = Input(Bool())
  })

  val (cnt, _) = Counter(true.B, 256)

  io.a := cnt
  io.b := cnt % 2.U

  when(true.B) {
    printf("a:%x b:%x result:%x prod:%x ovfl:%x zero:%x neg:%x \n", io.a, io.b, io.y, io.prod, io.ovfl, io.zero, io.neg ) 
  }
}

class Test extends Module {
  val io = IO(new Bundle {})
  val gen = Module(new DataGen)
  val alu = Module(new ALU)
  alu.io.a := gen.io.a
  alu.io.b := gen.io.b
  gen.io.y := alu.io.result
  gen.io.prod := alu.io.product
  gen.io.ovfl := alu.io.overflow
  gen.io.zero := alu.io.zero
  gen.io.neg := alu.io.negative
  alu.io.ctrl := gen.io.a % 8.U
  
}

object Elaborate extends App {
  chisel3.Driver.execute(args, () => new Test)
}
