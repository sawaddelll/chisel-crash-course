module ALU( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [7:0] io_a_0, // @[:@6.4]
  input  [7:0] io_b_0, // @[:@6.4]
  input  [2:0] io_ctrl, // @[:@6.4]
  output [7:0] io_result_0, // @[:@6.4]
  output       io_negative, // @[:@6.4]
  output       io_zero, // @[:@6.4]
  output       io_overflow // @[:@6.4]
);
  reg [7:0] storedValue_0; // @[Adder.scala 24:31:@11.4]
  reg [31:0] _RAND_0;
  wire  _T_88; // @[Adder.scala 31:20:@16.4]
  wire  _T_89; // @[Adder.scala 33:27:@21.6]
  wire [8:0] _T_90; // @[Adder.scala 34:27:@23.8]
  wire [7:0] _T_91; // @[Adder.scala 34:27:@24.8]
  wire  _T_92; // @[Adder.scala 35:27:@28.8]
  wire [8:0] _T_93; // @[Adder.scala 36:27:@30.10]
  wire [8:0] _T_94; // @[Adder.scala 36:27:@31.10]
  wire [7:0] _T_95; // @[Adder.scala 36:27:@32.10]
  wire  _T_96; // @[Adder.scala 42:27:@36.10]
  wire [7:0] _T_97; // @[Adder.scala 43:27:@38.12]
  wire  _T_98; // @[Adder.scala 44:27:@42.12]
  wire [7:0] _T_99; // @[Adder.scala 45:27:@44.14]
  wire  _T_100; // @[Adder.scala 46:27:@48.14]
  wire [7:0] _T_101; // @[Adder.scala 47:27:@50.16]
  wire [7:0] _GEN_0; // @[Adder.scala 46:36:@49.14]
  wire [7:0] _GEN_1; // @[Adder.scala 44:35:@43.12]
  wire [7:0] _GEN_2; // @[Adder.scala 42:36:@37.10]
  wire [7:0] _GEN_3; // @[Adder.scala 35:41:@29.8]
  wire [7:0] _GEN_4; // @[Adder.scala 33:36:@22.6]
  wire [7:0] out_0; // @[Adder.scala 31:37:@17.4]
  wire  _T_104; // @[Adder.scala 51:39:@56.4]
  wire  zeroVector_0; // @[Adder.scala 51:24:@57.4]
  wire  _T_107; // @[Adder.scala 56:38:@61.4]
  wire  _T_108; // @[Adder.scala 56:62:@62.4]
  wire  _T_109; // @[Adder.scala 56:51:@63.4]
  wire  _T_110; // @[Adder.scala 56:86:@64.4]
  wire  _T_112; // @[Adder.scala 56:99:@66.4]
  wire  _T_115; // @[Adder.scala 60:36:@70.4]
  assign _T_88 = io_ctrl == 3'h0; // @[Adder.scala 31:20:@16.4]
  assign _T_89 = io_ctrl == 3'h1; // @[Adder.scala 33:27:@21.6]
  assign _T_90 = io_a_0 + io_b_0; // @[Adder.scala 34:27:@23.8]
  assign _T_91 = io_a_0 + io_b_0; // @[Adder.scala 34:27:@24.8]
  assign _T_92 = io_ctrl == 3'h2; // @[Adder.scala 35:27:@28.8]
  assign _T_93 = io_a_0 - io_b_0; // @[Adder.scala 36:27:@30.10]
  assign _T_94 = $unsigned(_T_93); // @[Adder.scala 36:27:@31.10]
  assign _T_95 = _T_94[7:0]; // @[Adder.scala 36:27:@32.10]
  assign _T_96 = io_ctrl == 3'h3; // @[Adder.scala 42:27:@36.10]
  assign _T_97 = io_a_0 & io_b_0; // @[Adder.scala 43:27:@38.12]
  assign _T_98 = io_ctrl == 3'h4; // @[Adder.scala 44:27:@42.12]
  assign _T_99 = io_a_0 | io_b_0; // @[Adder.scala 45:27:@44.14]
  assign _T_100 = io_ctrl == 3'h5; // @[Adder.scala 46:27:@48.14]
  assign _T_101 = io_a_0 ^ io_b_0; // @[Adder.scala 47:27:@50.16]
  assign _GEN_0 = _T_100 ? _T_101 : 8'h0; // @[Adder.scala 46:36:@49.14]
  assign _GEN_1 = _T_98 ? _T_99 : _GEN_0; // @[Adder.scala 44:35:@43.12]
  assign _GEN_2 = _T_96 ? _T_97 : _GEN_1; // @[Adder.scala 42:36:@37.10]
  assign _GEN_3 = _T_92 ? _T_95 : _GEN_2; // @[Adder.scala 35:41:@29.8]
  assign _GEN_4 = _T_89 ? _T_91 : _GEN_3; // @[Adder.scala 33:36:@22.6]
  assign out_0 = _T_88 ? io_a_0 : _GEN_4; // @[Adder.scala 31:37:@17.4]
  assign _T_104 = io_result_0 != 8'h0; // @[Adder.scala 51:39:@56.4]
  assign zeroVector_0 = ~ _T_104; // @[Adder.scala 51:24:@57.4]
  assign _T_107 = io_a_0[7]; // @[Adder.scala 56:38:@61.4]
  assign _T_108 = io_b_0[7]; // @[Adder.scala 56:62:@62.4]
  assign _T_109 = _T_107 == _T_108; // @[Adder.scala 56:51:@63.4]
  assign _T_110 = out_0[7]; // @[Adder.scala 56:86:@64.4]
  assign _T_112 = _T_110 != _T_107; // @[Adder.scala 56:99:@66.4]
  assign _T_115 = zeroVector_0 == 1'h0; // @[Adder.scala 60:36:@70.4]
  assign io_result_0 = storedValue_0; // @[Adder.scala 59:15:@69.4]
  assign io_negative = io_result_0[7]; // @[Adder.scala 62:17:@79.4]
  assign io_zero = _T_115 == 1'h0; // @[Adder.scala 60:13:@73.4]
  assign io_overflow = _T_109 & _T_112; // @[Adder.scala 61:17:@76.4]
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
  storedValue_0 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_88) begin
      storedValue_0 <= io_a_0;
    end else begin
      if (_T_89) begin
        storedValue_0 <= _T_91;
      end else begin
        if (_T_92) begin
          storedValue_0 <= _T_95;
        end else begin
          if (_T_96) begin
            storedValue_0 <= _T_97;
          end else begin
            if (_T_98) begin
              storedValue_0 <= _T_99;
            end else begin
              if (_T_100) begin
                storedValue_0 <= _T_101;
              end else begin
                storedValue_0 <= 8'h0;
              end
            end
          end
        end
      end
    end
  end
endmodule
