// See README.md for license details.
//package PositMultiply
package example
//import PositDef._ //changed all to example package
import chisel3._
import chisel3.util._
import chisel3.core.Bundle

class PositDecode(width: Int = 8, es: Int = 1) extends Module{
  val io = IO(new Bundle{
    val in = Input(new PackedPosit(width, es))
    val out = Output(new UnpackedPosit(width, es))
  })

  val LOCAL_MAX_REGIME_FIELD_SIZE: Int = PositDef.getMaxRegimeFieldSize(width)
  val LOCAL_MAX_SIGNED_REGIME: Int = PositDef.getMaxSignedRegime(width)
  val LOCAL_UNSIGNED_REGIME_BITS: Int = PositDef.getUnsignedRegimeBits(width)
  val LOCAL_UNSIGNED_EXPONENT_BITS: Int = PositDef.getUnsignedExponentBits(width, es)
  val LOCAL_FRACTION_BITS: Int = PositDef.getFractionBits(width, es)

  // Bits after the sign, with the sign adjusted via 2s complement
  val remainderBits = Wire(UInt(LOCAL_MAX_REGIME_FIELD_SIZE.W))

  // For determining the regime, we use a leading zero counter on the xor of
  // neighboring bits in the input, to determine where the 0 -> 1 or 1 -> 0
  // transition occurs, and thus the regime
  val remainderXor = Wire(UInt((LOCAL_MAX_REGIME_FIELD_SIZE-1).W))
  val remainderXorVec = Wire(Vec(LOCAL_MAX_REGIME_FIELD_SIZE-1, Bool()))

  // The count of leading zeros of the above
  val cl0 = Wire(UInt(PositDef.clog2(LOCAL_MAX_REGIME_FIELD_SIZE).W))

  // Whether the regime is positive or negative depends upon the first non-sign
  // bit in the input
  val regimePosOrZero = Wire(UInt(1.W))

  // Are we +/- inf or zero?
  val isSpecial = Wire(UInt(1.W))

  // Calculated regime value starting from 0
  val unsignedRegime = Wire(UInt(LOCAL_UNSIGNED_REGIME_BITS.W))

  // How far we need to shift our word for the ES and fraction bits
  val regimeShiftMinus2 = Wire(UInt(PositDef.clog2(LOCAL_MAX_REGIME_FIELD_SIZE).W))

  // remainderBits, skipping first two bits (min size of a regime excoding),
  // shifted by extra regime bits
  val esAndFractionBits = Wire(UInt((LOCAL_MAX_REGIME_FIELD_SIZE-2).W))

  // Our extracted fraction //TODO-This was unused in the Verilog module, why is it here?
  //val fractionBits = Wire(UInt(LOCAL_FRACTION_BITS.W))

  for(i <- LOCAL_MAX_REGIME_FIELD_SIZE-1 until 0 by -1) {
    remainderXorVec(i - 1) := remainderBits(i) ^ remainderBits(i - 1)
  }
  
  //Changed above for loop to affect a Vec, remainderXorVec, because chisel won't allow assigning to partial bits of a value
  //assign remainderXor to remainderXorVec and use remainderXor everywhere else
  remainderXor := remainderXorVec.asUInt 
  

  //TODO: TEST CountLeadingZeros Module, that takes in remainderXor and outputs cl0
  //Verilog: CountLeadingZeros #(.WIDTH(LOCAL_MAX_REGIME_FIELD_SIZE - 1)) clz(.in(remainderXor), .out(cl0))
  val countingLeadingZeros = Module(new CountLeadingZeros(WIDTH = LOCAL_MAX_REGIME_FIELD_SIZE - 1))
  countingLeadingZeros.io.in := remainderXor
  cl0 := countingLeadingZeros.io.out

  //Shift Left is made into its own module in Verilog, only for purposes of tracking resource usage
  esAndFractionBits := remainderBits(LOCAL_MAX_REGIME_FIELD_SIZE-3, 0) << regimeShiftMinus2

  // FIXME: I've changed the posit layout to not be symmetric, to have simpler decoding
  remainderBits := io.in.bits(width - 2, 0)

  regimePosOrZero := remainderBits(LOCAL_MAX_REGIME_FIELD_SIZE - 1)

  isSpecial := !remainderBits.orR

