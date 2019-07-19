// See README.md for license details.
//package PositDef
package example

import chisel3._
import chisel3.util._
import chisel3.core.Bundle
import scala.math._

object PositDef {

  def getMaxRegimeFieldSize(width: Int): Int =
    width - 1

  def getMaxSignedRegime(width: Int): Int =
    getMaxRegimeFieldSize(width) - 1

  def getMinSignedRegime(width: Int): Int =
    -getMaxSignedRegime(width)

  def clog2(x: Double): Int = { require(x > 0); ceil(log(x)/log(2)).toInt }

  def log2(x: Double): Int = { require(x > 0); floor(log(x)/log(2)).toInt }

  def largestPowerOf2Divisor(x: Int): Int = pow(2, clog2(x) - 1).toInt

  // Number of bits to encode the regime in signed form
  // i.e., signed regime is from -15 .. 15 => clog2(15 + 1) + 1 -> 5 bits
  // -16 .. 16 => clog2(16 + 1) -> 6 bits
  def getSignedRegimeBits(width: Int): Int =
    clog2(getMaxSignedRegime(width) + 1) + 1

  // Number of bits to encode the regime with bias
  // The 000... regime encoding case is not a valid regime. The unsigned case
  // takes the same number of bits as the signed case
  def getUnsignedRegimeBits(width: Int): Int =
    getSignedRegimeBits(width)

  // Maximum zero-based regime value
  // i.e., the regime with MAX_SIGNED_EXPONENT / MAX_UNSIGNED_EXPONENT
  def getMaxUnsignedRegime(width: Int): Int =
    getMaxSignedRegime(width) * 2

  // Minimum zero-based regime value
  // i.e., the regime with MIN_SIGNED_EXPONENT
  def getMinUnsignedRegime(width: Int): Int =
    0

  // Minimum and maximum exponent representable by this posit type
  // e.g., WIDTH = 8 => -2^1 * 6 = -12
  // (all 7 0s is either zero or +/- inf)
  def getMinSignedExponent(width: Int, es: Int): Int =
    pow(2, es).toInt * getMinSignedRegime(width)

  // e.g., WIDTH = 8 => 2^1 * 6 = 12
  def getMaxSignedExponent(width: Int, es: Int): Int =
    pow(2, es).toInt * getMaxSignedRegime(width)

  def getMinUnsignedExponent(width: Int, es: Int): Int =
    0

  def getMaxUnsignedExponent(width: Int, es: Int): Int =
    pow(2, es).toInt * getMaxUnsignedRegime(width)

  // Bias to add to convert a signed exponent to an unsigned
  // exponent, or to subtract for converting an unsigned exponent to
  // a signed exponent
  def getExponentBias(width: Int, es: Int): Int =
    pow(2, es).toInt * getMaxSignedRegime(width)

  // Number of bits to maintain our exponent count including the bias
  // ES always defines the low order bits
  def getUnsignedExponentBits(width: Int, es: Int): Int =
    getUnsignedRegimeBits(width) + es

  // If we were to represent our exponent as a signed number, this is
  // the number of bits we need to represent it
  def getSignedExponentBits(width: Int, es: Int): Int =
    getUnsignedExponentBits(width, es)

  // Maximum fraction bits is WIDTH - 1 - 2 - ES
  // (-1 sign bit, -2 regime encoding, -ES field width)
  // If this is 0 (the posit type is too small to possess a
  // fraction), just use 1
  def getFractionBits(width: Int, es: Int): Int =
    if (width - 1 -2 - es <= 0) {
        1
    } else {
      width - 1 - 2 - es
    }

  // For code that is agnostic to ES == 0
  def getESBits(width: Int, es: Int): Int =
    if (es > 1) {
      es
    } else {
      1
    }

  // Number of bits that represent the product of two posit fractions with a
  // leading 1 (used for quire accumulation)
  // FIXME: if the max exponent * 2 can fit in the same number of bits, we
  // don't need to make this a bit larger
  def getExpProductBits(width: Int, es: Int): Int =
    getUnsignedExponentBits(width, es) + 1

