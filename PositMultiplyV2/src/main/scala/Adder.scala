package example

import chisel3._
import chisel3.util._


class ALU(dataBits: Int = 8, vLength: Int = 1) extends Module {
  val io = IO(new Bundle {
    val a = Input(Vec(vLength, UInt(dataBits.W)))
    val b = Input(Vec(vLength, UInt(dataBits.W)))   
    val ctrl = Input(UInt(3.W))
    val result = Output(Vec(vLength, UInt(dataBits.W)))
    val negative = Output(Bool())
    val zero = Output(Bool()) 
    val overflow = Output(Bool())
   // val product = Output(Vec(Seq.fill(vLength)(0.U((dataBits*2).W))))
    
  })

  val passThrough::add::subtract::and::or::xor::Nil = Enum(6)
  val max2comp = Wire(UInt(dataBits.W))
  max2comp := math.pow(2, dataBits-1).toInt.U
    val out =  Wire(Vec(vLength, UInt(dataBits.W)))
    val storedValue  = RegNext(out)
   // storedValue := out
    val overflowVector = Wire(Vec(vLength, Bool()))
    val zeroVector = Wire(Vec(vLength, Bool()))
    val negVector = Wire(Vec(vLength, Bool()))
    var i = 0
    for( i <- 0 until vLength) {
      when(io.ctrl === passThrough) {
        out(i) := io.a(i)
      } .elsewhen(io.ctrl === add) {
        out(i) := io.a(i) + io.b(i)
      } .elsewhen(io.ctrl === subtract) {
        out(i) := io.a(i) - io.b(i)
      // } .elsewhen(io.ctrl === multiply) {
       // io.product(i) := io.a(i) * io.b(i)
       //  out(i) := io.product(i)
      //} .elsewhen(io.ctrl === divide) {
      //  out(i) := io.a(i) / io.b(i)
      } .elsewhen(io.ctrl === and) {
        out(i) := io.a(i) & io.b(i)
      } .elsewhen(io.ctrl === or) {
        out(i) := io.a(i) | io.b(i)
      } .elsewhen(io.ctrl === xor) {
        out(i) := io.a(i) ^ io.b(i)
      } .otherwise {
        out(i) := 0.U(dataBits.W)
      }
      zeroVector(i) := ~(io.result(i).orR)
      negVector(i) := io.result(i)(dataBits-1)
    //  when(io.ctrl === multiply) {
    //    overflowVector(i) := (Cat(0.U(dataBits.W), out(i)) =/= io.product(i)) || (io.product(i) > max2comp(i))
    //  } .otherwise {
        overflowVector(i) := (io.a(i)(dataBits-1) === io.b(i)(dataBits-1)) && (out(i)(dataBits-1) =/= io.a(i)(dataBits-1))
    //  } 
    }
    io.result := storedValue
  //  io.result := out
    io.zero := !zeroVector.contains(false.B)
    io.overflow := overflowVector.contains(true.B)
    io.negative := negVector.contains(true.B)
}

object Elaborate extends App {
  chisel3.Driver.execute(args, () => new ALU)
}
