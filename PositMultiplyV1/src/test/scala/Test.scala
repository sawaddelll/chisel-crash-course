package example.test

import chisel3._
import chisel3.util._

import example._

class DataGen(width: Int = 8,  es: Int = 1) extends Module {
  val io = IO(new Bundle {
    val a = Output(new UnpackedPosit(width = 8, es = 1)).asOutput
    val b = Output(new UnpackedPosit(width = 8, es = 1)).asOutput
  })
  

  io.a.isZero  := 0.U
  io.a.isInf   := 0.U
  io.a.sign    := 0.U

  io.b.sign  := 0.U
  io.b.isInf   := 0.U
  io.b.isZero  := 0.U

  io.a.exponent := 14.U(5.W)
  io.a.fraction := 4.U(4.W)

  io.b.exponent := 15.U(5.W)
  io.b.fraction := 0.U(4.W)
}

class Test extends Module {
  val io = IO(new Bundle {})
  val gen = Module(new DataGen(width = 8, es = 1))
  val multiply = Module(new PositMultiply(width = 8,es = 1, trailing_bits = 2))
  multiply.io.a <> gen.io.a
  multiply.io.b <> gen.io.b
  
  val trailingBits = Wire(UInt(2.W))
  val stickyBit = Wire(UInt(1.W))
  
  trailingBits := multiply.io.trailingBits
  stickyBit := multiply.io.stickyBit

  val output = Wire(new UnpackedPosit(8, 1))

  output <> multiply.io.out

//  while(true) {
    printf("a.exponent is %b \n",gen.io.a.exponent)
    printf("a.fraction is %b \n", gen.io.a.fraction)
    printf("b.exponent is %b \n", gen.io.b.exponent)
    printf("b.fraction is %b \n", gen.io.b.fraction)
  
    printf("out.sign is %b \n", multiply.io.out.sign)
    printf("out.isZero is %b \n", multiply.io.out.isZero)
    printf("out.isInf is %b \n", multiply.io.out.isInf)

    printf("out.trailingBits is %b \n", trailingBits)
    printf("out.stickyBit is %b \n", stickyBit)

    printf("out.exponent is %b \n", multiply.io.out.exponent)
    printf("out.fraction is %b \n", multiply.io.out.fraction)

 // }

}

object Elaborate extends App {
  chisel3.Driver.execute(args, () => new Test)
}
