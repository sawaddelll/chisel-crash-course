module DataGen( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output [7:0]  io_a, // @[:@6.4]
  output [7:0]  io_b, // @[:@6.4]
  input  [7:0]  io_y, // @[:@6.4]
  input  [15:0] io_prod, // @[:@6.4]
  input         io_ovfl, // @[:@6.4]
  input         io_zero, // @[:@6.4]
  input         io_neg, // @[:@6.4]
  input  [2:0]  io_ctrl // @[:@6.4]
);
  reg [1:0] value; // @[Counter.scala 26:33:@8.4]
  reg [31:0] _RAND_0;
  wire [2:0] _T_27; // @[Counter.scala 35:22:@11.6]
  wire [1:0] _T_28; // @[Counter.scala 35:22:@12.6]
  wire [1:0] _GEN_0; // @[Test.scala 21:14:@17.4]
  wire [1:0] _T_32; // @[Test.scala 21:14:@17.4]
  wire  slowclk; // @[Test.scala 21:19:@18.4]
  reg [7:0] value_1; // @[Counter.scala 26:33:@25.4]
  reg [31:0] _RAND_1;
  wire [8:0] _T_42; // @[Counter.scala 35:22:@28.6]
  wire [7:0] _T_43; // @[Counter.scala 35:22:@29.6]
  wire [7:0] _GEN_2; // @[Counter.scala 63:17:@26.4]
  reg [7:0] value_2; // @[Counter.scala 26:33:@34.4]
  reg [31:0] _RAND_2;
  wire [8:0] _T_51; // @[Counter.scala 35:22:@37.6]
  wire [7:0] _T_52; // @[Counter.scala 35:22:@38.6]
  wire  countOn; // @[Test.scala 29:12:@42.4]
  wire [7:0] _GEN_3; // @[Counter.scala 63:17:@35.4]
  reg [7:0] aIn; // @[Test.scala 39:20:@52.4]
  reg [31:0] _RAND_3;
  reg [7:0] bIn; // @[Test.scala 40:20:@54.4]
  reg [31:0] _RAND_4;
  reg [15:0] prodIn; // @[Test.scala 41:23:@56.4]
  reg [31:0] _RAND_5;
  reg  ovflIn; // @[Test.scala 42:23:@58.4]
  reg [31:0] _RAND_6;
  reg [2:0] ctrlIn; // @[Test.scala 47:23:@64.4]
  reg [31:0] _RAND_7;
  wire  _T_72; // @[Test.scala 52:18:@67.6]
  wire  _T_75; // @[Test.scala 53:15:@70.8]
  wire  _T_76; // @[Test.scala 54:25:@76.8]
  wire  _T_80; // @[Test.scala 56:25:@85.10]
  wire  _T_84; // @[Test.scala 58:25:@94.12]
  wire  _T_88; // @[Test.scala 60:25:@103.14]
  wire  _T_92; // @[Test.scala 62:25:@112.16]
  wire  _T_99; // @[Test.scala 65:25:@126.18]
  wire  _T_106; // @[Test.scala 68:25:@140.20]
  wire  _GEN_6; // @[Test.scala 55:15:@81.12]
  wire  _GEN_7; // @[Test.scala 55:15:@81.12]
  wire  _GEN_9; // @[Test.scala 57:15:@90.14]
  wire  _GEN_10; // @[Test.scala 57:15:@90.14]
  wire  _GEN_11; // @[Test.scala 57:15:@90.14]
  wire  _GEN_15; // @[Test.scala 59:15:@99.16]
  wire  _GEN_16; // @[Test.scala 59:15:@99.16]
  wire  _GEN_17; // @[Test.scala 59:15:@99.16]
  wire  _GEN_23; // @[Test.scala 61:15:@108.18]
  wire  _GEN_24; // @[Test.scala 61:15:@108.18]
  wire  _GEN_25; // @[Test.scala 61:15:@108.18]
  wire  _GEN_33; // @[Test.scala 63:15:@117.20]
  wire  _GEN_34; // @[Test.scala 63:15:@117.20]
  wire  _GEN_35; // @[Test.scala 63:15:@117.20]
  wire  _GEN_55; // @[Test.scala 66:15:@131.22]
  wire  _GEN_56; // @[Test.scala 66:15:@131.22]
  wire  _GEN_57; // @[Test.scala 66:15:@131.22]
  wire  _GEN_81; // @[Test.scala 69:15:@145.24]
  wire  _GEN_82; // @[Test.scala 69:15:@145.24]
  wire  _GEN_83; // @[Test.scala 69:15:@145.24]
  wire  _GEN_111; // @[Test.scala 72:15:@157.24]
  wire  _GEN_112; // @[Test.scala 72:15:@157.24]
  assign _T_27 = value + 2'h1; // @[Counter.scala 35:22:@11.6]
  assign _T_28 = value + 2'h1; // @[Counter.scala 35:22:@12.6]
  assign _GEN_0 = value % 2'h2; // @[Test.scala 21:14:@17.4]
  assign _T_32 = _GEN_0[1:0]; // @[Test.scala 21:14:@17.4]
  assign slowclk = _T_32 == 2'h0; // @[Test.scala 21:19:@18.4]
  assign _T_42 = value_1 + 8'h1; // @[Counter.scala 35:22:@28.6]
  assign _T_43 = value_1 + 8'h1; // @[Counter.scala 35:22:@29.6]
  assign _GEN_2 = slowclk ? _T_43 : value_1; // @[Counter.scala 63:17:@26.4]
  assign _T_51 = value_2 + 8'h1; // @[Counter.scala 35:22:@37.6]
  assign _T_52 = value_2 + 8'h1; // @[Counter.scala 35:22:@38.6]
  assign countOn = value_1 > 8'h8; // @[Test.scala 29:12:@42.4]
  assign _GEN_3 = countOn ? _T_52 : value_2; // @[Counter.scala 63:17:@35.4]
  assign _T_72 = ctrlIn == 3'h0; // @[Test.scala 52:18:@67.6]
  assign _T_75 = reset == 1'h0; // @[Test.scala 53:15:@70.8]
  assign _T_76 = ctrlIn == 3'h1; // @[Test.scala 54:25:@76.8]
  assign _T_80 = ctrlIn == 3'h2; // @[Test.scala 56:25:@85.10]
  assign _T_84 = ctrlIn == 3'h3; // @[Test.scala 58:25:@94.12]
  assign _T_88 = ctrlIn == 3'h4; // @[Test.scala 60:25:@103.14]
  assign _T_92 = ctrlIn == 3'h5; // @[Test.scala 62:25:@112.16]
  assign _T_99 = ctrlIn == 3'h6; // @[Test.scala 65:25:@126.18]
  assign _T_106 = ctrlIn == 3'h7; // @[Test.scala 68:25:@140.20]
  assign io_a = value_1; // @[Test.scala 37:8:@51.4]
  assign io_b = countOn ? value_2 : 8'h1; // @[Test.scala 31:10:@45.6 Test.scala 34:10:@49.6]
  assign _GEN_6 = _T_72 == 1'h0; // @[Test.scala 55:15:@81.12]
  assign _GEN_7 = _GEN_6 & _T_76; // @[Test.scala 55:15:@81.12]
  assign _GEN_9 = _T_76 == 1'h0; // @[Test.scala 57:15:@90.14]
  assign _GEN_10 = _GEN_6 & _GEN_9; // @[Test.scala 57:15:@90.14]
  assign _GEN_11 = _GEN_10 & _T_80; // @[Test.scala 57:15:@90.14]
  assign _GEN_15 = _T_80 == 1'h0; // @[Test.scala 59:15:@99.16]
  assign _GEN_16 = _GEN_10 & _GEN_15; // @[Test.scala 59:15:@99.16]
  assign _GEN_17 = _GEN_16 & _T_84; // @[Test.scala 59:15:@99.16]
  assign _GEN_23 = _T_84 == 1'h0; // @[Test.scala 61:15:@108.18]
  assign _GEN_24 = _GEN_16 & _GEN_23; // @[Test.scala 61:15:@108.18]
  assign _GEN_25 = _GEN_24 & _T_88; // @[Test.scala 61:15:@108.18]
  assign _GEN_33 = _T_88 == 1'h0; // @[Test.scala 63:15:@117.20]
  assign _GEN_34 = _GEN_24 & _GEN_33; // @[Test.scala 63:15:@117.20]
  assign _GEN_35 = _GEN_34 & _T_92; // @[Test.scala 63:15:@117.20]
  assign _GEN_55 = _T_92 == 1'h0; // @[Test.scala 66:15:@131.22]
  assign _GEN_56 = _GEN_34 & _GEN_55; // @[Test.scala 66:15:@131.22]
  assign _GEN_57 = _GEN_56 & _T_99; // @[Test.scala 66:15:@131.22]
  assign _GEN_81 = _T_99 == 1'h0; // @[Test.scala 69:15:@145.24]
  assign _GEN_82 = _GEN_56 & _GEN_81; // @[Test.scala 69:15:@145.24]
  assign _GEN_83 = _GEN_82 & _T_106; // @[Test.scala 69:15:@145.24]
  assign _GEN_111 = _T_106 == 1'h0; // @[Test.scala 72:15:@157.24]
  assign _GEN_112 = _GEN_82 & _GEN_111; // @[Test.scala 72:15:@157.24]
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
  aIn = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  bIn = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  prodIn = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ovflIn = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ctrlIn = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 2'h0;
    end else begin
      value <= _T_28;
    end
    if (reset) begin
      value_1 <= 8'h0;
    end else begin
      if (slowclk) begin
        value_1 <= _T_43;
      end
    end
    if (reset) begin
      value_2 <= 8'h0;
    end else begin
      if (countOn) begin
        value_2 <= _T_52;
      end
    end
    if (reset) begin
      aIn <= 8'h0;
    end else begin
      aIn <= io_a;
    end
    if (reset) begin
      bIn <= 8'h0;
    end else begin
      bIn <= io_b;
    end
    if (reset) begin
      prodIn <= 16'h0;
    end else begin
      prodIn <= io_prod;
    end
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
        if (_T_72 & _T_75) begin
          $fwrite(32'h80000002,"passThrough \n"); // @[Test.scala 53:15:@72.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_7 & _T_75) begin
          $fwrite(32'h80000002,"add \n"); // @[Test.scala 55:15:@81.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_11 & _T_75) begin
          $fwrite(32'h80000002,"subtract \n"); // @[Test.scala 57:15:@90.14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_17 & _T_75) begin
          $fwrite(32'h80000002,"multiply \n"); // @[Test.scala 59:15:@99.16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25 & _T_75) begin
          $fwrite(32'h80000002,"divide \n"); // @[Test.scala 61:15:@108.18]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_75) begin
          $fwrite(32'h80000002,"and \n"); // @[Test.scala 63:15:@117.20]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_75) begin
          $fwrite(32'h80000002,"%b &\n%b = \n%b \n",aIn,bIn,io_y); // @[Test.scala 64:15:@122.20]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_57 & _T_75) begin
          $fwrite(32'h80000002,"or \n"); // @[Test.scala 66:15:@131.22]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_57 & _T_75) begin
          $fwrite(32'h80000002,"%b |\n%b = \n%b \n",aIn,bIn,io_y); // @[Test.scala 67:15:@136.22]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_83 & _T_75) begin
          $fwrite(32'h80000002,"xor \n"); // @[Test.scala 69:15:@145.24]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_83 & _T_75) begin
          $fwrite(32'h80000002,"%b ^\n%b = \n%b \n",aIn,bIn,io_y); // @[Test.scala 70:15:@150.24]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_112 & _T_75) begin
          $fwrite(32'h80000002," \n"); // @[Test.scala 72:15:@157.24]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_75) begin
          $fwrite(32'h80000002,"a:%d b:%d result:%d prod:%d \novfl:%d zero:%d neg:%d \n \n",aIn,bIn,io_y,prodIn,ovflIn,io_zero,io_neg); // @[Test.scala 76:11:@163.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ALU( // @[:@167.2]
  input         clock, // @[:@168.4]
  input         reset, // @[:@169.4]
  input  [7:0]  io_a, // @[:@170.4]
  input  [7:0]  io_b, // @[:@170.4]
  input  [2:0]  io_ctrl, // @[:@170.4]
  output [7:0]  io_result, // @[:@170.4]
  output        io_negative, // @[:@170.4]
  output        io_zero, // @[:@170.4]
  output        io_overflow, // @[:@170.4]
  output [15:0] io_product // @[:@170.4]
);
  wire  _T_24; // @[Adder.scala 20:30:@175.4]
  wire [8:0] _T_26; // @[Adder.scala 21:23:@178.4]
  wire [7:0] addition; // @[Adder.scala 21:23:@179.4]
  reg [7:0] storedValue; // @[Adder.scala 22:29:@180.4]
  reg [31:0] _RAND_0;
  wire  _T_30; // @[Adder.scala 26:16:@184.4]
  wire  _T_31; // @[Adder.scala 28:23:@189.6]
  wire  _T_34; // @[Adder.scala 30:23:@196.8]
  wire [8:0] _T_35; // @[Adder.scala 31:17:@198.10]
  wire [8:0] _T_36; // @[Adder.scala 31:17:@199.10]
  wire [7:0] _T_37; // @[Adder.scala 31:17:@200.10]
  wire  _T_38; // @[Adder.scala 32:23:@204.10]
  wire [15:0] _T_39; // @[Adder.scala 33:24:@206.12]
  wire  _T_40; // @[Adder.scala 35:23:@211.12]
  wire [7:0] _T_41; // @[Adder.scala 36:17:@213.14]
  wire  _T_42; // @[Adder.scala 37:23:@217.14]
  wire [7:0] _T_43; // @[Adder.scala 38:17:@219.16]
  wire  _T_44; // @[Adder.scala 39:23:@223.16]
  wire [7:0] _T_45; // @[Adder.scala 40:17:@225.18]
  wire  _T_46; // @[Adder.scala 41:23:@229.18]
  wire [7:0] _T_47; // @[Adder.scala 42:17:@231.20]
  wire [7:0] _GEN_0; // @[Adder.scala 41:32:@230.18]
  wire [7:0] _GEN_1; // @[Adder.scala 39:31:@224.16]
  wire [7:0] _GEN_2; // @[Adder.scala 37:32:@218.14]
  wire [7:0] _GEN_3; // @[Adder.scala 35:35:@212.12]
  wire [15:0] _GEN_4; // @[Adder.scala 32:37:@205.10]
  wire [15:0] _GEN_5; // @[Adder.scala 32:37:@205.10]
  wire [15:0] _GEN_6; // @[Adder.scala 30:37:@197.8]
  wire [15:0] _GEN_7; // @[Adder.scala 30:37:@197.8]
  wire [15:0] _GEN_8; // @[Adder.scala 28:32:@190.6]
  wire [15:0] _GEN_9; // @[Adder.scala 28:32:@190.6]
  wire [15:0] _GEN_10; // @[Adder.scala 26:33:@185.4]
  wire  _T_49; // @[Adder.scala 48:23:@238.4]
  wire  _T_50; // @[Adder.scala 48:44:@239.4]
  wire  _T_51; // @[Adder.scala 48:36:@240.4]
  wire [7:0] out; // @[Adder.scala 18:17:@172.4 Adder.scala 27:9:@186.6 Adder.scala 29:9:@193.8 Adder.scala 31:9:@201.10 Adder.scala 34:9:@208.12 Adder.scala 36:9:@214.14 Adder.scala 38:9:@220.16 Adder.scala 40:9:@226.18 Adder.scala 42:9:@232.20 Adder.scala 44:9:@235.20]
  wire  _T_52; // @[Adder.scala 48:65:@241.4]
  wire  _T_54; // @[Adder.scala 48:78:@243.4]
  assign _T_24 = io_result != 8'h0; // @[Adder.scala 20:30:@175.4]
  assign _T_26 = io_a + io_b; // @[Adder.scala 21:23:@178.4]
  assign addition = io_a + io_b; // @[Adder.scala 21:23:@179.4]
  assign _T_30 = io_ctrl == 3'h0; // @[Adder.scala 26:16:@184.4]
  assign _T_31 = io_ctrl == 3'h1; // @[Adder.scala 28:23:@189.6]
  assign _T_34 = io_ctrl == 3'h2; // @[Adder.scala 30:23:@196.8]
  assign _T_35 = io_a - io_b; // @[Adder.scala 31:17:@198.10]
  assign _T_36 = $unsigned(_T_35); // @[Adder.scala 31:17:@199.10]
  assign _T_37 = _T_36[7:0]; // @[Adder.scala 31:17:@200.10]
  assign _T_38 = io_ctrl == 3'h3; // @[Adder.scala 32:23:@204.10]
  assign _T_39 = io_a * io_b; // @[Adder.scala 33:24:@206.12]
  assign _T_40 = io_ctrl == 3'h4; // @[Adder.scala 35:23:@211.12]
  assign _T_41 = io_a / io_b; // @[Adder.scala 36:17:@213.14]
  assign _T_42 = io_ctrl == 3'h5; // @[Adder.scala 37:23:@217.14]
  assign _T_43 = io_a & io_b; // @[Adder.scala 38:17:@219.16]
  assign _T_44 = io_ctrl == 3'h6; // @[Adder.scala 39:23:@223.16]
  assign _T_45 = io_a | io_b; // @[Adder.scala 40:17:@225.18]
  assign _T_46 = io_ctrl == 3'h7; // @[Adder.scala 41:23:@229.18]
  assign _T_47 = io_a ^ io_b; // @[Adder.scala 42:17:@231.20]
  assign _GEN_0 = _T_46 ? _T_47 : 8'h0; // @[Adder.scala 41:32:@230.18]
  assign _GEN_1 = _T_44 ? _T_45 : _GEN_0; // @[Adder.scala 39:31:@224.16]
  assign _GEN_2 = _T_42 ? _T_43 : _GEN_1; // @[Adder.scala 37:32:@218.14]
  assign _GEN_3 = _T_40 ? _T_41 : _GEN_2; // @[Adder.scala 35:35:@212.12]
  assign _GEN_4 = _T_38 ? _T_39 : 16'h0; // @[Adder.scala 32:37:@205.10]
  assign _GEN_5 = _T_38 ? io_product : {{8'd0}, _GEN_3}; // @[Adder.scala 32:37:@205.10]
  assign _GEN_6 = _T_34 ? {{8'd0}, _T_37} : _GEN_5; // @[Adder.scala 30:37:@197.8]
  assign _GEN_7 = _T_34 ? 16'h0 : _GEN_4; // @[Adder.scala 30:37:@197.8]
  assign _GEN_8 = _T_31 ? {{8'd0}, addition} : _GEN_6; // @[Adder.scala 28:32:@190.6]
  assign _GEN_9 = _T_31 ? 16'h0 : _GEN_7; // @[Adder.scala 28:32:@190.6]
  assign _GEN_10 = _T_30 ? {{8'd0}, io_a} : _GEN_8; // @[Adder.scala 26:33:@185.4]
  assign _T_49 = io_a[7]; // @[Adder.scala 48:23:@238.4]
  assign _T_50 = io_b[7]; // @[Adder.scala 48:44:@239.4]
  assign _T_51 = _T_49 == _T_50; // @[Adder.scala 48:36:@240.4]
  assign out = _GEN_10[7:0]; // @[Adder.scala 18:17:@172.4 Adder.scala 27:9:@186.6 Adder.scala 29:9:@193.8 Adder.scala 31:9:@201.10 Adder.scala 34:9:@208.12 Adder.scala 36:9:@214.14 Adder.scala 38:9:@220.16 Adder.scala 40:9:@226.18 Adder.scala 42:9:@232.20 Adder.scala 44:9:@235.20]
  assign _T_52 = out[7]; // @[Adder.scala 48:65:@241.4]
  assign _T_54 = _T_52 != _T_49; // @[Adder.scala 48:78:@243.4]
  assign io_result = storedValue; // @[Adder.scala 47:13:@237.4]
  assign io_negative = io_result[7]; // @[Adder.scala 19:15:@174.4]
  assign io_zero = ~ _T_24; // @[Adder.scala 20:15:@177.4]
  assign io_overflow = _T_51 & _T_54; // @[Adder.scala 48:15:@245.4]
  assign io_product = _T_30 ? 16'h0 : _GEN_9; // @[Adder.scala 25:14:@183.4 Adder.scala 33:16:@207.12]
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
module Test( // @[:@247.2]
  input   clock, // @[:@248.4]
  input   reset // @[:@249.4]
);
  wire  gen_clock; // @[Test.scala 82:19:@252.4]
  wire  gen_reset; // @[Test.scala 82:19:@252.4]
  wire [7:0] gen_io_a; // @[Test.scala 82:19:@252.4]
  wire [7:0] gen_io_b; // @[Test.scala 82:19:@252.4]
  wire [7:0] gen_io_y; // @[Test.scala 82:19:@252.4]
  wire [15:0] gen_io_prod; // @[Test.scala 82:19:@252.4]
  wire  gen_io_ovfl; // @[Test.scala 82:19:@252.4]
  wire  gen_io_zero; // @[Test.scala 82:19:@252.4]
  wire  gen_io_neg; // @[Test.scala 82:19:@252.4]
  wire [2:0] gen_io_ctrl; // @[Test.scala 82:19:@252.4]
  wire  alu_clock; // @[Test.scala 83:19:@255.4]
  wire  alu_reset; // @[Test.scala 83:19:@255.4]
  wire [7:0] alu_io_a; // @[Test.scala 83:19:@255.4]
  wire [7:0] alu_io_b; // @[Test.scala 83:19:@255.4]
  wire [2:0] alu_io_ctrl; // @[Test.scala 83:19:@255.4]
  wire [7:0] alu_io_result; // @[Test.scala 83:19:@255.4]
  wire  alu_io_negative; // @[Test.scala 83:19:@255.4]
  wire  alu_io_zero; // @[Test.scala 83:19:@255.4]
  wire  alu_io_overflow; // @[Test.scala 83:19:@255.4]
  wire [15:0] alu_io_product; // @[Test.scala 83:19:@255.4]
  reg [2:0] value; // @[Counter.scala 26:33:@265.4]
  reg [31:0] _RAND_0;
  wire [3:0] _T_11; // @[Counter.scala 35:22:@268.6]
  wire [2:0] _T_12; // @[Counter.scala 35:22:@269.6]
  DataGen gen ( // @[Test.scala 82:19:@252.4]
    .clock(gen_clock),
    .reset(gen_reset),
    .io_a(gen_io_a),
    .io_b(gen_io_b),
    .io_y(gen_io_y),
    .io_prod(gen_io_prod),
    .io_ovfl(gen_io_ovfl),
    .io_zero(gen_io_zero),
    .io_neg(gen_io_neg),
    .io_ctrl(gen_io_ctrl)
  );
  ALU alu ( // @[Test.scala 83:19:@255.4]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_ctrl(alu_io_ctrl),
    .io_result(alu_io_result),
    .io_negative(alu_io_negative),
    .io_zero(alu_io_zero),
    .io_overflow(alu_io_overflow),
    .io_product(alu_io_product)
  );
  assign _T_11 = value + 3'h1; // @[Counter.scala 35:22:@268.6]
  assign _T_12 = value + 3'h1; // @[Counter.scala 35:22:@269.6]
  assign gen_clock = clock; // @[:@253.4]
  assign gen_reset = reset; // @[:@254.4]
  assign gen_io_y = alu_io_result; // @[Test.scala 86:12:@260.4]
  assign gen_io_prod = alu_io_product; // @[Test.scala 87:15:@261.4]
  assign gen_io_ovfl = alu_io_overflow; // @[Test.scala 88:15:@262.4]
  assign gen_io_zero = alu_io_zero; // @[Test.scala 89:15:@263.4]
  assign gen_io_neg = alu_io_negative; // @[Test.scala 90:14:@264.4]
  assign gen_io_ctrl = value; // @[Test.scala 93:15:@274.4]
  assign alu_clock = clock; // @[:@256.4]
  assign alu_reset = reset; // @[:@257.4]
  assign alu_io_a = gen_io_a; // @[Test.scala 84:12:@258.4]
  assign alu_io_b = gen_io_b; // @[Test.scala 85:12:@259.4]
  assign alu_io_ctrl = value; // @[Test.scala 92:15:@273.4]
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
      value <= _T_12;
    end
  end
endmodule
