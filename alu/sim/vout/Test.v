module DataGen( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  output [7:0] io_a, // @[:@6.4]
  output [7:0] io_b, // @[:@6.4]
  input  [7:0] io_y // @[:@6.4]
);
  reg [7:0] value; // @[Counter.scala 26:33:@8.4]
  reg [31:0] _RAND_0;
  wire [8:0] _T_17; // @[Counter.scala 35:22:@11.6]
  wire [7:0] _T_18; // @[Counter.scala 35:22:@12.6]
  wire [7:0] _GEN_0; // @[Test.scala 18:15:@17.4]
  wire [1:0] _T_21; // @[Test.scala 18:15:@17.4]
  wire  _T_25; // @[Test.scala 21:11:@21.6]
  assign _T_17 = value + 8'h1; // @[Counter.scala 35:22:@11.6]
  assign _T_18 = value + 8'h1; // @[Counter.scala 35:22:@12.6]
  assign _GEN_0 = value % 8'h2; // @[Test.scala 18:15:@17.4]
  assign _T_21 = _GEN_0[1:0]; // @[Test.scala 18:15:@17.4]
  assign _T_25 = reset == 1'h0; // @[Test.scala 21:11:@21.6]
  assign io_a = value; // @[Test.scala 17:8:@16.4]
  assign io_b = {{6'd0}, _T_21}; // @[Test.scala 18:8:@18.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  value = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 8'h0;
    end else begin
      value <= _T_18;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_25) begin
          $fwrite(32'h80000002,"a:%x b:%x y:%x\n",io_a,io_b,io_y); // @[Test.scala 21:11:@23.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module Adder( // @[:@27.2]
  input  [7:0] io_a, // @[:@30.4]
  input  [7:0] io_b, // @[:@30.4]
  output [7:0] io_y // @[:@30.4]
);
  wire [8:0] _T_11; // @[Adder.scala 12:16:@32.4]
  assign _T_11 = io_a + io_b; // @[Adder.scala 12:16:@32.4]
  assign io_y = io_a + io_b; // @[Adder.scala 12:8:@34.4]
endmodule
module Test( // @[:@36.2]
  input   clock, // @[:@37.4]
  input   reset // @[:@38.4]
);
  wire  gen_clock; // @[Test.scala 27:19:@41.4]
  wire  gen_reset; // @[Test.scala 27:19:@41.4]
  wire [7:0] gen_io_a; // @[Test.scala 27:19:@41.4]
  wire [7:0] gen_io_b; // @[Test.scala 27:19:@41.4]
  wire [7:0] gen_io_y; // @[Test.scala 27:19:@41.4]
  wire [7:0] add_io_a; // @[Test.scala 28:19:@44.4]
  wire [7:0] add_io_b; // @[Test.scala 28:19:@44.4]
  wire [7:0] add_io_y; // @[Test.scala 28:19:@44.4]
  DataGen gen ( // @[Test.scala 27:19:@41.4]
    .clock(gen_clock),
    .reset(gen_reset),
    .io_a(gen_io_a),
    .io_b(gen_io_b),
    .io_y(gen_io_y)
  );
  Adder add ( // @[Test.scala 28:19:@44.4]
    .io_a(add_io_a),
    .io_b(add_io_b),
    .io_y(add_io_y)
  );
  assign gen_clock = clock; // @[:@42.4]
  assign gen_reset = reset; // @[:@43.4]
  assign gen_io_y = add_io_y; // @[Test.scala 31:12:@49.4]
  assign add_io_a = gen_io_a; // @[Test.scala 29:12:@47.4]
  assign add_io_b = gen_io_b; // @[Test.scala 30:12:@48.4]
endmodule
