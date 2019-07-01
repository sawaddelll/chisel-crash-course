module Adder( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [7:0] io_a, // @[:@6.4]
  input  [7:0] io_b, // @[:@6.4]
  output [7:0] io_y // @[:@6.4]
);
  wire [8:0] _T_11; // @[Adder.scala 12:16:@8.4]
  assign _T_11 = io_a + io_b; // @[Adder.scala 12:16:@8.4]
  assign io_y = io_a + io_b; // @[Adder.scala 12:8:@10.4]
endmodule
