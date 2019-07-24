package example.test

import chisel3._
import chisel3.util._

import example._

class DataGen(width: Int = 8,  es: Int = 1) extends Module {
  val io = IO(new Bundle {
    val a = Output(new UnpackedPosit(width = 8, es = 1))
    val b = Output(new UnpackedPosit(width = 8, es = 1))
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
  val width : Int = 8
  val es: Int = 1
  val gen = Module(new DataGen(width = 8, es = 1))
  val multiply = Module(new PositMultiply(width = 8,es = 1, trailing_bits = 2))
  multiply.io.a <> gen.io.a
  multiply.io.b <> gen.io.b
  
  val encodeTestA = Module(new PositEncode(width = width, es = es))
  encodeTestA.io.in := gen.io.a
  val aPacked = Wire(new PackedPosit(width = width, es = es))
  aPacked := encodeTestA.io.out
  
  val decodeTestA = Module(new PositDecode(width = width, es = es))
  decodeTestA.io.in := aPacked
  val aUnpacked = Wire(new UnpackedPosit(width = width, es = es))
  aUnpacked := decodeTestA.io.out
  
  val encodeTestB = Module(new PositEncode(width = width, es = es))
  encodeTestB.io.in := gen.io.b
  val bPacked = Wire(new PackedPosit(width = width, es = es))
  bPacked := encodeTestB.io.out
  
  val decodeTestB = Module(new PositDecode(width = width, es = es))
  decodeTestB.io.in := bPacked
  val bUnpacked = Wire(new UnpackedPosit(width = width, es = es))
  bUnpacked := decodeTestB.io.out
  
  val cPacked = Wire(new PackedPosit(width = width, es = es))
  cPacked.bits := 64.U
  
  val decodeTestC = Module(new PositDecode(width = width, es = es))
  decodeTestC.io.in := cPacked
  val cUnpacked = Wire(new UnpackedPosit(width = width, es = es))
  cUnpacked := decodeTestC.io.out
  
  val trailingBits = Wire(UInt(2.W))
  val stickyBit = Wire(UInt(1.W))
  
  trailingBits := multiply.io.trailingBits
  stickyBit := multiply.io.stickyBit

  val output = Wire(new UnpackedPosit(8, 1))

  output <> multiply.io.out
  
  
  val countingZeros = Module(new CountLeadingZeros(WIDTH = width - 2, ADD_OFFSET = 0))
  val countTest = Wire(UInt((width-2).W))
  countTest := 7.U((width-2).W)
  countingZeros.io.in := countTest
  val countOutput = Wire(UInt(width.W))
  countOutput := countingZeros.io.out

//for(i <- 0 to 10000) {//  while(true) {
    printf("a.exponent is %b \n",gen.io.a.exponent)
    printf("a.fraction is %b \n", gen.io.a.fraction)
    printf("b.exponent is %b \n", gen.io.b.exponent)
    printf("b.fraction is %b \n", gen.io.b.fraction)
  
    printf("aPacked is %b \n", aPacked.bits)
    printf("now testing decoding for packed a... \n")
    printf("sign is %b \n", aUnpacked.sign)
    printf("isInf is %b \n", aUnpacked.isInf)
    printf("isZero is %b \n", aUnpacked.isZero)
    printf("exponent is %b \n", aUnpacked.exponent)
    printf("fraction is %b \n", aUnpacked.fraction)
    printf("\n")
    printf("bPacked is %b \n", bPacked.bits)
    printf("now testing decoding for packed b... \n")
    printf("sign is %b \n", bUnpacked.sign)
    printf("isInf is %b \n", bUnpacked.isInf)
    printf("isZero is %b \n", bUnpacked.isZero)
    printf("exponent is %b \n", bUnpacked.exponent)
    printf("fraction is %b \n", bUnpacked.fraction)
    printf("\n")

  
    printf("now testing decoding for packed 1... \n")
    printf("sign is %b \n", cUnpacked.sign)
    printf("isInf is %b \n", cUnpacked.isInf)
    printf("isZero is %b \n", cUnpacked.isZero)
    printf("exponent is %b \n", cUnpacked.exponent)
    printf("fraction is %b \n", cUnpacked.fraction)
    printf("\n")
    printf("counting leading zeros of %b \n", countTest)
    printf("output is %d \n", countOutput)
    printf("\n")
  
    printf("out.sign is %b \n", multiply.io.out.sign)
    printf("out.isZero is %b \n", multiply.io.out.isZero)
    printf("out.isInf is %b \n", multiply.io.out.isInf)
    printf("out.trailingBits is %b \n", trailingBits)
    printf("out.stickyBit is %b \n", stickyBit)

    printf("out.exponent is %b \n", multiply.io.out.exponent)
    printf("out.fraction is %b \n", multiply.io.out.fraction)
      
//}// }

}

object Elaborate extends App {
  chisel3.Driver.execute(args, () => new Test)
}