  //added this because extending in one line where also negating or adding did not work
  val cl0extended = Wire(UInt(LOCAL_UNSIGNED_REGIME_BITS.W))
  cl0extended := cl0//(LOCAL_UNSIGNED_REGIME_BITS.W) //trying to change this width?

  when (isSpecial === 1.U) {
    unsignedRegime := 0.U(LOCAL_UNSIGNED_REGIME_BITS.W)
  } .otherwise {
    when ((regimePosOrZero === 1.U).asBool()) {
      unsignedRegime := cl0extended
      //printf("unsignedRegime is %b (statement by unReg assignment)", unsignedRegime)
    } .otherwise {
      //is ~ actually wrong, or just intelliJ?????????????????????????
      unsignedRegime := LOCAL_MAX_SIGNED_REGIME.U/*(LOCAL_UNSIGNED_REGIME_BITS.W)*/ + ~cl0/*extended*/
      //printf("unsignedRegime is %b (statement by unReg assignment)", unsignedRegime)
    }
    
  }

  // Can we just do this?
  // signedRegime = regPosOrZero ? cl0 : ~cl0
  // unsignedRegime = signedRegime + LOCAL_MAX_SIGNED_REGIME

  // The number of bits to encode the regime is really
  // min(max(cl0, cl1) + 1, LOCAL_MAX_REGIME_FIELD_SIZE):
  //
  // Regime containing all 0s is either 0 or +/- inf
  // For WIDTH = 5, LOCAL_MAX_REGIME_FIELD_SIZE = 4:
  //
  //  0 or +/- inf
  //             |    min representable exponent
  //             v    v
  // encoding 0000 0001 001x 01xx 10xx 110x 1110 1111
  // sgn regime  x   -3   -2   -1    0    1    2    3
  // uns regime  x    0    1    2    3    4    5    6
  // cl0(xor)    3    2    1    0    0    1    2    3
  // regime bits 4    4    3    2    2    3    4    4
  //
  // However, we use the count of the regime bits to shift our
  // word into place to extract the ES and fraction bits.
  // Note that at the extreme positive and negative regime, we are
  // consuming all bits in the word, so we needn't take into
  // account the outer min.
  // The leading zero counter effectively produces the regime shift - 2.
  // The regime at least takes up two bits, so this is perfect.

  regimeShiftMinus2 := cl0 // the larger of the two, as one is always zero

  io.out.isInf := io.in.bits(width - 1) && isSpecial.asBool()
  io.out.isZero := !io.in.bits(width - 1) && isSpecial.asBool()
  io.out.sign := !isSpecial && io.in.bits(width - 1)

  if(es > 0) {
    // We have a ES to extract
    val esBits = Wire(UInt(es.W))
    // The entire ES field may not be present (it could be truncated),
    // but the shift above will ensure that we are only reading 0s for the
    // other values
    esBits := esAndFractionBits(LOCAL_MAX_REGIME_FIELD_SIZE-3, LOCAL_MAX_REGIME_FIELD_SIZE-3-es+1)

    io.out.fraction := esAndFractionBits(LOCAL_MAX_REGIME_FIELD_SIZE-3-es, 0)
    io.out.exponent := Cat(unsignedRegime, esBits)
    //printf("unsignedRegime is %b (statement by exp assignment)", unsignedRegime)

  } else {
    // There is no ES to extract
    io.out.fraction := esAndFractionBits(LOCAL_MAX_REGIME_FIELD_SIZE-3, 0)
    io.out.exponent := unsignedRegime//(LOCAL_UNSIGNED_EXPONENT_BITS.W) //trying to change width
  }
  
  printf("unsignedRegime is %b \n", unsignedRegime)
  printf("remainderXor is %b \n", remainderXor)
  printf("esAndFractionBits is %b \n", esAndFractionBits)
  printf("remainderBits is %b \n", remainderBits)
  printf("cl0 is %b \n", cl0)
  printf("~cl0 is %b \n", ~cl0)
  printf("LOCAL_MAX_SIGNED_REGIME is %b \n", LOCAL_MAX_SIGNED_REGIME.U)
  printf("regimeShiftMinus2 is %b \n", regimeShiftMinus2)
  printf("regimePosOrZero is %b \n", regimePosOrZero)
  printf("LOCAL_MAX_REGIME_FIELD_SIZE is %b \n", LOCAL_MAX_REGIME_FIELD_SIZE.U)
  

}
