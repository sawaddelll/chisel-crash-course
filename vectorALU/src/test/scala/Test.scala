package example.test

import chisel3._
import chisel3.util._

import example._

class DataGen(dataBits: Int = 8,  vLength: Int = 1) extends Module {
  val io = IO(new Bundle {
    val a = Output(Vec(vLength, UInt(dataBits.W)))
    val b = Output(Vec(vLength, UInt(dataBits.W)))
    val y = Input(Vec(vLength, UInt(dataBits.W)))
                    
    val ovfl = Input(Bool())
    val zero = Input(Bool())
    val neg = Input(Bool())
    val ctrl = Input(UInt(3.W))
  })
  var i = 0
  for(i <- 0 until vLength) {
    io.a(i) := 0.U
    io.b(i) := 0.U
  }
  
  val (cntcnt, _) = Counter(true.B, 4)
  val slowclk = Wire(Bool())
  when(cntcnt%2.U === 0.U) {
    slowclk := true.B 
  } .otherwise {
    slowclk := false.B
  }
  val (cnt, _) = Counter(slowclk, 256)
  val countOn = Wire(Bool())
  val (cnt2, _) = Counter(countOn, 256)
  val (rowCnt, _) = Counter(true.B, vLength - 1)
  when(cnt > 8.U) {
    countOn := true.B
    io.b(rowCnt) := cnt2
  } .otherwise {
    countOn := false.B
    io.b(rowCnt) := 1.U
  }
  
  io.a(rowCnt) := cnt
  
 
  val aIn = RegNext(io.a)
  val bIn = RegNext(io.b)
  val ovflIn = RegNext(io.ovfl, false.B)
  val zeroIn = Wire(Bool()) // RegNext(io.zero, false.B)
  zeroIn := io.zero
  val negIn = Wire(Bool()) // RegNext(io.neg, false.B)
  negIn := io.neg
  val ctrlIn = RegNext(io.ctrl, 0.U)
  val passThrough::add::subtract::and::or::xor::Nil = Enum(6)
  // printf("negative and overflow flags are based on 2's comp numbers, although ALU is currently definied with UInt") 
  when(true.B) {
     
     when(ctrlIn === passThrough) {
        printf("passThrough \n")
     } .elsewhen(ctrlIn === add) {
        printf("add \n")
     } .elsewhen(ctrlIn === subtract) {
        printf("subtract \n")
     } .elsewhen(ctrlIn === and) {
        printf("and \n")
        printf("%b &\n%b = \n%b \n", aIn(0), bIn(0), io.y(0))
     } .elsewhen(ctrlIn === or) {
        printf("or \n")
        printf("%b |\n%b = \n%b \n", aIn(0), bIn(0), io.y(0))
     } .elsewhen(ctrlIn === xor) {
        printf("xor \n")
        printf("%b ^\n%b = \n%b \n", aIn(0), bIn(0), io.y(0))
     } .otherwise {
        printf(" \n")
     }

    when((ctrlIn =/= or) && (ctrlIn =/= and) && (ctrlIn =/= xor)) {    
      printf(p"a is $aIn\n"); printf(p"b is $bIn\n"); printf(p"y is ${io.y} \n");
      printf("ovfl:%d zero:%d neg:%d \n \n", ovflIn, zeroIn, negIn ) 
    } .otherwise {
      printf("\n")
    }
  } 
  
}

class Test extends Module {
  val io = IO(new Bundle {})
  val gen = Module(new DataGen(8, 2))
  val alu = Module(new ALU(8, 2))
  alu.io.a := gen.io.a
  alu.io.b := gen.io.b
  gen.io.y := alu.io.result
  gen.io.ovfl := alu.io.overflow
  gen.io.zero := alu.io.zero
  gen.io.neg := alu.io.negative
  val (ctrlCount,_) = Counter(true.B, 6)
  alu.io.ctrl := ctrlCount
  gen.io.ctrl := ctrlCount
  
}

object Elaborate extends App {
  chisel3.Driver.execute(args, () => new Test)
}
