module ALU( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [7:0]  io_a, // @[:@6.4]
  input  [7:0]  io_b, // @[:@6.4]
  input  [2:0]  io_ctrl, // @[:@6.4]
  output [7:0]  io_result, // @[:@6.4]
  output        io_negative, // @[:@6.4]
  output        io_zero, // @[:@6.4]
  output        io_overflow, // @[:@6.4]
  output [15:0] io_product // @[:@6.4]
);
  wire  _T_21; // @[Adder.scala 19:27:@8.4]
  wire  _T_22; // @[Adder.scala 20:23:@10.4]
  wire  _T_23; // @[Adder.scala 20:44:@11.4]
  wire  _T_24; // @[Adder.scala 20:36:@12.4]
  wire  _T_27; // @[Adder.scala 20:84:@15.4]
  wire  _T_30; // @[Adder.scala 21:30:@18.4]
  wire [8:0] _T_32; // @[Adder.scala 22:23:@21.4]
  wire [7:0] addition; // @[Adder.scala 22:23:@22.4]
  reg [7:0] storedValue; // @[Adder.scala 24:29:@24.4]
  reg [31:0] _RAND_0;
  wire  _T_37; // @[Adder.scala 28:16:@28.4]
  wire  _T_38; // @[Adder.scala 30:23:@33.6]
  wire  _T_41; // @[Adder.scala 32:23:@40.8]
  wire [8:0] _T_42; // @[Adder.scala 33:17:@42.10]
  wire [8:0] _T_43; // @[Adder.scala 33:17:@43.10]
  wire [7:0] _T_44; // @[Adder.scala 33:17:@44.10]
  wire  _T_45; // @[Adder.scala 34:23:@48.10]
  wire [15:0] _T_46; // @[Adder.scala 35:24:@50.12]
  wire  _T_47; // @[Adder.scala 37:23:@55.12]
  wire [7:0] _T_48; // @[Adder.scala 38:17:@57.14]
  wire  _T_49; // @[Adder.scala 39:23:@61.14]
  wire [7:0] _T_50; // @[Adder.scala 40:17:@63.16]
  wire  _T_51; // @[Adder.scala 41:23:@67.16]
  wire [7:0] _T_52; // @[Adder.scala 42:17:@69.18]
  wire  _T_53; // @[Adder.scala 43:23:@73.18]
  wire [7:0] _T_54; // @[Adder.scala 44:17:@75.20]
  wire [7:0] _GEN_0; // @[Adder.scala 43:32:@74.18]
  wire [7:0] _GEN_1; // @[Adder.scala 41:31:@68.16]
  wire [7:0] _GEN_2; // @[Adder.scala 39:32:@62.14]
  wire [7:0] _GEN_3; // @[Adder.scala 37:35:@56.12]
  wire [15:0] _GEN_4; // @[Adder.scala 34:37:@49.10]
  wire [15:0] _GEN_5; // @[Adder.scala 34:37:@49.10]
  wire [15:0] _GEN_6; // @[Adder.scala 32:37:@41.8]
  wire [15:0] _GEN_7; // @[Adder.scala 32:37:@41.8]
  wire [15:0] _GEN_8; // @[Adder.scala 30:32:@34.6]
  wire [15:0] _GEN_9; // @[Adder.scala 30:32:@34.6]
  wire [15:0] _GEN_10; // @[Adder.scala 28:33:@29.4]
  wire [7:0] out; // @[Adder.scala 23:17:@23.4 Adder.scala 29:9:@30.6 Adder.scala 31:9:@37.8 Adder.scala 33:9:@45.10 Adder.scala 36:9:@52.12 Adder.scala 38:9:@58.14 Adder.scala 40:9:@64.16 Adder.scala 42:9:@70.18 Adder.scala 44:9:@76.20 Adder.scala 46:9:@79.20]
  assign _T_21 = io_result[7]; // @[Adder.scala 19:27:@8.4]
  assign _T_22 = io_a[7]; // @[Adder.scala 20:23:@10.4]
  assign _T_23 = io_b[7]; // @[Adder.scala 20:44:@11.4]
  assign _T_24 = _T_22 == _T_23; // @[Adder.scala 20:36:@12.4]
  assign _T_27 = _T_21 != _T_22; // @[Adder.scala 20:84:@15.4]
  assign _T_30 = io_result != 8'h0; // @[Adder.scala 21:30:@18.4]
  assign _T_32 = io_a + io_b; // @[Adder.scala 22:23:@21.4]
  assign addition = io_a + io_b; // @[Adder.scala 22:23:@22.4]
  assign _T_37 = io_ctrl == 3'h0; // @[Adder.scala 28:16:@28.4]
  assign _T_38 = io_ctrl == 3'h1; // @[Adder.scala 30:23:@33.6]
  assign _T_41 = io_ctrl == 3'h2; // @[Adder.scala 32:23:@40.8]
  assign _T_42 = io_a - io_b; // @[Adder.scala 33:17:@42.10]
  assign _T_43 = $unsigned(_T_42); // @[Adder.scala 33:17:@43.10]
  assign _T_44 = _T_43[7:0]; // @[Adder.scala 33:17:@44.10]
  assign _T_45 = io_ctrl == 3'h3; // @[Adder.scala 34:23:@48.10]
  assign _T_46 = io_a * io_b; // @[Adder.scala 35:24:@50.12]
  assign _T_47 = io_ctrl == 3'h4; // @[Adder.scala 37:23:@55.12]
  assign _T_48 = io_a / io_b; // @[Adder.scala 38:17:@57.14]
  assign _T_49 = io_ctrl == 3'h5; // @[Adder.scala 39:23:@61.14]
  assign _T_50 = io_a & io_b; // @[Adder.scala 40:17:@63.16]
  assign _T_51 = io_ctrl == 3'h6; // @[Adder.scala 41:23:@67.16]
  assign _T_52 = io_a | io_b; // @[Adder.scala 42:17:@69.18]
  assign _T_53 = io_ctrl == 3'h7; // @[Adder.scala 43:23:@73.18]
  assign _T_54 = io_a ^ io_b; // @[Adder.scala 44:17:@75.20]
  assign _GEN_0 = _T_53 ? _T_54 : 8'h0; // @[Adder.scala 43:32:@74.18]
  assign _GEN_1 = _T_51 ? _T_52 : _GEN_0; // @[Adder.scala 41:31:@68.16]
  assign _GEN_2 = _T_49 ? _T_50 : _GEN_1; // @[Adder.scala 39:32:@62.14]
  assign _GEN_3 = _T_47 ? _T_48 : _GEN_2; // @[Adder.scala 37:35:@56.12]
  assign _GEN_4 = _T_45 ? _T_46 : 16'h0; // @[Adder.scala 34:37:@49.10]
  assign _GEN_5 = _T_45 ? io_product : {{8'd0}, _GEN_3}; // @[Adder.scala 34:37:@49.10]
  assign _GEN_6 = _T_41 ? {{8'd0}, _T_44} : _GEN_5; // @[Adder.scala 32:37:@41.8]
  assign _GEN_7 = _T_41 ? 16'h0 : _GEN_4; // @[Adder.scala 32:37:@41.8]
  assign _GEN_8 = _T_38 ? {{8'd0}, addition} : _GEN_6; // @[Adder.scala 30:32:@34.6]
  assign _GEN_9 = _T_38 ? 16'h0 : _GEN_7; // @[Adder.scala 30:32:@34.6]
  assign _GEN_10 = _T_37 ? {{8'd0}, io_a} : _GEN_8; // @[Adder.scala 28:33:@29.4]
  assign out = _GEN_10[7:0]; // @[Adder.scala 23:17:@23.4 Adder.scala 29:9:@30.6 Adder.scala 31:9:@37.8 Adder.scala 33:9:@45.10 Adder.scala 36:9:@52.12 Adder.scala 38:9:@58.14 Adder.scala 40:9:@64.16 Adder.scala 42:9:@70.18 Adder.scala 44:9:@76.20 Adder.scala 46:9:@79.20]
  assign io_result = storedValue; // @[Adder.scala 49:13:@81.4]
  assign io_negative = io_result[7]; // @[Adder.scala 19:15:@9.4]
  assign io_zero = ~ _T_30; // @[Adder.scala 21:15:@20.4]
  assign io_overflow = _T_24 & _T_27; // @[Adder.scala 20:15:@17.4]
  assign io_product = _T_37 ? 16'h0 : _GEN_9; // @[Adder.scala 27:14:@27.4 Adder.scala 35:16:@51.12]
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
  storedValue = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      storedValue <= 8'h0;
    end else begin
      storedValue <= out;
    end
  end
endmodule
