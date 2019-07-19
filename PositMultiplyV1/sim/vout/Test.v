module ZeroPadRight( // @[:@19.2]
  input  [9:0] io_in, // @[:@22.4]
  output [2:0] io_out // @[:@22.4]
);
  wire [3:0] _T_9; // @[PositDef.scala 139:20:@24.4]
  assign _T_9 = io_in[9:6]; // @[PositDef.scala 139:20:@24.4]
  assign io_out = _T_9[2:0]; // @[PositDef.scala 139:12:@25.4]
endmodule
module ShiftRightSticky( // @[:@27.2]
  input  [9:0] io_in, // @[:@30.4]
  output [2:0] io_out, // @[:@30.4]
  output       io_sticky // @[:@30.4]
);
  wire [9:0] padding_io_in; // @[PositDef.scala 185:23:@54.4]
  wire [2:0] padding_io_out; // @[PositDef.scala 185:23:@54.4]
  wire  valVectorOfVecs_0_2; // @[PositDef.scala 189:44:@62.4]
  wire  valVectorOfVecs_0_1; // @[PositDef.scala 189:44:@60.4]
  wire  valVectorOfVecs_0_0; // @[PositDef.scala 189:44:@58.4]
  wire [2:0] valVector_0; // @[PositDef.scala 171:40:@41.4]
  wire  valVectorOfVecs_1_2; // @[PositDef.scala 206:52:@78.4]
  wire  valVectorOfVecs_1_1; // @[PositDef.scala 212:52:@75.4]
  wire  valVectorOfVecs_1_0; // @[PositDef.scala 212:52:@72.4]
  wire [2:0] valVector_1; // @[PositDef.scala 171:40:@38.4]
  wire  valVectorOfVecs_2_2; // @[PositDef.scala 206:52:@96.4]
  wire  valVectorOfVecs_2_1; // @[PositDef.scala 206:52:@93.4]
  wire [1:0] _T_109; // @[PositDef.scala 171:40:@34.4]
  wire  valVectorOfVecs_2_0; // @[PositDef.scala 212:52:@90.4]
  wire [6:0] _T_141; // @[PositDef.scala 196:29:@64.4]
  wire  valStickyVec_0; // @[PositDef.scala 196:59:@65.4]
  wire [2:0] valSticky; // @[PositDef.scala 177:29:@46.4]
  ZeroPadRight padding ( // @[PositDef.scala 185:23:@54.4]
    .io_in(padding_io_in),
    .io_out(padding_io_out)
  );
  assign valVectorOfVecs_0_2 = padding_io_out[2]; // @[PositDef.scala 189:44:@62.4]
  assign valVectorOfVecs_0_1 = padding_io_out[1]; // @[PositDef.scala 189:44:@60.4]
  assign valVectorOfVecs_0_0 = padding_io_out[0]; // @[PositDef.scala 189:44:@58.4]
  assign valVector_0 = {valVectorOfVecs_0_2,valVectorOfVecs_0_1,valVectorOfVecs_0_0}; // @[PositDef.scala 171:40:@41.4]
  assign valVectorOfVecs_1_2 = valVector_0[2]; // @[PositDef.scala 206:52:@78.4]
  assign valVectorOfVecs_1_1 = valVector_0[1]; // @[PositDef.scala 212:52:@75.4]
  assign valVectorOfVecs_1_0 = valVector_0[0]; // @[PositDef.scala 212:52:@72.4]
  assign valVector_1 = {valVectorOfVecs_1_2,valVectorOfVecs_1_1,valVectorOfVecs_1_0}; // @[PositDef.scala 171:40:@38.4]
  assign valVectorOfVecs_2_2 = valVector_1[2]; // @[PositDef.scala 206:52:@96.4]
  assign valVectorOfVecs_2_1 = valVector_1[1]; // @[PositDef.scala 206:52:@93.4]
  assign _T_109 = {valVectorOfVecs_2_2,valVectorOfVecs_2_1}; // @[PositDef.scala 171:40:@34.4]
  assign valVectorOfVecs_2_0 = valVector_1[0]; // @[PositDef.scala 212:52:@90.4]
  assign _T_141 = io_in[6:0]; // @[PositDef.scala 196:29:@64.4]
  assign valStickyVec_0 = _T_141 != 7'h0; // @[PositDef.scala 196:59:@65.4]
  assign valSticky = {valStickyVec_0,valStickyVec_0,valStickyVec_0}; // @[PositDef.scala 177:29:@46.4]
  assign io_out = {_T_109,valVectorOfVecs_2_0}; // @[PositDef.scala 255:14:@109.4]
  assign io_sticky = valSticky[2]; // @[PositDef.scala 256:17:@111.4]
  assign padding_io_in = io_in; // @[PositDef.scala 186:17:@57.4]
