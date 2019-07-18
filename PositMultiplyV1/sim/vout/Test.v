module PositMultiply( // @[:@19.2]
  output       io_out_isZero, // @[:@22.4]
  output       io_out_isInf, // @[:@22.4]
  output [4:0] io_out_exponent, // @[:@22.4]
  output [3:0] io_out_fraction, // @[:@22.4]
  output       io_stickyBit // @[:@22.4]
);
  wire [9:0] abUnshiftedProduct; // @[PositMultiply.scala 62:54:@45.4]
  wire  abExpShift; // @[PositMultiply.scala 64:35:@47.4]
  wire [4:0] _GEN_8; // @[PositMultiply.scala 66:42:@51.4]
  wire [5:0] _T_41; // @[PositMultiply.scala 66:42:@51.4]
  wire [4:0] _T_42; // @[PositMultiply.scala 66:42:@52.4]
  wire [8:0] _T_44; // @[PositMultiply.scala 71:47:@59.6]
  wire [9:0] _T_46; // @[Cat.scala 30:58:@60.6]
  wire [9:0] abShiftedProduct; // @[PositMultiply.scala 68:30:@55.4]
  wire [5:0] abExp; // @[PositMultiply.scala 37:19:@25.4 PositMultiply.scala 66:9:@53.4]
  wire  abExpTooSmall; // @[PositMultiply.scala 75:27:@63.4]
  wire  abExpTooLarge; // @[PositMultiply.scala 77:27:@65.4]
  wire [6:0] _T_52; // @[PositMultiply.scala 79:29:@67.4]
  wire [6:0] _T_53; // @[PositMultiply.scala 79:29:@68.4]
  wire [5:0] finalExpExtended; // @[PositMultiply.scala 79:29:@69.4]
  wire [4:0] finalExp; // @[PositMultiply.scala 81:31:@71.4]
  wire  _T_70; // @[PositMultiply.scala 91:22:@88.4]
  wire [4:0] _GEN_1; // @[PositMultiply.scala 93:39:@94.6]
  wire  _T_74; // @[PositMultiply.scala 99:21:@100.4]
  wire  _T_76; // @[PositMultiply.scala 99:38:@102.4]
  wire [4:0] _T_78; // @[PositMultiply.scala 102:40:@107.6]
  wire [4:0] _GEN_3; // @[PositMultiply.scala 99:65:@103.4]
  wire  _T_82; // @[PositMultiply.scala 105:51:@113.4]
  wire [1:0] _T_92; // @[PositMultiply.scala 122:40:@141.4]
  wire  normalStickyBit; // @[PositMultiply.scala 122:101:@142.4]
  wire  _GEN_6; // @[PositMultiply.scala 115:39:@135.6]
  assign abUnshiftedProduct = 5'h10 * 5'h15; // @[PositMultiply.scala 62:54:@45.4]
  assign abExpShift = abUnshiftedProduct[9]; // @[PositMultiply.scala 64:35:@47.4]
  assign _GEN_8 = {{4'd0}, abExpShift}; // @[PositMultiply.scala 66:42:@51.4]
  assign _T_41 = 5'hf + _GEN_8; // @[PositMultiply.scala 66:42:@51.4]
  assign _T_42 = 5'hf + _GEN_8; // @[PositMultiply.scala 66:42:@52.4]
  assign _T_44 = abUnshiftedProduct[8:0]; // @[PositMultiply.scala 71:47:@59.6]
  assign _T_46 = {_T_44,1'h0}; // @[Cat.scala 30:58:@60.6]
  assign abShiftedProduct = abExpShift ? abUnshiftedProduct : _T_46; // @[PositMultiply.scala 68:30:@55.4]
  assign abExp = {{1'd0}, _T_42}; // @[PositMultiply.scala 37:19:@25.4 PositMultiply.scala 66:9:@53.4]
  assign abExpTooSmall = abExp < 6'hc; // @[PositMultiply.scala 75:27:@63.4]
  assign abExpTooLarge = abExp > 6'h24; // @[PositMultiply.scala 77:27:@65.4]
  assign _T_52 = abExp - 6'hc; // @[PositMultiply.scala 79:29:@67.4]
  assign _T_53 = $unsigned(_T_52); // @[PositMultiply.scala 79:29:@68.4]
  assign finalExpExtended = _T_53[5:0]; // @[PositMultiply.scala 79:29:@69.4]
  assign finalExp = finalExpExtended[4:0]; // @[PositMultiply.scala 81:31:@71.4]
  assign _T_70 = io_out_isZero | io_out_isInf; // @[PositMultiply.scala 91:22:@88.4]
  assign _GEN_1 = abExpTooLarge ? 5'h18 : finalExp; // @[PositMultiply.scala 93:39:@94.6]
  assign _T_74 = io_out_isInf | io_out_isZero; // @[PositMultiply.scala 99:21:@100.4]
  assign _T_76 = _T_74 | abExpTooLarge; // @[PositMultiply.scala 99:38:@102.4]
  assign _T_78 = abShiftedProduct[8:4]; // @[PositMultiply.scala 102:40:@107.6]
  assign _GEN_3 = _T_76 ? 5'h0 : _T_78; // @[PositMultiply.scala 99:65:@103.4]
  assign _T_82 = io_out_isInf | abExpTooLarge; // @[PositMultiply.scala 105:51:@113.4]
  assign _T_92 = abShiftedProduct[1:0]; // @[PositMultiply.scala 122:40:@141.4]
  assign normalStickyBit = _T_92 != 2'h0; // @[PositMultiply.scala 122:101:@142.4]
  assign _GEN_6 = abExpTooSmall ? 1'h1 : normalStickyBit; // @[PositMultiply.scala 115:39:@135.6]
  assign io_out_isZero = 1'h0; // @[PositMultiply.scala 87:17:@83.4]
  assign io_out_isInf = 1'h0; // @[PositMultiply.scala 85:16:@79.4]
  assign io_out_exponent = _T_70 ? 5'h0 : _GEN_1; // @[PositMultiply.scala 92:21:@90.6 PositMultiply.scala 94:21:@95.8 PositMultiply.scala 96:21:@98.8]
  assign io_out_fraction = _GEN_3[3:0]; // @[PositMultiply.scala 100:21:@104.6 PositMultiply.scala 102:21:@108.6]
  assign io_stickyBit = _T_82 ? 1'h0 : _GEN_6; // @[PositMultiply.scala 114:18:@131.6 PositMultiply.scala 116:18:@136.8 PositMultiply.scala 118:18:@139.8]
endmodule
module Test( // @[:@145.2]
  input   clock, // @[:@146.4]
  input   reset // @[:@147.4]
);
  wire  multiply_io_out_isZero; // @[Test.scala 33:24:@153.4]
  wire  multiply_io_out_isInf; // @[Test.scala 33:24:@153.4]
  wire [4:0] multiply_io_out_exponent; // @[Test.scala 33:24:@153.4]
  wire [3:0] multiply_io_out_fraction; // @[Test.scala 33:24:@153.4]
  wire  multiply_io_stickyBit; // @[Test.scala 33:24:@153.4]
  wire  _T_10; // @[Test.scala 48:11:@177.4]
  wire  stickyBit; // @[Test.scala 38:23:@167.4 Test.scala 41:13:@169.4]
  PositMultiply multiply ( // @[Test.scala 33:24:@153.4]
    .io_out_isZero(multiply_io_out_isZero),
    .io_out_isInf(multiply_io_out_isInf),
    .io_out_exponent(multiply_io_out_exponent),
    .io_out_fraction(multiply_io_out_fraction),
    .io_stickyBit(multiply_io_stickyBit)
  );
  assign _T_10 = reset == 1'h0; // @[Test.scala 48:11:@177.4]
  assign stickyBit = multiply_io_stickyBit; // @[Test.scala 38:23:@167.4 Test.scala 41:13:@169.4]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"a.exponent is %b \n",5'h5); // @[Test.scala 48:11:@179.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"a.fraction is %b \n",4'h0); // @[Test.scala 49:11:@184.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"b.exponent is %b \n",5'ha); // @[Test.scala 50:11:@189.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"b.fraction is %b \n",4'h5); // @[Test.scala 51:11:@194.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"out.sign is %b \n",1'h0); // @[Test.scala 53:11:@199.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"out.isZero is %b \n",1'h0); // @[Test.scala 54:11:@204.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"out.isInf is %b \n",1'h0); // @[Test.scala 55:11:@209.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"out.trailingBits is %b \n",2'h0); // @[Test.scala 57:11:@214.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"out.stickyBit is %b \n",stickyBit); // @[Test.scala 58:11:@219.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"out.exponent is %b \n",multiply_io_out_exponent); // @[Test.scala 60:11:@224.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"out.fraction is %b \n",multiply_io_out_fraction); // @[Test.scala 61:11:@229.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
