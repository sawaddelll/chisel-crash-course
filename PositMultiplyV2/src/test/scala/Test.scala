package example.test

import chisel3._
import chisel3.util._

import example._

class DataGen(width: Int = 8,  es: Int = 1) extends Module {
  val io = IO(new Bundle {
    val a = Output(new UnpackedPosit(width = width, es = es))
    val b = Output(new UnpackedPosit(width = width, es = es))
  })


  /*TESTING 5 * 8 = 40
  01100010 * 01101000 = 01110101

   */
  val aPacked = Wire(new PackedPosit(width = width, es = es))
  val aBits = Bits("b01100010")
  //aBits := 01100010.Bits
  aPacked.bits := aBits

  val bPacked = Wire(new PackedPosit(width = width, es = es))
  val bBits = Bits("b01101000")
  //aBits := 01100010.Bits
  bPacked.bits := bBits
  
  val decoding = Module(new PositDecode(width = width, es = es))
  decoding.io.in := aPacked
  io.a := decoding.io.out

  val decodingB = Module(new PositDecode(width = width, es = es))
  decodingB.io.in := bPacked
  io.b := decodingB.io.out
}

class Test extends Module {
  val io = IO(new Bundle {})
  val width: Int = 8
  val es: Int = 1
  val gen = Module(new DataGen(width, es))
  val multiply = Module(new PositMultiply(width, es, trailing_bits = 2))
  multiply.io.a <> gen.io.a
  multiply.io.b <> gen.io.b
  
  val encodingInputA = Module(new PositEncode(width = width, es))
  encodingInputA.io.in := gen.io.a
  val aValue = Wire(new PackedPosit(width = width, es = es))
  aValue <> encodingInputA.io.out

  val encodingInputB = Module(new PositEncode(width = width, es))
  encodingInputB.io.in := gen.io.b
  val bValue = Wire(new PackedPosit(width = width, es = es))
  bValue <> encodingInputB.io.out

  val encodingOutput = Module(new PositEncode(width = width, es))
  encodingOutput.io.in := multiply.io.out
  val outputValue = Wire(new PackedPosit(width = width, es = es))
  outputValue <> encodingOutput.io.out

  val trailingBits = Wire(UInt(8.W))
  val stickyBit = Wire(UInt(1.W))

  trailingBits := multiply.io.trailingBits
  stickyBit := multiply.io.stickyBit

  val output = Wire(new UnpackedPosit(8, 1))

  output <> multiply.io.out

  //while(true) {
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
    
    printf("a is %b", aValue.bits)
    printf("b is %b", bValue.bits)
    printf("out is %b", outputValue.bits)

  //}

}

object Elaborate extends App {
  chisel3.Driver.execute(args, () => new Test)
}