endmodule
module ZeroPadRight_1( // @[:@115.2]
  input  [3:0] io_in, // @[:@118.4]
  output [1:0] io_out // @[:@118.4]
);
  wire [2:0] _T_9; // @[PositDef.scala 139:20:@120.4]
  assign _T_9 = io_in[3:1]; // @[PositDef.scala 139:20:@120.4]
  assign io_out = _T_9[1:0]; // @[PositDef.scala 139:12:@121.4]
endmodule
module PositMultiply( // @[:@123.2]
  output       io_out_isZero, // @[:@126.4]
  output       io_out_isInf, // @[:@126.4]
  output [4:0] io_out_exponent, // @[:@126.4]
  output [3:0] io_out_fraction, // @[:@126.4]
  output [1:0] io_trailingBits, // @[:@126.4]
  output       io_stickyBit // @[:@126.4]
);
  wire [9:0] shiftRightWithSticky_io_in; // @[PositMultiply.scala 49:36:@142.4]
  wire [2:0] shiftRightWithSticky_io_out; // @[PositMultiply.scala 49:36:@142.4]
  wire  shiftRightWithSticky_io_sticky; // @[PositMultiply.scala 49:36:@142.4]
  wire [3:0] zeroPadRight_io_in; // @[PositMultiply.scala 64:28:@151.4]
  wire [1:0] zeroPadRight_io_out; // @[PositMultiply.scala 64:28:@151.4]
  wire [9:0] abUnshiftedProduct; // @[PositMultiply.scala 74:54:@161.4]
  wire  abExpShift; // @[PositMultiply.scala 78:35:@163.4]
  wire [8:0] _T_43; // @[PositMultiply.scala 91:47:@175.6]
  wire [9:0] _T_45; // @[Cat.scala 30:58:@176.6]
  wire [9:0] abShiftedProduct; // @[PositMultiply.scala 88:30:@171.4]
  wire [4:0] _GEN_8; // @[PositMultiply.scala 83:42:@167.4]
  wire [5:0] _T_40; // @[PositMultiply.scala 83:42:@167.4]
  wire [4:0] _T_41; // @[PositMultiply.scala 83:42:@168.4]
  wire [5:0] abExp; // @[PositMultiply.scala 32:19:@129.4 PositMultiply.scala 83:9:@169.4]
  wire  abExpTooSmall; // @[PositMultiply.scala 96:27:@179.4]
  wire  abExpTooLarge; // @[PositMultiply.scala 99:27:@181.4]
  wire [6:0] _T_51; // @[PositMultiply.scala 101:29:@183.4]
  wire [6:0] _T_52; // @[PositMultiply.scala 101:29:@184.4]
  wire [5:0] finalExpExtended; // @[PositMultiply.scala 101:29:@185.4]
  wire [4:0] finalExp; // @[PositMultiply.scala 103:31:@187.4]
  wire  _T_69; // @[PositMultiply.scala 116:22:@204.4]
  wire [4:0] _GEN_1; // @[PositMultiply.scala 118:39:@210.6]
  wire  _T_73; // @[PositMultiply.scala 124:21:@216.4]
  wire  _T_75; // @[PositMultiply.scala 124:38:@218.4]
  wire [4:0] _T_77; // @[PositMultiply.scala 127:40:@223.6]
  wire [4:0] _GEN_3; // @[PositMultiply.scala 124:65:@219.4]
  wire  _T_81; // @[PositMultiply.scala 130:51:@229.4]
  wire [2:0] underflowProduct; // @[PositMultiply.scala 42:30:@138.4 PositMultiply.scala 54:19:@147.4]
  wire [1:0] _T_84; // @[PositMultiply.scala 133:40:@236.8]
  wire [1:0] normalTrailingBits; // @[PositMultiply.scala 45:32:@140.4 PositMultiply.scala 67:24:@156.4]
  wire [1:0] _GEN_4; // @[PositMultiply.scala 132:39:@235.6]
  wire  underflowSticky; // @[PositMultiply.scala 44:29:@139.4 PositMultiply.scala 55:19:@148.4]
  wire [1:0] _T_91; // @[PositMultiply.scala 147:40:@257.4]
  wire  normalStickyBit; // @[PositMultiply.scala 147:101:@258.4]
  wire  _GEN_6; // @[PositMultiply.scala 140:39:@251.6]
  ShiftRightSticky shiftRightWithSticky ( // @[PositMultiply.scala 49:36:@142.4]
    .io_in(shiftRightWithSticky_io_in),
    .io_out(shiftRightWithSticky_io_out),
    .io_sticky(shiftRightWithSticky_io_sticky)
  );
  ZeroPadRight_1 zeroPadRight ( // @[PositMultiply.scala 64:28:@151.4]
    .io_in(zeroPadRight_io_in),
    .io_out(zeroPadRight_io_out)
  );
  assign abUnshiftedProduct = 5'h14 * 5'h10; // @[PositMultiply.scala 74:54:@161.4]
  assign abExpShift = abUnshiftedProduct[9]; // @[PositMultiply.scala 78:35:@163.4]
  assign _T_43 = abUnshiftedProduct[8:0]; // @[PositMultiply.scala 91:47:@175.6]
  assign _T_45 = {_T_43,1'h0}; // @[Cat.scala 30:58:@176.6]
  assign abShiftedProduct = abExpShift ? abUnshiftedProduct : _T_45; // @[PositMultiply.scala 88:30:@171.4]
  assign _GEN_8 = {{4'd0}, abExpShift}; // @[PositMultiply.scala 83:42:@167.4]
  assign _T_40 = 5'h1d + _GEN_8; // @[PositMultiply.scala 83:42:@167.4]
  assign _T_41 = 5'h1d + _GEN_8; // @[PositMultiply.scala 83:42:@168.4]
  assign abExp = {{1'd0}, _T_41}; // @[PositMultiply.scala 32:19:@129.4 PositMultiply.scala 83:9:@169.4]
  assign abExpTooSmall = abExp < 6'hc; // @[PositMultiply.scala 96:27:@179.4]
  assign abExpTooLarge = abExp > 6'h24; // @[PositMultiply.scala 99:27:@181.4]
  assign _T_51 = abExp - 6'hc; // @[PositMultiply.scala 101:29:@183.4]
  assign _T_52 = $unsigned(_T_51); // @[PositMultiply.scala 101:29:@184.4]
  assign finalExpExtended = _T_52[5:0]; // @[PositMultiply.scala 101:29:@185.4]
  assign finalExp = finalExpExtended[4:0]; // @[PositMultiply.scala 103:31:@187.4]
  assign _T_69 = io_out_isZero | io_out_isInf; // @[PositMultiply.scala 116:22:@204.4]
  assign _GEN_1 = abExpTooLarge ? 5'h18 : finalExp; // @[PositMultiply.scala 118:39:@210.6]
  assign _T_73 = io_out_isInf | io_out_isZero; // @[PositMultiply.scala 124:21:@216.4]
  assign _T_75 = _T_73 | abExpTooLarge; // @[PositMultiply.scala 124:38:@218.4]
  assign _T_77 = abShiftedProduct[8:4]; // @[PositMultiply.scala 127:40:@223.6]
  assign _GEN_3 = _T_75 ? 5'h0 : _T_77; // @[PositMultiply.scala 124:65:@219.4]
  assign _T_81 = io_out_isInf | abExpTooLarge; // @[PositMultiply.scala 130:51:@229.4]
  assign underflowProduct = shiftRightWithSticky_io_out; // @[PositMultiply.scala 42:30:@138.4 PositMultiply.scala 54:19:@147.4]
  assign _T_84 = underflowProduct[1:0]; // @[PositMultiply.scala 133:40:@236.8]
  assign normalTrailingBits = zeroPadRight_io_out; // @[PositMultiply.scala 45:32:@140.4 PositMultiply.scala 67:24:@156.4]
  assign _GEN_4 = abExpTooSmall ? _T_84 : normalTrailingBits; // @[PositMultiply.scala 132:39:@235.6]
  assign underflowSticky = shiftRightWithSticky_io_sticky; // @[PositMultiply.scala 44:29:@139.4 PositMultiply.scala 55:19:@148.4]
  assign _T_91 = abShiftedProduct[1:0]; // @[PositMultiply.scala 147:40:@257.4]
  assign normalStickyBit = _T_91 != 2'h0; // @[PositMultiply.scala 147:101:@258.4]
  assign _GEN_6 = abExpTooSmall ? underflowSticky : normalStickyBit; // @[PositMultiply.scala 140:39:@251.6]
  assign io_out_isZero = 1'h0; // @[PositMultiply.scala 112:17:@199.4]
  assign io_out_isInf = 1'h0; // @[PositMultiply.scala 110:16:@195.4]
  assign io_out_exponent = _T_69 ? 5'h0 : _GEN_1; // @[PositMultiply.scala 117:21:@206.6 PositMultiply.scala 119:21:@211.8 PositMultiply.scala 121:21:@214.8]
  assign io_out_fraction = _GEN_3[3:0]; // @[PositMultiply.scala 125:21:@220.6 PositMultiply.scala 127:21:@224.6]
  assign io_trailingBits = _T_81 ? 2'h0 : _GEN_4; // @[PositMultiply.scala 131:21:@231.6 PositMultiply.scala 133:21:@237.8 PositMultiply.scala 135:21:@240.8]
  assign io_stickyBit = _T_81 ? 1'h0 : _GEN_6; // @[PositMultiply.scala 139:18:@247.6 PositMultiply.scala 141:18:@252.8 PositMultiply.scala 143:18:@255.8]
  assign shiftRightWithSticky_io_in = abExpShift ? abUnshiftedProduct : _T_45; // @[PositMultiply.scala 52:30:@145.4]
  assign zeroPadRight_io_in = abShiftedProduct[3:0]; // @[PositMultiply.scala 66:22:@155.4]
endmodule
module Test( // @[:@261.2]
  input   clock, // @[:@262.4]
  input   reset // @[:@263.4]
);
  wire  multiply_io_out_isZero; // @[Test.scala 33:24:@269.4]
  wire  multiply_io_out_isInf; // @[Test.scala 33:24:@269.4]
  wire [4:0] multiply_io_out_exponent; // @[Test.scala 33:24:@269.4]
  wire [3:0] multiply_io_out_fraction; // @[Test.scala 33:24:@269.4]
  wire [1:0] multiply_io_trailingBits; // @[Test.scala 33:24:@269.4]
  wire  multiply_io_stickyBit; // @[Test.scala 33:24:@269.4]
  wire  _T_10; // @[Test.scala 48:11:@293.4]
  wire [1:0] trailingBits; // @[Test.scala 37:26:@282.4 Test.scala 40:16:@284.4]
  wire  stickyBit; // @[Test.scala 38:23:@283.4 Test.scala 41:13:@285.4]
  PositMultiply multiply ( // @[Test.scala 33:24:@269.4]
    .io_out_isZero(multiply_io_out_isZero),
    .io_out_isInf(multiply_io_out_isInf),
    .io_out_exponent(multiply_io_out_exponent),
    .io_out_fraction(multiply_io_out_fraction),
    .io_trailingBits(multiply_io_trailingBits),
    .io_stickyBit(multiply_io_stickyBit)
  );
  assign _T_10 = reset == 1'h0; // @[Test.scala 48:11:@293.4]
  assign trailingBits = multiply_io_trailingBits; // @[Test.scala 37:26:@282.4 Test.scala 40:16:@284.4]
  assign stickyBit = multiply_io_stickyBit; // @[Test.scala 38:23:@283.4 Test.scala 41:13:@285.4]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10) begin
          $fwrite(32'h80000002,"a.exponent is %b \n",5'he); // @[Test.scala 48:11:@295.6]
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
          $fwrite(32'h80000002,"a.fraction is %b \n",4'h4); // @[Test.scala 49:11:@300.6]
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
          $fwrite(32'h80000002,"b.exponent is %b \n",5'hf); // @[Test.scala 50:11:@305.6]
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
          $fwrite(32'h80000002,"b.fraction is %b \n",4'h0); // @[Test.scala 51:11:@310.6]
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
          $fwrite(32'h80000002,"out.sign is %b \n",1'h0); // @[Test.scala 53:11:@315.6]
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
          $fwrite(32'h80000002,"out.isZero is %b \n",1'h0); // @[Test.scala 54:11:@320.6]
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
          $fwrite(32'h80000002,"out.isInf is %b \n",1'h0); // @[Test.scala 55:11:@325.6]
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
          $fwrite(32'h80000002,"out.trailingBits is %b \n",trailingBits); // @[Test.scala 57:11:@330.6]
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
          $fwrite(32'h80000002,"out.stickyBit is %b \n",stickyBit); // @[Test.scala 58:11:@335.6]
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
          $fwrite(32'h80000002,"out.exponent is %b \n",multiply_io_out_exponent); // @[Test.scala 60:11:@340.6]
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
          $fwrite(32'h80000002,"out.fraction is %b \n",multiply_io_out_fraction); // @[Test.scala 61:11:@345.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