  def getFracProductBits(width: Int, es: Int): Int =
    (getFractionBits(width, es) + 1) * 2

  // The size in bits of an unpacked posit
  def getUnpackedStructSize(width: Int, es: Int): Int =
  // isZero, isInf, sign
    3 + getUnsignedExponentBits(width, es) + getFractionBits(width, es)



}


// Pads an input with zeros on the right, handles cases where no padding is
// required too (thus, this can't be done with the Verilog concatenation
// operator as it would result in zero-sized fields)
class ZeroPadRight(inWidth: Int = 8, outWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(inWidth.W))
    val out = Output(UInt(outWidth.W))
  })

  def getPosDifference(outWidth: Int, inWidth: Int): Int =
    if(outWidth - inWidth <0) {
      0
    } else {
      outWidth - inWidth
    }


  val DIFF = getPosDifference(outWidth, inWidth)
  if (inWidth > outWidth) {
    io.out := io.in(inWidth-1, inWidth-1-outWidth)
  } else if (inWidth == outWidth) {
    io.out := io.in
  } else {
    io.out := Cat(io.in, 0.U(DIFF.W))
  }

}

class ShiftRightSticky(OUT_WIDTH: Int = 8, IN_WIDTH: Int = 8, SHIFT_VAL_WIDTH: Int = PositDef.clog2(8 + 1))
  extends Module { //TODO: SHIFT_VAL_WIDTH should be based on OUT_WIDTH, not 8

  val io = IO(new Bundle {
    val in = Input(UInt(IN_WIDTH.W))
    val shift = Input(UInt(SHIFT_VAL_WIDTH.W))
    val out = Output(UInt(OUT_WIDTH.W))
    val sticky = Output(UInt(1.W))
    val stickyAnd = Output(UInt(1.W))
  })

  //TODO: this is supposed to be module parameter, but those can't seem to refer to other module parameters as needed
  val SHIFT_MAX: Int = pow(2, SHIFT_VAL_WIDTH).toInt - 1

  val NUM_STEPS: Int = if (SHIFT_MAX >= OUT_WIDTH) {
    PositDef.clog2(OUT_WIDTH)
  } else {
    PositDef.clog2(SHIFT_MAX)
  }
   
  val valVector = Wire(Vec(NUM_STEPS + 1, UInt(OUT_WIDTH.W)))
  val valVectorOfVecs = Wire(Vec(NUM_STEPS+1, Vec(OUT_WIDTH, Bool())))
  for (i <- NUM_STEPS-1 to 0 by -1) { //changed to "to 0" and added for loop for vectorOfVecs connecting to padding
    valVector(i) := valVectorOfVecs(i).asUInt
  }
  //valVectorOfVecs(0) := 0.U(2.W).asBools
    
  val valSticky = Wire(UInt((NUM_STEPS + 1).W))
  val valStickyVec = Wire(Vec(NUM_STEPS + 1, Bool()))
  valSticky := valStickyVec.asUInt
  
  val valStickyAnd = Wire(UInt((NUM_STEPS + 1).W))
  val valStickyAndVec = Wire(Vec(NUM_STEPS + 1, Bool()))
  valStickyAnd := valStickyAndVec.asUInt  
    
  val maxShift = Wire(UInt(1.W))

  val padding = Module(new ZeroPadRight(inWidth = IN_WIDTH, outWidth = OUT_WIDTH))
  padding.io.in := io.in
  //valVector(0) := padding.io.out
  for (i <- 0 to OUT_WIDTH-1) {
    valVectorOfVecs(0)(i) := padding.io.out(i)
  }
    
  if (IN_WIDTH <= OUT_WIDTH) {
    valStickyVec(0) := 0.U(1.W)
    valStickyAndVec(0) := 1.U(1.W)
  } else {
    valStickyVec(0) := io.in(IN_WIDTH - OUT_WIDTH - 1, 0).orR
    valStickyAndVec(0) := io.in(IN_WIDTH - OUT_WIDTH - 1, 0).andR
  }

  for (i <- 1 to NUM_STEPS) {
    for (j <- 0 until OUT_WIDTH) {
      if ((j + pow(2, i-1)) >= OUT_WIDTH) {
        if(io.shift(i-1) == 1.U) {
          valVectorOfVecs(i)(j) := 0.U(1.W)
        } else {
          valVectorOfVecs(i)(j) := valVector(i - 1)(j)
        }
      } else {
        if(io.shift(i-1) == 1.U) {
          valVectorOfVecs(i)(j) := valVector(i - 1)(j + pow(2, i-1).toInt) //////double??
        } else {
          valVectorOfVecs(i)(j) := valVector(i - 1)(j)
        }
      }
    }
    val stickyHelper = Wire(UInt(1.W))
    val stickyAndHelper = Wire(UInt(1.W))
    if(io.shift(i-1) == 1.U) {
      //TODO orReduce, and andReduce respectively, orR/andR not working for some reason
      stickyHelper := valVector(i-1)(pow(2, i-1).toInt - 1, 0).orR
      stickyAndHelper := valVector(i-1)(pow(2, i-1).toInt - 1, 0).andR
    } else {
      stickyHelper := 0.U
      stickyAndHelper := 1.U
    }
    valStickyVec(i) := valSticky(i - 1) | stickyHelper
    valStickyAndVec(i) := valStickyAnd(i-1) & stickyAndHelper

  }


  if (SHIFT_MAX < OUT_WIDTH) {
    io.out := valVector(NUM_STEPS)
    io.sticky := valSticky(NUM_STEPS)
    io.stickyAnd := valStickyAnd(NUM_STEPS)
  } else if (SHIFT_MAX == OUT_WIDTH) {
    maxShift := (io.shift === OUT_WIDTH.U)
    if (maxShift == 1.U) { //out
      io.out := 0.U(OUT_WIDTH.U)
      io.sticky := valVector(0).orR || valSticky(0)
      io.stickyAnd := valVector(0).andR && valStickyAnd(0)
    } else {
      io.out := valVector(NUM_STEPS)
      io.sticky := valSticky(NUM_STEPS)
      io.stickyAnd := valStickyAnd(NUM_STEPS)
    }

  } else {
    maxShift := (io.shift >= OUT_WIDTH.U)
    if (maxShift == 1.U) { //out
      io.out := 0.U(OUT_WIDTH.U)
      io.sticky := valVector(0).orR || valSticky(0)
      io.stickyAnd := valVector(0).andR && valStickyAnd(0)
    } else {
      io.out := valVector(NUM_STEPS)
      io.sticky := valSticky(NUM_STEPS)
      io.stickyAnd := valStickyAnd(NUM_STEPS)
    }
  }


}

