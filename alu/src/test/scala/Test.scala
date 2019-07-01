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
    val ctrl = Input(UInt(3.W))
  })
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
  when(cnt > 8.U) {
    countOn := true.B
    io.b := cnt2
  } .otherwise {
    countOn := false.B
    io.b := 1.U
  }
  
  io.a := cnt
 
  val aIn = RegNext(io.a, 0.U)
  val bIn = RegNext(io.b, 0.U)
  val prodIn = RegNext(io.prod, false.B)
  val ovflIn = RegNext(io.ovfl, false.B)
  val zeroIn = Wire(Bool()) // RegNext(io.zero, false.B)
  zeroIn := io.zero
  val negIn = Wire(Bool()) // RegNext(io.neg, false.B)
  negIn := io.neg
  val ctrlIn = RegNext(io.ctrl, 0.U)
  val passThrough::add::subtract::multiply::divide::and::or::xor::Nil = Enum(8)
  printf("negative and overflow flags are based on 2's comp numbers, although ALU is currently definied with UInt") 
  when(true.B) {
     
     when(ctrlIn === passThrough) {
        printf("passThrough \n")
     } .elsewhen(ctrlIn === add) {
        printf("add \n")
     } .elsewhen(ctrlIn === subtract) {
        printf("subtract \n")
     } .elsewhen(ctrlIn === multiply) {
        printf("multiply \n")
     } .elsewhen(ctrlIn === divide) {
        printf("divide \n")
     } .elsewhen(ctrlIn === and) {
        printf("and \n")
        printf("%b &\n%b = \n%b \n", aIn, bIn, io.y)
     } .elsewhen(ctrlIn === or) {
        printf("or \n")
        printf("%b |\n%b = \n%b \n", aIn, bIn, io.y)
     } .elsewhen(ctrlIn === xor) {
        printf("xor \n")
        printf("%b ^\n%b = \n%b \n", aIn, bIn, io.y)
     } .otherwise {
        printf(" \n")
     }

    when((ctrlIn =/= or) && (ctrlIn =/= and) && (ctrlIn =/= xor)) {    
        printf("a:%d b:%d result:%d prod:%d \novfl:%d zero:%d neg:%d \n \n", aIn, bIn, io.y, prodIn, ovflIn, zeroIn, negIn ) 
    } .otherwise {
      printf("\n")
    }
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
  val (ctrlCount,_) = Counter(true.B, 8)
  alu.io.ctrl := ctrlCount
  gen.io.ctrl := ctrlCount
  
}

object Elaborate extends App {
  chisel3.Driver.execute(args, () => new Test)
}
