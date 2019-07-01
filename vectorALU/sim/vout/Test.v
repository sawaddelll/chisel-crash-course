module DataGen( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  output [7:0] io_a_0, // @[:@6.4]
  output [7:0] io_a_1, // @[:@6.4]
  output [7:0] io_b_0, // @[:@6.4]
  output [7:0] io_b_1, // @[:@6.4]
  input  [7:0] io_y_0, // @[:@6.4]
  input  [7:0] io_y_1, // @[:@6.4]
  input        io_ovfl, // @[:@6.4]
  input        io_zero, // @[:@6.4]
  input        io_neg, // @[:@6.4]
  input  [2:0] io_ctrl // @[:@6.4]
);
  reg [1:0] value; // @[Counter.scala 26:33:@12.4]
  reg [31:0] _RAND_0;
  wire [2:0] _T_65; // @[Counter.scala 35:22:@15.6]
  wire [1:0] _T_66; // @[Counter.scala 35:22:@16.6]
  wire [1:0] _GEN_0; // @[Test.scala 27:14:@21.4]
  wire [1:0] _T_70; // @[Test.scala 27:14:@21.4]
  wire  slowclk; // @[Test.scala 27:19:@22.4]
  reg [7:0] value_1; // @[Counter.scala 26:33:@29.4]
  reg [31:0] _RAND_1;
  wire [8:0] _T_80; // @[Counter.scala 35:22:@32.6]
  wire [7:0] _T_81; // @[Counter.scala 35:22:@33.6]
  wire [7:0] _GEN_2; // @[Counter.scala 63:17:@30.4]
  reg [7:0] value_2; // @[Counter.scala 26:33:@38.4]
  reg [31:0] _RAND_2;
  wire [8:0] _T_89; // @[Counter.scala 35:22:@41.6]
  wire [7:0] _T_90; // @[Counter.scala 35:22:@42.6]
  wire  countOn; // @[Test.scala 36:12:@49.4]
  wire [7:0] _GEN_3; // @[Counter.scala 63:17:@39.4]
  reg [7:0] aIn_0; // @[Test.scala 47:20:@59.4]
  reg [31:0] _RAND_3;
  reg [7:0] aIn_1; // @[Test.scala 47:20:@59.4]
  reg [31:0] _RAND_4;
  reg [7:0] bIn_0; // @[Test.scala 48:20:@62.4]
  reg [31:0] _RAND_5;
  reg [7:0] bIn_1; // @[Test.scala 48:20:@62.4]
  reg [31:0] _RAND_6;
  reg  ovflIn; // @[Test.scala 49:23:@65.4]
  reg [31:0] _RAND_7;
  reg [2:0] ctrlIn; // @[Test.scala 54:23:@71.4]
  reg [31:0] _RAND_8;
  wire  _T_146; // @[Test.scala 59:18:@74.6]
  wire  _T_149; // @[Test.scala 60:15:@77.8]
  wire  _T_150; // @[Test.scala 61:25:@83.8]
  wire  _T_154; // @[Test.scala 63:25:@92.10]
  wire  _T_158; // @[Test.scala 65:25:@101.12]
  wire  _T_165; // @[Test.scala 68:25:@115.14]
  wire  _T_172; // @[Test.scala 71:25:@129.16]
  wire  _T_182; // @[Test.scala 78:18:@149.6]
  wire  _T_183; // @[Test.scala 78:37:@150.6]
  wire  _T_184; // @[Test.scala 78:26:@151.6]
  wire  _T_185; // @[Test.scala 78:57:@152.6]
  wire  _T_186; // @[Test.scala 78:46:@153.6]
  wire  _GEN_6; // @[Test.scala 62:15:@88.12]
  wire  _GEN_7; // @[Test.scala 62:15:@88.12]
  wire  _GEN_9; // @[Test.scala 64:15:@97.14]
  wire  _GEN_10; // @[Test.scala 64:15:@97.14]
  wire  _GEN_11; // @[Test.scala 64:15:@97.14]
  wire  _GEN_15; // @[Test.scala 66:15:@106.16]
  wire  _GEN_16; // @[Test.scala 66:15:@106.16]
  wire  _GEN_17; // @[Test.scala 66:15:@106.16]
  wire  _GEN_29; // @[Test.scala 69:15:@120.18]
  wire  _GEN_30; // @[Test.scala 69:15:@120.18]
  wire  _GEN_31; // @[Test.scala 69:15:@120.18]
  wire  _GEN_47; // @[Test.scala 72:15:@134.20]
  wire  _GEN_48; // @[Test.scala 72:15:@134.20]
  wire  _GEN_49; // @[Test.scala 72:15:@134.20]
  wire  _GEN_69; // @[Test.scala 75:15:@146.20]
  wire  _GEN_70; // @[Test.scala 75:15:@146.20]
  wire  _GEN_71; // @[Test.scala 82:13:@180.10]
  assign _T_65 = value + 2'h1; // @[Counter.scala 35:22:@15.6]
  assign _T_66 = value + 2'h1; // @[Counter.scala 35:22:@16.6]
  assign _GEN_0 = value % 2'h2; // @[Test.scala 27:14:@21.4]
  assign _T_70 = _GEN_0[1:0]; // @[Test.scala 27:14:@21.4]
  assign slowclk = _T_70 == 2'h0; // @[Test.scala 27:19:@22.4]
  assign _T_80 = value_1 + 8'h1; // @[Counter.scala 35:22:@32.6]
  assign _T_81 = value_1 + 8'h1; // @[Counter.scala 35:22:@33.6]
  assign _GEN_2 = slowclk ? _T_81 : value_1; // @[Counter.scala 63:17:@30.4]
  assign _T_89 = value_2 + 8'h1; // @[Counter.scala 35:22:@41.6]
  assign _T_90 = value_2 + 8'h1; // @[Counter.scala 35:22:@42.6]
  assign countOn = value_1 > 8'h8; // @[Test.scala 36:12:@49.4]
  assign _GEN_3 = countOn ? _T_90 : value_2; // @[Counter.scala 63:17:@39.4]
  assign _T_146 = ctrlIn == 3'h0; // @[Test.scala 59:18:@74.6]
  assign _T_149 = reset == 1'h0; // @[Test.scala 60:15:@77.8]
  assign _T_150 = ctrlIn == 3'h1; // @[Test.scala 61:25:@83.8]
  assign _T_154 = ctrlIn == 3'h2; // @[Test.scala 63:25:@92.10]
  assign _T_158 = ctrlIn == 3'h3; // @[Test.scala 65:25:@101.12]
  assign _T_165 = ctrlIn == 3'h4; // @[Test.scala 68:25:@115.14]
  assign _T_172 = ctrlIn == 3'h5; // @[Test.scala 71:25:@129.16]
  assign _T_182 = ctrlIn != 3'h4; // @[Test.scala 78:18:@149.6]
  assign _T_183 = ctrlIn != 3'h3; // @[Test.scala 78:37:@150.6]
  assign _T_184 = _T_182 & _T_183; // @[Test.scala 78:26:@151.6]
  assign _T_185 = ctrlIn != 3'h5; // @[Test.scala 78:57:@152.6]
  assign _T_186 = _T_184 & _T_185; // @[Test.scala 78:46:@153.6]
  assign io_a_0 = value_1; // @[Test.scala 21:13:@8.4 Test.scala 44:16:@58.4]
  assign io_a_1 = 8'h0; // @[Test.scala 21:13:@10.4]
  assign io_b_0 = countOn ? value_2 : 8'h1; // @[Test.scala 22:13:@9.4 Test.scala 38:18:@52.6 Test.scala 41:18:@56.6]
  assign io_b_1 = 8'h0; // @[Test.scala 22:13:@11.4]
  assign _GEN_6 = _T_146 == 1'h0; // @[Test.scala 62:15:@88.12]
  assign _GEN_7 = _GEN_6 & _T_150; // @[Test.scala 62:15:@88.12]
  assign _GEN_9 = _T_150 == 1'h0; // @[Test.scala 64:15:@97.14]
  assign _GEN_10 = _GEN_6 & _GEN_9; // @[Test.scala 64:15:@97.14]
  assign _GEN_11 = _GEN_10 & _T_154; // @[Test.scala 64:15:@97.14]
  assign _GEN_15 = _T_154 == 1'h0; // @[Test.scala 66:15:@106.16]
  assign _GEN_16 = _GEN_10 & _GEN_15; // @[Test.scala 66:15:@106.16]
  assign _GEN_17 = _GEN_16 & _T_158; // @[Test.scala 66:15:@106.16]
  assign _GEN_29 = _T_158 == 1'h0; // @[Test.scala 69:15:@120.18]
  assign _GEN_30 = _GEN_16 & _GEN_29; // @[Test.scala 69:15:@120.18]
  assign _GEN_31 = _GEN_30 & _T_165; // @[Test.scala 69:15:@120.18]
  assign _GEN_47 = _T_165 == 1'h0; // @[Test.scala 72:15:@134.20]
  assign _GEN_48 = _GEN_30 & _GEN_47; // @[Test.scala 72:15:@134.20]
  assign _GEN_49 = _GEN_48 & _T_172; // @[Test.scala 72:15:@134.20]
  assign _GEN_69 = _T_172 == 1'h0; // @[Test.scala 75:15:@146.20]
  assign _GEN_70 = _GEN_48 & _GEN_69; // @[Test.scala 75:15:@146.20]
  assign _GEN_71 = _T_186 == 1'h0; // @[Test.scala 82:13:@180.10]
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
  value = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value_1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_2 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  aIn_0 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  aIn_1 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  bIn_0 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  bIn_1 = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ovflIn = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  ctrlIn = _RAND_8[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 2'h0;
    end else begin
      value <= _T_66;
    end
    if (reset) begin
      value_1 <= 8'h0;
    end else begin
      if (slowclk) begin
        value_1 <= _T_81;
      end
    end
    if (reset) begin
      value_2 <= 8'h0;
    end else begin
      if (countOn) begin
        value_2 <= _T_90;
      end
    end
    aIn_0 <= io_a_0;
    aIn_1 <= io_a_1;
    bIn_0 <= io_b_0;
    bIn_1 <= io_b_1;
    if (reset) begin
      ovflIn <= 1'h0;
    end else begin
      ovflIn <= io_ovfl;
    end
    if (reset) begin
      ctrlIn <= 3'h0;
    end else begin
      ctrlIn <= io_ctrl;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_146 & _T_149) begin
          $fwrite(32'h80000002,"passThrough \n"); // @[Test.scala 60:15:@79.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_7 & _T_149) begin
          $fwrite(32'h80000002,"add \n"); // @[Test.scala 62:15:@88.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_11 & _T_149) begin
          $fwrite(32'h80000002,"subtract \n"); // @[Test.scala 64:15:@97.14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_17 & _T_149) begin
          $fwrite(32'h80000002,"and \n"); // @[Test.scala 66:15:@106.16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_17 & _T_149) begin
          $fwrite(32'h80000002,"%b &\n%b = \n%b \n",aIn_0,bIn_0,io_y_0); // @[Test.scala 67:15:@111.16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_31 & _T_149) begin
          $fwrite(32'h80000002,"or \n"); // @[Test.scala 69:15:@120.18]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_31 & _T_149) begin
          $fwrite(32'h80000002,"%b |\n%b = \n%b \n",aIn_0,bIn_0,io_y_0); // @[Test.scala 70:15:@125.18]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_149) begin
          $fwrite(32'h80000002,"xor \n"); // @[Test.scala 72:15:@134.20]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_149) begin
          $fwrite(32'h80000002,"%b ^\n%b = \n%b \n",aIn_0,bIn_0,io_y_0); // @[Test.scala 73:15:@139.20]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_70 & _T_149) begin
          $fwrite(32'h80000002," \n"); // @[Test.scala 75:15:@146.20]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_186 & _T_149) begin
          $fwrite(32'h80000002,"a is Vec(%d, %d)\n",aIn_0,aIn_1); // @[Test.scala 79:13:@158.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_186 & _T_149) begin
          $fwrite(32'h80000002,"b is Vec(%d, %d)\n",bIn_0,bIn_1); // @[Test.scala 79:37:@163.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_186 & _T_149) begin
          $fwrite(32'h80000002,"y is Vec(%d, %d) \n",io_y_0,io_y_1); // @[Test.scala 79:61:@168.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_186 & _T_149) begin
          $fwrite(32'h80000002,"ovfl:%d zero:%d neg:%d \n \n",ovflIn,io_zero,io_neg); // @[Test.scala 80:13:@173.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_71 & _T_149) begin
          $fwrite(32'h80000002,"\n"); // @[Test.scala 82:13:@180.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ALU( // @[:@185.2]
  input        clock, // @[:@186.4]
  input  [7:0] io_a_0, // @[:@188.4]
  input  [7:0] io_b_0, // @[:@188.4]
  input  [2:0] io_ctrl, // @[:@188.4]
  output [7:0] io_result_0, // @[:@188.4]
  output [7:0] io_result_1, // @[:@188.4]
  output       io_negative, // @[:@188.4]
  output       io_zero, // @[:@188.4]
  output       io_overflow // @[:@188.4]
);
  reg [7:0] storedValue_0; // @[Adder.scala 24:31:@193.4]
  reg [31:0] _RAND_0;
  reg [7:0] storedValue_1; // @[Adder.scala 24:31:@193.4]
  reg [31:0] _RAND_1;
  wire  _T_103; // @[Adder.scala 31:20:@199.4]
  wire  _T_104; // @[Adder.scala 33:27:@204.6]
  wire [8:0] _T_105; // @[Adder.scala 34:27:@206.8]
  wire [7:0] _T_106; // @[Adder.scala 34:27:@207.8]
  wire  _T_107; // @[Adder.scala 35:27:@211.8]
  wire [8:0] _T_108; // @[Adder.scala 36:27:@213.10]
  wire [8:0] _T_109; // @[Adder.scala 36:27:@214.10]
  wire [7:0] _T_110; // @[Adder.scala 36:27:@215.10]
  wire  _T_111; // @[Adder.scala 42:27:@219.10]
  wire [7:0] _T_112; // @[Adder.scala 43:27:@221.12]
  wire  _T_113; // @[Adder.scala 44:27:@225.12]
  wire [7:0] _T_114; // @[Adder.scala 45:27:@227.14]
  wire  _T_115; // @[Adder.scala 46:27:@231.14]
  wire [7:0] _T_116; // @[Adder.scala 47:27:@233.16]
  wire [7:0] _GEN_0; // @[Adder.scala 46:36:@232.14]
  wire [7:0] _GEN_1; // @[Adder.scala 44:35:@226.12]
  wire [7:0] _GEN_2; // @[Adder.scala 42:36:@220.10]
  wire [7:0] _GEN_3; // @[Adder.scala 35:41:@212.8]
  wire [7:0] _GEN_4; // @[Adder.scala 33:36:@205.6]
  wire [7:0] out_0; // @[Adder.scala 31:37:@200.4]
  wire  _T_119; // @[Adder.scala 51:39:@239.4]
  wire  zeroVector_0; // @[Adder.scala 51:24:@240.4]
  wire  negVector_0; // @[Adder.scala 52:35:@242.4]
  wire  _T_122; // @[Adder.scala 56:38:@244.4]
  wire  _T_123; // @[Adder.scala 56:62:@245.4]
  wire  _T_124; // @[Adder.scala 56:51:@246.4]
  wire  _T_125; // @[Adder.scala 56:86:@247.4]
  wire  _T_127; // @[Adder.scala 56:99:@249.4]
  wire  overflowVector_0; // @[Adder.scala 56:76:@250.4]
  wire [8:0] _T_134; // @[Adder.scala 36:27:@266.10]
  wire [8:0] _T_135; // @[Adder.scala 36:27:@267.10]
  wire [7:0] _T_136; // @[Adder.scala 36:27:@268.10]
  wire [7:0] _GEN_9; // @[Adder.scala 35:41:@265.8]
  wire [7:0] _GEN_10; // @[Adder.scala 33:36:@258.6]
  wire [7:0] out_1; // @[Adder.scala 31:37:@253.4]
  wire  _T_145; // @[Adder.scala 51:39:@292.4]
  wire  zeroVector_1; // @[Adder.scala 51:24:@293.4]
  wire  negVector_1; // @[Adder.scala 52:35:@295.4]
  wire  overflowVector_1; // @[Adder.scala 56:86:@300.4]
  wire  _T_156; // @[Adder.scala 60:36:@307.4]
  wire  _T_157; // @[Adder.scala 60:36:@308.4]
  wire  _T_160; // @[Adder.scala 60:36:@310.4]
  assign _T_103 = io_ctrl == 3'h0; // @[Adder.scala 31:20:@199.4]
  assign _T_104 = io_ctrl == 3'h1; // @[Adder.scala 33:27:@204.6]
  assign _T_105 = io_a_0 + io_b_0; // @[Adder.scala 34:27:@206.8]
  assign _T_106 = io_a_0 + io_b_0; // @[Adder.scala 34:27:@207.8]
  assign _T_107 = io_ctrl == 3'h2; // @[Adder.scala 35:27:@211.8]
  assign _T_108 = io_a_0 - io_b_0; // @[Adder.scala 36:27:@213.10]
  assign _T_109 = $unsigned(_T_108); // @[Adder.scala 36:27:@214.10]
  assign _T_110 = _T_109[7:0]; // @[Adder.scala 36:27:@215.10]
  assign _T_111 = io_ctrl == 3'h3; // @[Adder.scala 42:27:@219.10]
  assign _T_112 = io_a_0 & io_b_0; // @[Adder.scala 43:27:@221.12]
  assign _T_113 = io_ctrl == 3'h4; // @[Adder.scala 44:27:@225.12]
  assign _T_114 = io_a_0 | io_b_0; // @[Adder.scala 45:27:@227.14]
  assign _T_115 = io_ctrl == 3'h5; // @[Adder.scala 46:27:@231.14]
  assign _T_116 = io_a_0 ^ io_b_0; // @[Adder.scala 47:27:@233.16]
  assign _GEN_0 = _T_115 ? _T_116 : 8'h0; // @[Adder.scala 46:36:@232.14]
  assign _GEN_1 = _T_113 ? _T_114 : _GEN_0; // @[Adder.scala 44:35:@226.12]
  assign _GEN_2 = _T_111 ? _T_112 : _GEN_1; // @[Adder.scala 42:36:@220.10]
  assign _GEN_3 = _T_107 ? _T_110 : _GEN_2; // @[Adder.scala 35:41:@212.8]
  assign _GEN_4 = _T_104 ? _T_106 : _GEN_3; // @[Adder.scala 33:36:@205.6]
  assign out_0 = _T_103 ? io_a_0 : _GEN_4; // @[Adder.scala 31:37:@200.4]
  assign _T_119 = io_result_0 != 8'h0; // @[Adder.scala 51:39:@239.4]
  assign zeroVector_0 = ~ _T_119; // @[Adder.scala 51:24:@240.4]
  assign negVector_0 = io_result_0[7]; // @[Adder.scala 52:35:@242.4]
  assign _T_122 = io_a_0[7]; // @[Adder.scala 56:38:@244.4]
  assign _T_123 = io_b_0[7]; // @[Adder.scala 56:62:@245.4]
  assign _T_124 = _T_122 == _T_123; // @[Adder.scala 56:51:@246.4]
  assign _T_125 = out_0[7]; // @[Adder.scala 56:86:@247.4]
  assign _T_127 = _T_125 != _T_122; // @[Adder.scala 56:99:@249.4]
  assign overflowVector_0 = _T_124 & _T_127; // @[Adder.scala 56:76:@250.4]
  assign _T_134 = 8'h0 - 8'h0; // @[Adder.scala 36:27:@266.10]
  assign _T_135 = $unsigned(_T_134); // @[Adder.scala 36:27:@267.10]
  assign _T_136 = _T_135[7:0]; // @[Adder.scala 36:27:@268.10]
  assign _GEN_9 = _T_107 ? _T_136 : 8'h0; // @[Adder.scala 35:41:@265.8]
  assign _GEN_10 = _T_104 ? 8'h0 : _GEN_9; // @[Adder.scala 33:36:@258.6]
  assign out_1 = _T_103 ? 8'h0 : _GEN_10; // @[Adder.scala 31:37:@253.4]
  assign _T_145 = io_result_1 != 8'h0; // @[Adder.scala 51:39:@292.4]
  assign zeroVector_1 = ~ _T_145; // @[Adder.scala 51:24:@293.4]
  assign negVector_1 = io_result_1[7]; // @[Adder.scala 52:35:@295.4]
  assign overflowVector_1 = out_1[7]; // @[Adder.scala 56:86:@300.4]
  assign _T_156 = zeroVector_0 == 1'h0; // @[Adder.scala 60:36:@307.4]
  assign _T_157 = zeroVector_1 == 1'h0; // @[Adder.scala 60:36:@308.4]
  assign _T_160 = _T_156 | _T_157; // @[Adder.scala 60:36:@310.4]
  assign io_result_0 = storedValue_0; // @[Adder.scala 59:15:@305.4]
  assign io_result_1 = storedValue_1; // @[Adder.scala 59:15:@306.4]
  assign io_negative = negVector_0 | negVector_1; // @[Adder.scala 62:17:@322.4]
  assign io_zero = _T_160 == 1'h0; // @[Adder.scala 60:13:@312.4]
  assign io_overflow = overflowVector_0 | overflowVector_1; // @[Adder.scala 61:17:@317.4]
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  storedValue_1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_103) begin
      storedValue_0 <= io_a_0;
    end else begin
      if (_T_104) begin
        storedValue_0 <= _T_106;
      end else begin
        if (_T_107) begin
          storedValue_0 <= _T_110;
        end else begin
          if (_T_111) begin
            storedValue_0 <= _T_112;
          end else begin
            if (_T_113) begin
              storedValue_0 <= _T_114;
            end else begin
              if (_T_115) begin
                storedValue_0 <= _T_116;
              end else begin
                storedValue_0 <= 8'h0;
              end
            end
          end
        end
      end
    end
    if (_T_103) begin
      storedValue_1 <= 8'h0;
    end else begin
      if (_T_104) begin
        storedValue_1 <= 8'h0;
      end else begin
        if (_T_107) begin
          storedValue_1 <= _T_136;
        end else begin
          storedValue_1 <= 8'h0;
        end
      end
    end
  end
endmodule
module Test( // @[:@324.2]
  input   clock, // @[:@325.4]
  input   reset // @[:@326.4]
);
  wire  gen_clock; // @[Test.scala 90:19:@329.4]
  wire  gen_reset; // @[Test.scala 90:19:@329.4]
  wire [7:0] gen_io_a_0; // @[Test.scala 90:19:@329.4]
  wire [7:0] gen_io_a_1; // @[Test.scala 90:19:@329.4]
  wire [7:0] gen_io_b_0; // @[Test.scala 90:19:@329.4]
  wire [7:0] gen_io_b_1; // @[Test.scala 90:19:@329.4]
  wire [7:0] gen_io_y_0; // @[Test.scala 90:19:@329.4]
  wire [7:0] gen_io_y_1; // @[Test.scala 90:19:@329.4]
  wire  gen_io_ovfl; // @[Test.scala 90:19:@329.4]
  wire  gen_io_zero; // @[Test.scala 90:19:@329.4]
  wire  gen_io_neg; // @[Test.scala 90:19:@329.4]
  wire [2:0] gen_io_ctrl; // @[Test.scala 90:19:@329.4]
  wire  alu_clock; // @[Test.scala 91:19:@332.4]
  wire [7:0] alu_io_a_0; // @[Test.scala 91:19:@332.4]
  wire [7:0] alu_io_b_0; // @[Test.scala 91:19:@332.4]
  wire [2:0] alu_io_ctrl; // @[Test.scala 91:19:@332.4]
  wire [7:0] alu_io_result_0; // @[Test.scala 91:19:@332.4]
  wire [7:0] alu_io_result_1; // @[Test.scala 91:19:@332.4]
  wire  alu_io_negative; // @[Test.scala 91:19:@332.4]
  wire  alu_io_zero; // @[Test.scala 91:19:@332.4]
  wire  alu_io_overflow; // @[Test.scala 91:19:@332.4]
  reg [2:0] value; // @[Counter.scala 26:33:@344.4]
  reg [31:0] _RAND_0;
  wire  _T_9; // @[Counter.scala 34:24:@346.6]
  wire [3:0] _T_11; // @[Counter.scala 35:22:@347.6]
  wire [2:0] _T_12; // @[Counter.scala 35:22:@348.6]
  wire [2:0] _GEN_0; // @[Counter.scala 37:21:@350.6]
  DataGen gen ( // @[Test.scala 90:19:@329.4]
    .clock(gen_clock),
    .reset(gen_reset),
    .io_a_0(gen_io_a_0),
    .io_a_1(gen_io_a_1),
    .io_b_0(gen_io_b_0),
    .io_b_1(gen_io_b_1),
    .io_y_0(gen_io_y_0),
    .io_y_1(gen_io_y_1),
    .io_ovfl(gen_io_ovfl),
    .io_zero(gen_io_zero),
    .io_neg(gen_io_neg),
    .io_ctrl(gen_io_ctrl)
  );
  ALU alu ( // @[Test.scala 91:19:@332.4]
    .clock(alu_clock),
    .io_a_0(alu_io_a_0),
    .io_b_0(alu_io_b_0),
    .io_ctrl(alu_io_ctrl),
    .io_result_0(alu_io_result_0),
    .io_result_1(alu_io_result_1),
    .io_negative(alu_io_negative),
    .io_zero(alu_io_zero),
    .io_overflow(alu_io_overflow)
  );
  assign _T_9 = value == 3'h5; // @[Counter.scala 34:24:@346.6]
  assign _T_11 = value + 3'h1; // @[Counter.scala 35:22:@347.6]
  assign _T_12 = value + 3'h1; // @[Counter.scala 35:22:@348.6]
  assign _GEN_0 = _T_9 ? 3'h0 : _T_12; // @[Counter.scala 37:21:@350.6]
  assign gen_clock = clock; // @[:@330.4]
  assign gen_reset = reset; // @[:@331.4]
  assign gen_io_y_0 = alu_io_result_0; // @[Test.scala 94:12:@339.4]
  assign gen_io_y_1 = alu_io_result_1; // @[Test.scala 94:12:@340.4]
  assign gen_io_ovfl = alu_io_overflow; // @[Test.scala 95:15:@341.4]
  assign gen_io_zero = alu_io_zero; // @[Test.scala 96:15:@342.4]
  assign gen_io_neg = alu_io_negative; // @[Test.scala 97:14:@343.4]
  assign gen_io_ctrl = value; // @[Test.scala 100:15:@356.4]
  assign alu_clock = clock; // @[:@333.4]
  assign alu_io_a_0 = gen_io_a_0; // @[Test.scala 92:12:@335.4]
  assign alu_io_b_0 = gen_io_b_0; // @[Test.scala 93:12:@337.4]
  assign alu_io_ctrl = value; // @[Test.scala 99:15:@355.4]
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
  value = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 3'h0;
    end else begin
      if (_T_9) begin
        value <= 3'h0;
      end else begin
        value <= _T_12;
      end
    end
  end
endmodule