class CountLeadingZerosTree(L: Int = 8, R: Int = 8) extends Module {
  val io = IO(new Bundle{
    val left = Input(UInt(L.W))
    val right = Input(UInt(R.W))
    val out = Output(UInt(PositDef.clog2(L+R+1).W))
  })
  // L is always a power of 2; R might not be
  val L2: Int = L >> 2 // L/2

  // The new L for the right-hand recursion should be a power of 2 as
  // well
  val R2A: Int = PositDef.largestPowerOf2Divisor(R)

  // floor(R / 2)
  val R2B: Int = R - R2A

  assert(L > 0)
  assert(R > 0)
  assert(PositDef.clog2(L) == PositDef.clog2(L+1) - 1)
  assert(L >= R)

  val lCount = Wire(UInt(PositDef.clog2(L+1).W))
  val rCount = Wire(UInt(PositDef.clog2(R+1).W))

  val rCountExtend = Wire(UInt(PositDef.clog2(L+1).W))
  val rCountExtendVec = Wire(Vec(PositDef.clog2(L+1), Bool()))///another VEC

  //rCountExtend(PositDef.clog2(R+1)-1, 0) := rCount
  //rCountExtendVec(PositDef.clog2(R+1)-1, 0) := rCount //this didn't work, because of range of values again????
  for (i <- PositDef.clog2(R+1)-1 to 0 by -1) {
    rCountExtendVec(i) := rCount(i)
  }
                             
