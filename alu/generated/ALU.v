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
  wire  _T_24; // @[Adder.scala 20:30:@11.4]
  wire [8:0] _T_26; // @[Adder.scala 21:23:@14.4]
  wire [7:0] addition; // @[Adder.scala 21:23:@15.4]
  reg [7:0] storedValue; // @[Adder.scala 22:29:@16.4]
  reg [31:0] _RAND_0;
  wire  _T_30; // @[Adder.scala 26:16:@20.4]
  wire  _T_31; // @[Adder.scala 28:23:@25.6]
  wire  _T_34; // @[Adder.scala 30:23:@32.8]
  wire [8:0] _T_35; // @[Adder.scala 31:17:@34.10]
  wire [8:0] _T_36; // @[Adder.scala 31:17:@35.10]
  wire [7:0] _T_37; // @[Adder.scala 31:17:@36.10]
  wire  _T_38; // @[Adder.scala 32:23:@40.10]
  wire [15:0] _T_39; // @[Adder.scala 33:24:@42.12]
  wire  _T_40; // @[Adder.scala 35:23:@47.12]
  wire [7:0] _T_41; // @[Adder.scala 36:17:@49.14]
  wire  _T_42; // @[Adder.scala 37:23:@53.14]
  wire [7:0] _T_43; // @[Adder.scala 38:17:@55.16]
  wire  _T_44; // @[Adder.scala 39:23:@59.16]
  wire [7:0] _T_45; // @[Adder.scala 40:17:@61.18]
  wire  _T_46; // @[Adder.scala 41:23:@65.18]
  wire [7:0] _T_47; // @[Adder.scala 42:17:@67.20]
  wire [7:0] _GEN_0; // @[Adder.scala 41:32:@66.18]
  wire [7:0] _GEN_1; // @[Adder.scala 39:31:@60.16]
  wire [7:0] _GEN_2; // @[Adder.scala 37:32:@54.14]
  wire [7:0] _GEN_3; // @[Adder.scala 35:35:@48.12]
  wire [15:0] _GEN_4; // @[Adder.scala 32:37:@41.10]
  wire [15:0] _GEN_5; // @[Adder.scala 32:37:@41.10]
  wire [15:0] _GEN_6; // @[Adder.scala 30:37:@33.8]
  wire [15:0] _GEN_7; // @[Adder.scala 30:37:@33.8]
  wire [15:0] _GEN_8; // @[Adder.scala 28:32:@26.6]
  wire [15:0] _GEN_9; // @[Adder.scala 28:32:@26.6]
  wire [15:0] _GEN_10; // @[Adder.scala 26:33:@21.4]
  wire  _T_49; // @[Adder.scala 48:23:@74.4]
  wire  _T_50; // @[Adder.scala 48:44:@75.4]
  wire  _T_51; // @[Adder.scala 48:36:@76.4]
  wire [7:0] out; // @[Adder.scala 18:17:@8.4 Adder.scala 27:9:@22.6 Adder.scala 29:9:@29.8 Adder.scala 31:9:@37.10 Adder.scala 34:9:@44.12 Adder.scala 36:9:@50.14 Adder.scala 38:9:@56.16 Adder.scala 40:9:@62.18 Adder.scala 42:9:@68.20 Adder.scala 44:9:@71.20]
  wire  _T_52; // @[Adder.scala 48:65:@77.4]
  wire  _T_54; // @[Adder.scala 48:78:@79.4]
  assign _T_24 = io_result != 8'h0; // @[Adder.scala 20:30:@11.4]
  assign _T_26 = io_a + io_b; // @[Adder.scala 21:23:@14.4]
  assign addition = io_a + io_b; // @[Adder.scala 21:23:@15.4]
  assign _T_30 = io_ctrl == 3'h0; // @[Adder.scala 26:16:@20.4]
  assign _T_31 = io_ctrl == 3'h1; // @[Adder.scala 28:23:@25.6]
  assign _T_34 = io_ctrl == 3'h2; // @[Adder.scala 30:23:@32.8]
  assign _T_35 = io_a - io_b; // @[Adder.scala 31:17:@34.10]
  assign _T_36 = $unsigned(_T_35); // @[Adder.scala 31:17:@35.10]
  assign _T_37 = _T_36[7:0]; // @[Adder.scala 31:17:@36.10]
  assign _T_38 = io_ctrl == 3'h3; // @[Adder.scala 32:23:@40.10]
  assign _T_39 = io_a * io_b; // @[Adder.scala 33:24:@42.12]
  assign _T_40 = io_ctrl == 3'h4; // @[Adder.scala 35:23:@47.12]
  assign _T_41 = io_a / io_b; // @[Adder.scala 36:17:@49.14]
  assign _T_42 = io_ctrl == 3'h5; // @[Adder.scala 37:23:@53.14]
  assign _T_43 = io_a & io_b; // @[Adder.scala 38:17:@55.16]
  assign _T_44 = io_ctrl == 3'h6; // @[Adder.scala 39:23:@59.16]
  assign _T_45 = io_a | io_b; // @[Adder.scala 40:17:@61.18]
  assign _T_46 = io_ctrl == 3'h7; // @[Adder.scala 41:23:@65.18]
  assign _T_47 = io_a ^ io_b; // @[Adder.scala 42:17:@67.20]
  assign _GEN_0 = _T_46 ? _T_47 : 8'h0; // @[Adder.scala 41:32:@66.18]
  assign _GEN_1 = _T_44 ? _T_45 : _GEN_0; // @[Adder.scala 39:31:@60.16]
  assign _GEN_2 = _T_42 ? _T_43 : _GEN_1; // @[Adder.scala 37:32:@54.14]
  assign _GEN_3 = _T_40 ? _T_41 : _GEN_2; // @[Adder.scala 35:35:@48.12]
  assign _GEN_4 = _T_38 ? _T_39 : 16'h0; // @[Adder.scala 32:37:@41.10]
  assign _GEN_5 = _T_38 ? io_product : {{8'd0}, _GEN_3}; // @[Adder.scala 32:37:@41.10]
  assign _GEN_6 = _T_34 ? {{8'd0}, _T_37} : _GEN_5; // @[Adder.scala 30:37:@33.8]
  assign _GEN_7 = _T_34 ? 16'h0 : _GEN_4; // @[Adder.scala 30:37:@33.8]
  assign _GEN_8 = _T_31 ? {{8'd0}, addition} : _GEN_6; // @[Adder.scala 28:32:@26.6]
  assign _GEN_9 = _T_31 ? 16'h0 : _GEN_7; // @[Adder.scala 28:32:@26.6]
  assign _GEN_10 = _T_30 ? {{8'd0}, io_a} : _GEN_8; // @[Adder.scala 26:33:@21.4]
  assign _T_49 = io_a[7]; // @[Adder.scala 48:23:@74.4]
  assign _T_50 = io_b[7]; // @[Adder.scala 48:44:@75.4]
  assign _T_51 = _T_49 == _T_50; // @[Adder.scala 48:36:@76.4]
  assign out = _GEN_10[7:0]; // @[Adder.scala 18:17:@8.4 Adder.scala 27:9:@22.6 Adder.scala 29:9:@29.8 Adder.scala 31:9:@37.10 Adder.scala 34:9:@44.12 Adder.scala 36:9:@50.14 Adder.scala 38:9:@56.16 Adder.scala 40:9:@62.18 Adder.scala 42:9:@68.20 Adder.scala 44:9:@71.20]
  assign _T_52 = out[7]; // @[Adder.scala 48:65:@77.4]
  assign _T_54 = _T_52 != _T_49; // @[Adder.scala 48:78:@79.4]
  assign io_result = storedValue; // @[Adder.scala 47:13:@73.4]
  assign io_negative = io_result[7]; // @[Adder.scala 19:15:@10.4]
  assign io_zero = ~ _T_24; // @[Adder.scala 20:15:@13.4]
  assign io_overflow = _T_51 & _T_54; // @[Adder.scala 48:15:@81.4]
  assign io_product = _T_30 ? 16'h0 : _GEN_9; // @[Adder.scala 25:14:@19.4 Adder.scala 33:16:@43.12]
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