  for (i <- PositDef.clog2(L+1)-1 until PositDef.clog2(R+1)-1 by -1) {
    rCountExtendVec(i) := 0.U(1.W)
  }
                             
  rCountExtend := rCountExtendVec.asUInt                 

  if (L >= 2) {
    val leftCount = Module(new CountLeadingZerosTree (L = L2, R = L2))
    leftCount.io.left := io.left(L-1, L-1-L2)
    leftCount.io.right := io.left(L2-1, 0)
    lCount := leftCount.io.out
  } else {
    lCount := ~io.left(0)
  }

  if (R >= 2) {
    val leftCount = Module(new CountLeadingZerosTree (L = R2A, R = R2B))
    leftCount.io.left := io.left(R-1, R-1-R2A)
    leftCount.io.right := io.left(R2B-1, 0)
    rCount := leftCount.io.out
  } else {
    rCount := ~io.right(0)
  }

  if(PositDef.clog2(L + 1) > 1) {
    when(lCount(PositDef.clog2(L+1)-1) && rCountExtend(PositDef.clog2(L+1)-1)) {
      io.out := Cat(1.U(1.W), 0.U((PositDef.clog2(L+R+1)-1).W))
    } .elsewhen(!lCount(PositDef.clog2(L+1) - 1)) {
      io.out := Cat(0.U(1.W), lCount)
    } .otherwise {
      io.out := Cat(1.U(2.W), rCountExtend(PositDef.clog2(L+1) - 2, 0))
    }
    // $display("%d %d: left %b right %b lcount %b rcount %b rcountext %b out %b",
    //          L, R, left, right, lCount, rCount, rCountExtend, out);

  } else {
    when(lCount(PositDef.clog2(L+1)-1) && rCountExtend(PositDef.clog2(L+1)-1)) {
      io.out := Cat(1.U(1.W), 0.U((PositDef.clog2(L+R+1)-1).W))
    } .elsewhen(!lCount(PositDef.clog2(L+1) - 1)) {
      io.out := Cat(0.U(1.W), lCount)
    } .otherwise {
      io.out := 1.U(2.W)
    }
    // $display("%d %d: left %b right %b lcount %b rcount %b rcountext %b out %b",
    //          L, R, left, right, lCount, rCount, rCountExtend, out);
  }

}

class CountLeadingZeros(WIDTH: Int = 6, ADD_OFFSET: Int = 0) extends Module {
  val io = IO(new Bundle{
    val in = Input(UInt(WIDTH.W))
    val out = Output(UInt(PositDef.clog2(WIDTH+1+ADD_OFFSET).W))
  })

  val L: Int = PositDef.largestPowerOf2Divisor(WIDTH + ADD_OFFSET)
  val R: Int = WIDTH + ADD_OFFSET - L

  assert(L >= R)
  assert(L > 0)
  assert(R > 0)

  val inPad = Wire(UInt((WIDTH+ADD_OFFSET).W))
  val inPadVec = Wire(Vec(WIDTH+ADD_OFFSET, Bool())) //another vector to handle single bit assignment

  for(i <- WIDTH+ADD_OFFSET-1 to WIDTH by -1) {
    inPadVec(i) := 0.U(1.W)
  }
  
  //inPadVec(WIDTH - 1, 0) := io.in
  for(i <- WIDTH - 1 to 0 by -1) {
    inPadVec(i) := io.in(i)
  }
  inPad := inPadVec.asUInt
  val tree = Module(new CountLeadingZerosTree(L = L, R = R))
  tree.io.left := inPad(WIDTH+ADD_OFFSET - 1, WIDTH+ADD_OFFSET - 1 - L)
  tree.io.right := io.in(R-1, 0)
  io.out := tree.io.out

}
