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
  assign io_out = {_T_109,valVectorOfVecs_2_0}; // @[PositDef.scala 257:14:@109.4]
  assign io_sticky = valSticky[2]; // @[PositDef.scala 258:17:@111.4]
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
  input        io_a_isZero, // @[:@126.4]
  input        io_a_isInf, // @[:@126.4]
  input        io_a_sign, // @[:@126.4]
  input  [4:0] io_a_exponent, // @[:@126.4]
  input  [3:0] io_a_fraction, // @[:@126.4]
  input        io_b_isZero, // @[:@126.4]
  input        io_b_isInf, // @[:@126.4]
  input        io_b_sign, // @[:@126.4]
  input  [4:0] io_b_exponent, // @[:@126.4]
  input  [3:0] io_b_fraction, // @[:@126.4]
  output       io_out_isZero, // @[:@126.4]
  output       io_out_isInf, // @[:@126.4]
  output       io_out_sign, // @[:@126.4]
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
  wire [4:0] _T_33; // @[Cat.scala 30:58:@159.4]
  wire [4:0] _T_35; // @[Cat.scala 30:58:@160.4]
  wire [9:0] abUnshiftedProduct; // @[PositMultiply.scala 74:54:@161.4]
  wire  abExpShift; // @[PositMultiply.scala 78:35:@163.4]
  wire [8:0] _T_43; // @[PositMultiply.scala 91:47:@175.6]
  wire [9:0] _T_45; // @[Cat.scala 30:58:@176.6]
  wire [9:0] abShiftedProduct; // @[PositMultiply.scala 88:30:@171.4]
  wire  abSign; // @[PositMultiply.scala 70:23:@157.4]
  wire [5:0] _T_38; // @[PositMultiply.scala 83:26:@165.4]
  wire [4:0] _T_39; // @[PositMultiply.scala 83:26:@166.4]
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
  wire  _T_62; // @[PositMultiply.scala 112:21:@196.4]
  wire  _T_63; // @[PositMultiply.scala 112:52:@197.4]
  wire  _T_69; // @[PositMultiply.scala 116:22:@204.4]
  wire [4:0] _GEN_1; // @[PositMultiply.scala 118:39:@210.6]
  wire  _T_73; // @[PositMultiply.scala 124:21:@216.4]
  wire  _T_75; // @[PositMultiply.scala 124:38:@218.4]
  wire [3:0] _T_77; // @[PositMultiply.scala 127:40:@223.6]
  wire  _T_78; // @[PositMultiply.scala 130:21:@226.4]
  wire  _T_79; // @[PositMultiply.scala 130:36:@227.4]
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
  assign _T_33 = {1'h1,io_a_fraction}; // @[Cat.scala 30:58:@159.4]
  assign _T_35 = {1'h1,io_b_fraction}; // @[Cat.scala 30:58:@160.4]
  assign abUnshiftedProduct = _T_33 * _T_35; // @[PositMultiply.scala 74:54:@161.4]
  assign abExpShift = abUnshiftedProduct[9]; // @[PositMultiply.scala 78:35:@163.4]
  assign _T_43 = abUnshiftedProduct[8:0]; // @[PositMultiply.scala 91:47:@175.6]
  assign _T_45 = {_T_43,1'h0}; // @[Cat.scala 30:58:@176.6]
  assign abShiftedProduct = abExpShift ? abUnshiftedProduct : _T_45; // @[PositMultiply.scala 88:30:@171.4]
  assign abSign = io_a_sign ^ io_b_sign; // @[PositMultiply.scala 70:23:@157.4]
  assign _T_38 = io_a_exponent + io_b_exponent; // @[PositMultiply.scala 83:26:@165.4]
  assign _T_39 = io_a_exponent + io_b_exponent; // @[PositMultiply.scala 83:26:@166.4]
  assign _GEN_8 = {{4'd0}, abExpShift}; // @[PositMultiply.scala 83:42:@167.4]
  assign _T_40 = _T_39 + _GEN_8; // @[PositMultiply.scala 83:42:@167.4]
  assign _T_41 = _T_39 + _GEN_8; // @[PositMultiply.scala 83:42:@168.4]
  assign abExp = {{1'd0}, _T_41}; // @[PositMultiply.scala 32:19:@129.4 PositMultiply.scala 83:9:@169.4]
  assign abExpTooSmall = abExp < 6'hc; // @[PositMultiply.scala 96:27:@179.4]
  assign abExpTooLarge = abExp > 6'h24; // @[PositMultiply.scala 99:27:@181.4]
  assign _T_51 = abExp - 6'hc; // @[PositMultiply.scala 101:29:@183.4]
  assign _T_52 = $unsigned(_T_51); // @[PositMultiply.scala 101:29:@184.4]
  assign finalExpExtended = _T_52[5:0]; // @[PositMultiply.scala 101:29:@185.4]
  assign finalExp = finalExpExtended[4:0]; // @[PositMultiply.scala 103:31:@187.4]
  assign _T_62 = io_out_isInf == 1'h0; // @[PositMultiply.scala 112:21:@196.4]
  assign _T_63 = io_a_isZero | io_b_isZero; // @[PositMultiply.scala 112:52:@197.4]
  assign _T_69 = io_out_isZero | io_out_isInf; // @[PositMultiply.scala 116:22:@204.4]
  assign _GEN_1 = abExpTooLarge ? 5'h18 : finalExp; // @[PositMultiply.scala 118:39:@210.6]
  assign _T_73 = io_out_isInf | io_out_isZero; // @[PositMultiply.scala 124:21:@216.4]
  assign _T_75 = _T_73 | abExpTooLarge; // @[PositMultiply.scala 124:38:@218.4]
  assign _T_77 = abShiftedProduct[8:5]; // @[PositMultiply.scala 127:40:@223.6]
  assign _T_78 = io_out_isInf | io_a_isZero; // @[PositMultiply.scala 130:21:@226.4]
  assign _T_79 = _T_78 | io_b_isZero; // @[PositMultiply.scala 130:36:@227.4]
  assign _T_81 = _T_79 | abExpTooLarge; // @[PositMultiply.scala 130:51:@229.4]
  assign underflowProduct = shiftRightWithSticky_io_out; // @[PositMultiply.scala 42:30:@138.4 PositMultiply.scala 54:19:@147.4]
  assign _T_84 = underflowProduct[1:0]; // @[PositMultiply.scala 133:40:@236.8]
  assign normalTrailingBits = zeroPadRight_io_out; // @[PositMultiply.scala 45:32:@140.4 PositMultiply.scala 67:24:@156.4]
  assign _GEN_4 = abExpTooSmall ? _T_84 : normalTrailingBits; // @[PositMultiply.scala 132:39:@235.6]
  assign underflowSticky = shiftRightWithSticky_io_sticky; // @[PositMultiply.scala 44:29:@139.4 PositMultiply.scala 55:19:@148.4]
  assign _T_91 = abShiftedProduct[1:0]; // @[PositMultiply.scala 147:40:@257.4]
  assign normalStickyBit = _T_91 != 2'h0; // @[PositMultiply.scala 147:101:@258.4]
  assign _GEN_6 = abExpTooSmall ? underflowSticky : normalStickyBit; // @[PositMultiply.scala 140:39:@251.6]
  assign io_out_isZero = _T_62 & _T_63; // @[PositMultiply.scala 112:17:@199.4]
  assign io_out_isInf = io_a_isInf | io_b_isInf; // @[PositMultiply.scala 110:16:@195.4]
  assign io_out_sign = _T_62 & abSign; // @[PositMultiply.scala 114:15:@203.4]
  assign io_out_exponent = _T_69 ? 5'h0 : _GEN_1; // @[PositMultiply.scala 117:21:@206.6 PositMultiply.scala 119:21:@211.8 PositMultiply.scala 121:21:@214.8]
  assign io_out_fraction = _T_75 ? 4'h0 : _T_77; // @[PositMultiply.scala 125:21:@220.6 PositMultiply.scala 127:21:@224.6]
  assign io_trailingBits = _T_81 ? 2'h0 : _GEN_4; // @[PositMultiply.scala 131:21:@231.6 PositMultiply.scala 133:21:@237.8 PositMultiply.scala 135:21:@240.8]
  assign io_stickyBit = _T_81 ? 1'h0 : _GEN_6; // @[PositMultiply.scala 139:18:@247.6 PositMultiply.scala 141:18:@252.8 PositMultiply.scala 143:18:@255.8]
  assign shiftRightWithSticky_io_in = abExpShift ? abUnshiftedProduct : _T_45; // @[PositMultiply.scala 52:30:@145.4]
  assign zeroPadRight_io_in = abShiftedProduct[3:0]; // @[PositMultiply.scala 66:22:@155.4]
endmodule
module PositEncode( // @[:@261.2]
  input        io_in_isZero, // @[:@264.4]
  input        io_in_isInf, // @[:@264.4]
  input        io_in_sign, // @[:@264.4]
  input  [4:0] io_in_exponent, // @[:@264.4]
  input  [3:0] io_in_fraction, // @[:@264.4]
  output [7:0] io_out_bits // @[:@264.4]
);
  wire [3:0] _T_26; // @[UnpackedPosit.scala 26:38:@287.4]
  wire [4:0] _T_28; // @[UnpackedPosit.scala 26:92:@288.4]
  wire [4:0] _T_29; // @[UnpackedPosit.scala 26:92:@289.4]
  wire [3:0] _T_30; // @[UnpackedPosit.scala 26:92:@290.4]
  wire [3:0] signedRegime; // @[UnpackedPosit.scala 27:56:@291.4]
  wire  posRegime; // @[PositEncode.scala 55:30:@294.4]
  wire [1:0] firstBits; // @[PositEncode.scala 40:27:@275.4]
  wire  _T_20; // @[PositEncode.scala 47:55:@281.4]
  wire [6:0] _T_22; // @[Cat.scala 30:58:@283.4]
  wire [6:0] esAndFraction; // @[PositEncode.scala 47:83:@284.4]
  wire [2:0] _T_36; // @[PositEncode.scala 66:30:@298.6]
  wire [2:0] _T_38; // @[PositEncode.scala 72:18:@303.6]
  wire [2:0] shiftBits; // @[PositEncode.scala 65:27:@297.4]
  wire [6:0] esAndFractionShifted; // @[PositEncode.scala 37:41:@271.4]
  wire  _T_84; // @[PositEncode.scala 88:44:@357.8]
  wire  _GEN_3; // @[PositEncode.scala 81:28:@326.6]
  wire  outBitsVec_1; // @[PositEncode.scala 77:22:@315.4]
  wire  _T_85; // @[PositEncode.scala 88:44:@359.8]
  wire  _GEN_2; // @[PositEncode.scala 81:28:@326.6]
  wire  outBitsVec_0; // @[PositEncode.scala 77:22:@315.4]
  wire  _T_82; // @[PositEncode.scala 88:44:@353.8]
  wire  _GEN_5; // @[PositEncode.scala 81:28:@326.6]
  wire  outBitsVec_3; // @[PositEncode.scala 77:22:@315.4]
  wire  _T_83; // @[PositEncode.scala 88:44:@355.8]
  wire  _GEN_4; // @[PositEncode.scala 81:28:@326.6]
  wire  outBitsVec_2; // @[PositEncode.scala 77:22:@315.4]
  wire [3:0] _T_54; // @[PositEncode.scala 76:29:@309.4]
  wire  _T_80; // @[PositEncode.scala 88:44:@349.8]
  wire  _GEN_7; // @[PositEncode.scala 81:28:@326.6]
  wire  outBitsVec_5; // @[PositEncode.scala 77:22:@315.4]
  wire  _T_81; // @[PositEncode.scala 88:44:@351.8]
  wire  _GEN_6; // @[PositEncode.scala 81:28:@326.6]
  wire  outBitsVec_4; // @[PositEncode.scala 77:22:@315.4]
  wire  _GEN_9; // @[PositEncode.scala 81:28:@326.6]
  wire  outBitsVec_7; // @[PositEncode.scala 77:22:@315.4]
  wire  _T_79; // @[PositEncode.scala 88:44:@347.8]
  wire  _GEN_8; // @[PositEncode.scala 81:28:@326.6]
  wire  outBitsVec_6; // @[PositEncode.scala 77:22:@315.4]
  wire [3:0] _T_57; // @[PositEncode.scala 76:29:@312.4]
  assign _T_26 = io_in_exponent[4:1]; // @[UnpackedPosit.scala 26:38:@287.4]
  assign _T_28 = _T_26 - 4'h6; // @[UnpackedPosit.scala 26:92:@288.4]
  assign _T_29 = $unsigned(_T_28); // @[UnpackedPosit.scala 26:92:@289.4]
  assign _T_30 = _T_29[3:0]; // @[UnpackedPosit.scala 26:92:@290.4]
  assign signedRegime = $signed(_T_30); // @[UnpackedPosit.scala 27:56:@291.4]
  assign posRegime = $signed(signedRegime) >= $signed(4'sh0); // @[PositEncode.scala 55:30:@294.4]
  assign firstBits = posRegime ? 2'h2 : 2'h1; // @[PositEncode.scala 40:27:@275.4]
  assign _T_20 = io_in_exponent[0]; // @[PositEncode.scala 47:55:@281.4]
  assign _T_22 = {firstBits,_T_20,io_in_fraction}; // @[Cat.scala 30:58:@283.4]
  assign esAndFraction = $signed(_T_22); // @[PositEncode.scala 47:83:@284.4]
  assign _T_36 = signedRegime[2:0]; // @[PositEncode.scala 66:30:@298.6]
  assign _T_38 = ~ _T_36; // @[PositEncode.scala 72:18:@303.6]
  assign shiftBits = posRegime ? _T_36 : _T_38; // @[PositEncode.scala 65:27:@297.4]
  assign esAndFractionShifted = $signed(esAndFraction) >>> shiftBits; // @[PositEncode.scala 37:41:@271.4]
  assign _T_84 = esAndFractionShifted[1]; // @[PositEncode.scala 88:44:@357.8]
  assign _GEN_3 = io_in_isInf ? 1'h0 : _T_84; // @[PositEncode.scala 81:28:@326.6]
  assign outBitsVec_1 = io_in_isZero ? 1'h0 : _GEN_3; // @[PositEncode.scala 77:22:@315.4]
  assign _T_85 = esAndFractionShifted[0]; // @[PositEncode.scala 88:44:@359.8]
  assign _GEN_2 = io_in_isInf ? 1'h0 : _T_85; // @[PositEncode.scala 81:28:@326.6]
  assign outBitsVec_0 = io_in_isZero ? 1'h0 : _GEN_2; // @[PositEncode.scala 77:22:@315.4]
  assign _T_82 = esAndFractionShifted[3]; // @[PositEncode.scala 88:44:@353.8]
  assign _GEN_5 = io_in_isInf ? 1'h0 : _T_82; // @[PositEncode.scala 81:28:@326.6]
  assign outBitsVec_3 = io_in_isZero ? 1'h0 : _GEN_5; // @[PositEncode.scala 77:22:@315.4]
  assign _T_83 = esAndFractionShifted[2]; // @[PositEncode.scala 88:44:@355.8]
  assign _GEN_4 = io_in_isInf ? 1'h0 : _T_83; // @[PositEncode.scala 81:28:@326.6]
  assign outBitsVec_2 = io_in_isZero ? 1'h0 : _GEN_4; // @[PositEncode.scala 77:22:@315.4]
  assign _T_54 = {outBitsVec_3,outBitsVec_2,outBitsVec_1,outBitsVec_0}; // @[PositEncode.scala 76:29:@309.4]
  assign _T_80 = esAndFractionShifted[5]; // @[PositEncode.scala 88:44:@349.8]
  assign _GEN_7 = io_in_isInf ? 1'h0 : _T_80; // @[PositEncode.scala 81:28:@326.6]
  assign outBitsVec_5 = io_in_isZero ? 1'h0 : _GEN_7; // @[PositEncode.scala 77:22:@315.4]
  assign _T_81 = esAndFractionShifted[4]; // @[PositEncode.scala 88:44:@351.8]
  assign _GEN_6 = io_in_isInf ? 1'h0 : _T_81; // @[PositEncode.scala 81:28:@326.6]
  assign outBitsVec_4 = io_in_isZero ? 1'h0 : _GEN_6; // @[PositEncode.scala 77:22:@315.4]
  assign _GEN_9 = io_in_isInf ? 1'h1 : io_in_sign; // @[PositEncode.scala 81:28:@326.6]
  assign outBitsVec_7 = io_in_isZero ? 1'h0 : _GEN_9; // @[PositEncode.scala 77:22:@315.4]
  assign _T_79 = esAndFractionShifted[6]; // @[PositEncode.scala 88:44:@347.8]
  assign _GEN_8 = io_in_isInf ? 1'h0 : _T_79; // @[PositEncode.scala 81:28:@326.6]
  assign outBitsVec_6 = io_in_isZero ? 1'h0 : _GEN_8; // @[PositEncode.scala 77:22:@315.4]
  assign _T_57 = {outBitsVec_7,outBitsVec_6,outBitsVec_5,outBitsVec_4}; // @[PositEncode.scala 76:29:@312.4]
  assign io_out_bits = {_T_57,_T_54}; // @[PositEncode.scala 76:15:@314.4]
endmodule
module CountLeadingZerosTree( // @[:@363.2]
  input        io_left, // @[:@366.4]
  input        io_right, // @[:@366.4]
  output [1:0] io_out // @[:@366.4]
);
  wire  rCount; // @[PositDef.scala 320:15:@379.4]
  wire  lCount; // @[PositDef.scala 311:15:@376.4]
  wire  _T_27; // @[PositDef.scala 337:40:@383.4]
  wire  _T_33; // @[PositDef.scala 339:17:@390.6]
  wire [1:0] _T_35; // @[Cat.scala 30:58:@392.8]
  wire [1:0] _GEN_0; // @[PositDef.scala 339:51:@391.6]
  assign rCount = ~ io_right; // @[PositDef.scala 320:15:@379.4]
  assign lCount = ~ io_left; // @[PositDef.scala 311:15:@376.4]
  assign _T_27 = lCount & rCount; // @[PositDef.scala 337:40:@383.4]
  assign _T_33 = lCount == 1'h0; // @[PositDef.scala 339:17:@390.6]
  assign _T_35 = {1'h0,lCount}; // @[Cat.scala 30:58:@392.8]
  assign _GEN_0 = _T_33 ? _T_35 : 2'h1; // @[PositDef.scala 339:51:@391.6]
  assign io_out = _T_27 ? 2'h2 : _GEN_0; // @[PositDef.scala 338:14:@386.6 PositDef.scala 340:14:@393.8 PositDef.scala 342:14:@396.8]
endmodule
module CountLeadingZerosTree_2( // @[:@435.2]
  input  [1:0] io_left, // @[:@438.4]
  input  [1:0] io_right, // @[:@438.4]
  output [2:0] io_out // @[:@438.4]
);
  wire  CountLeadingZerosTree_io_left; // @[PositDef.scala 306:27:@450.4]
  wire  CountLeadingZerosTree_io_right; // @[PositDef.scala 306:27:@450.4]
  wire [1:0] CountLeadingZerosTree_io_out; // @[PositDef.scala 306:27:@450.4]
  wire  CountLeadingZerosTree_1_io_left; // @[PositDef.scala 315:28:@458.4]
  wire  CountLeadingZerosTree_1_io_right; // @[PositDef.scala 315:28:@458.4]
  wire [1:0] CountLeadingZerosTree_1_io_out; // @[PositDef.scala 315:28:@458.4]
  wire [1:0] rCount; // @[PositDef.scala 288:20:@441.4 PositDef.scala 318:12:@465.4]
  wire  rCountExtendVec_1; // @[PositDef.scala 296:33:@444.4]
  wire  rCountExtendVec_0; // @[PositDef.scala 296:33:@446.4]
  wire [1:0] rCountExtend; // @[PositDef.scala 303:35:@448.4]
  wire [1:0] lCount; // @[PositDef.scala 287:20:@440.4 PositDef.scala 309:12:@457.4]
  wire  _T_28; // @[PositDef.scala 324:16:@466.4]
  wire  _T_29; // @[PositDef.scala 324:55:@467.4]
  wire  _T_30; // @[PositDef.scala 324:40:@468.4]
  wire  _T_36; // @[PositDef.scala 326:17:@475.6]
  wire [2:0] _T_38; // @[Cat.scala 30:58:@477.8]
  wire  _T_40; // @[PositDef.scala 329:43:@481.8]
  wire [2:0] _T_41; // @[Cat.scala 30:58:@482.8]
  wire [2:0] _GEN_0; // @[PositDef.scala 326:51:@476.6]
  CountLeadingZerosTree CountLeadingZerosTree ( // @[PositDef.scala 306:27:@450.4]
    .io_left(CountLeadingZerosTree_io_left),
    .io_right(CountLeadingZerosTree_io_right),
    .io_out(CountLeadingZerosTree_io_out)
  );
  CountLeadingZerosTree CountLeadingZerosTree_1 ( // @[PositDef.scala 315:28:@458.4]
    .io_left(CountLeadingZerosTree_1_io_left),
    .io_right(CountLeadingZerosTree_1_io_right),
    .io_out(CountLeadingZerosTree_1_io_out)
  );
  assign rCount = CountLeadingZerosTree_1_io_out; // @[PositDef.scala 288:20:@441.4 PositDef.scala 318:12:@465.4]
  assign rCountExtendVec_1 = rCount[1]; // @[PositDef.scala 296:33:@444.4]
  assign rCountExtendVec_0 = rCount[0]; // @[PositDef.scala 296:33:@446.4]
  assign rCountExtend = {rCountExtendVec_1,rCountExtendVec_0}; // @[PositDef.scala 303:35:@448.4]
  assign lCount = CountLeadingZerosTree_io_out; // @[PositDef.scala 287:20:@440.4 PositDef.scala 309:12:@457.4]
  assign _T_28 = lCount[1]; // @[PositDef.scala 324:16:@466.4]
  assign _T_29 = rCountExtend[1]; // @[PositDef.scala 324:55:@467.4]
  assign _T_30 = _T_28 & _T_29; // @[PositDef.scala 324:40:@468.4]
  assign _T_36 = _T_28 == 1'h0; // @[PositDef.scala 326:17:@475.6]
  assign _T_38 = {1'h0,lCount}; // @[Cat.scala 30:58:@477.8]
  assign _T_40 = rCountExtend[0]; // @[PositDef.scala 329:43:@481.8]
  assign _T_41 = {2'h1,_T_40}; // @[Cat.scala 30:58:@482.8]
  assign _GEN_0 = _T_36 ? _T_38 : _T_41; // @[PositDef.scala 326:51:@476.6]
  assign io_out = _T_30 ? 3'h4 : _GEN_0; // @[PositDef.scala 325:14:@471.6 PositDef.scala 327:14:@478.8 PositDef.scala 329:14:@483.8]
  assign CountLeadingZerosTree_io_left = io_left[1]; // @[PositDef.scala 307:23:@454.4]
  assign CountLeadingZerosTree_io_right = io_left[0]; // @[PositDef.scala 308:24:@456.4]
  assign CountLeadingZerosTree_1_io_left = io_right[1]; // @[PositDef.scala 316:24:@462.4]
  assign CountLeadingZerosTree_1_io_right = io_right[0]; // @[PositDef.scala 317:25:@464.4]
endmodule
module CountLeadingZerosTree_4( // @[:@522.2]
  input  [3:0] io_left, // @[:@525.4]
  input  [1:0] io_right, // @[:@525.4]
  output [2:0] io_out // @[:@525.4]
);
  wire [1:0] CountLeadingZerosTree_io_left; // @[PositDef.scala 306:27:@539.4]
  wire [1:0] CountLeadingZerosTree_io_right; // @[PositDef.scala 306:27:@539.4]
  wire [2:0] CountLeadingZerosTree_io_out; // @[PositDef.scala 306:27:@539.4]
  wire  CountLeadingZerosTree_1_io_left; // @[PositDef.scala 315:28:@547.4]
  wire  CountLeadingZerosTree_1_io_right; // @[PositDef.scala 315:28:@547.4]
  wire [1:0] CountLeadingZerosTree_1_io_out; // @[PositDef.scala 315:28:@547.4]
  wire [1:0] rCount; // @[PositDef.scala 288:20:@528.4 PositDef.scala 318:12:@554.4]
  wire  rCountExtendVec_1; // @[PositDef.scala 296:33:@531.4]
  wire  rCountExtendVec_0; // @[PositDef.scala 296:33:@533.4]
  wire [2:0] rCountExtend; // @[PositDef.scala 303:35:@537.4]
  wire [2:0] lCount; // @[PositDef.scala 287:20:@527.4 PositDef.scala 309:12:@546.4]
  wire  _T_31; // @[PositDef.scala 324:16:@555.4]
  wire  _T_32; // @[PositDef.scala 324:55:@556.4]
  wire  _T_33; // @[PositDef.scala 324:40:@557.4]
  wire  _T_39; // @[PositDef.scala 326:17:@564.6]
  wire [3:0] _T_41; // @[Cat.scala 30:58:@566.8]
  wire [1:0] _T_43; // @[PositDef.scala 329:43:@570.8]
  wire [3:0] _T_44; // @[Cat.scala 30:58:@571.8]
  wire [3:0] _GEN_0; // @[PositDef.scala 326:51:@565.6]
  wire [3:0] _GEN_1; // @[PositDef.scala 324:80:@558.4]
  CountLeadingZerosTree_2 CountLeadingZerosTree ( // @[PositDef.scala 306:27:@539.4]
    .io_left(CountLeadingZerosTree_io_left),
    .io_right(CountLeadingZerosTree_io_right),
    .io_out(CountLeadingZerosTree_io_out)
  );
  CountLeadingZerosTree CountLeadingZerosTree_1 ( // @[PositDef.scala 315:28:@547.4]
    .io_left(CountLeadingZerosTree_1_io_left),
    .io_right(CountLeadingZerosTree_1_io_right),
    .io_out(CountLeadingZerosTree_1_io_out)
  );
  assign rCount = CountLeadingZerosTree_1_io_out; // @[PositDef.scala 288:20:@528.4 PositDef.scala 318:12:@554.4]
  assign rCountExtendVec_1 = rCount[1]; // @[PositDef.scala 296:33:@531.4]
  assign rCountExtendVec_0 = rCount[0]; // @[PositDef.scala 296:33:@533.4]
  assign rCountExtend = {1'h0,rCountExtendVec_1,rCountExtendVec_0}; // @[PositDef.scala 303:35:@537.4]
  assign lCount = CountLeadingZerosTree_io_out; // @[PositDef.scala 287:20:@527.4 PositDef.scala 309:12:@546.4]
  assign _T_31 = lCount[2]; // @[PositDef.scala 324:16:@555.4]
  assign _T_32 = rCountExtend[2]; // @[PositDef.scala 324:55:@556.4]
  assign _T_33 = _T_31 & _T_32; // @[PositDef.scala 324:40:@557.4]
  assign _T_39 = _T_31 == 1'h0; // @[PositDef.scala 326:17:@564.6]
  assign _T_41 = {1'h0,lCount}; // @[Cat.scala 30:58:@566.8]
  assign _T_43 = rCountExtend[1:0]; // @[PositDef.scala 329:43:@570.8]
  assign _T_44 = {2'h1,_T_43}; // @[Cat.scala 30:58:@571.8]
  assign _GEN_0 = _T_39 ? _T_41 : _T_44; // @[PositDef.scala 326:51:@565.6]
  assign _GEN_1 = _T_33 ? 4'h4 : _GEN_0; // @[PositDef.scala 324:80:@558.4]
  assign io_out = _GEN_1[2:0]; // @[PositDef.scala 325:14:@560.6 PositDef.scala 327:14:@567.8 PositDef.scala 329:14:@572.8]
  assign CountLeadingZerosTree_io_left = io_left[3:2]; // @[PositDef.scala 307:23:@543.4]
  assign CountLeadingZerosTree_io_right = io_left[1:0]; // @[PositDef.scala 308:24:@545.4]
  assign CountLeadingZerosTree_1_io_left = io_right[1]; // @[PositDef.scala 316:24:@551.4]
  assign CountLeadingZerosTree_1_io_right = io_right[0]; // @[PositDef.scala 317:25:@553.4]
endmodule
module CountLeadingZeros( // @[:@575.2]
  input  [5:0] io_in, // @[:@578.4]
  output [2:0] io_out // @[:@578.4]
);
  wire [3:0] tree_io_left; // @[PositDef.scala 375:20:@600.4]
  wire [1:0] tree_io_right; // @[PositDef.scala 375:20:@600.4]
  wire [2:0] tree_io_out; // @[PositDef.scala 375:20:@600.4]
  wire  inPadVec_5; // @[PositDef.scala 372:25:@582.4]
  wire  inPadVec_4; // @[PositDef.scala 372:25:@584.4]
  wire  inPadVec_3; // @[PositDef.scala 372:25:@586.4]
  wire  inPadVec_2; // @[PositDef.scala 372:25:@588.4]
  wire  inPadVec_1; // @[PositDef.scala 372:25:@590.4]
  wire  inPadVec_0; // @[PositDef.scala 372:25:@592.4]
  wire [5:0] inPad; // @[PositDef.scala 374:21:@598.4]
  CountLeadingZerosTree_4 tree ( // @[PositDef.scala 375:20:@600.4]
    .io_left(tree_io_left),
    .io_right(tree_io_right),
    .io_out(tree_io_out)
  );
  assign inPadVec_5 = io_in[5]; // @[PositDef.scala 372:25:@582.4]
  assign inPadVec_4 = io_in[4]; // @[PositDef.scala 372:25:@584.4]
  assign inPadVec_3 = io_in[3]; // @[PositDef.scala 372:25:@586.4]
  assign inPadVec_2 = io_in[2]; // @[PositDef.scala 372:25:@588.4]
  assign inPadVec_1 = io_in[1]; // @[PositDef.scala 372:25:@590.4]
  assign inPadVec_0 = io_in[0]; // @[PositDef.scala 372:25:@592.4]
  assign inPad = {inPadVec_5,inPadVec_4,inPadVec_3,inPadVec_2,inPadVec_1,inPadVec_0}; // @[PositDef.scala 374:21:@598.4]
  assign io_out = tree_io_out; // @[PositDef.scala 378:10:@607.4]
  assign tree_io_left = inPad[5:2]; // @[PositDef.scala 376:16:@604.4]
  assign tree_io_right = io_in[1:0]; // @[PositDef.scala 377:17:@606.4]
endmodule
module PositDecode( // @[:@609.2]
  input  [7:0] io_in_bits, // @[:@612.4]
  output       io_out_isZero, // @[:@612.4]
  output       io_out_isInf, // @[:@612.4]
  output       io_out_sign, // @[:@612.4]
  output [4:0] io_out_exponent, // @[:@612.4]
  output [3:0] io_out_fraction // @[:@612.4]
);
  wire [5:0] countingLeadingZeros_io_in; // @[PositDecode.scala 64:36:@653.4]
  wire [2:0] countingLeadingZeros_io_out; // @[PositDecode.scala 64:36:@653.4]
  wire [6:0] remainderBits; // @[PositDecode.scala 72:30:@661.4]
  wire  _T_28; // @[PositDecode.scala 54:44:@623.4]
  wire  _T_29; // @[PositDecode.scala 54:63:@624.4]
  wire  remainderXorVec_5; // @[PositDecode.scala 54:48:@625.4]
  wire  _T_32; // @[PositDecode.scala 54:63:@628.4]
  wire  remainderXorVec_4; // @[PositDecode.scala 54:48:@629.4]
  wire  _T_35; // @[PositDecode.scala 54:63:@632.4]
  wire  remainderXorVec_3; // @[PositDecode.scala 54:48:@633.4]
  wire  _T_38; // @[PositDecode.scala 54:63:@636.4]
  wire  remainderXorVec_2; // @[PositDecode.scala 54:48:@637.4]
  wire  _T_41; // @[PositDecode.scala 54:63:@640.4]
  wire  remainderXorVec_1; // @[PositDecode.scala 54:48:@641.4]
  wire  _T_44; // @[PositDecode.scala 54:63:@644.4]
  wire  remainderXorVec_0; // @[PositDecode.scala 54:48:@645.4]
  wire [2:0] _T_47; // @[PositDecode.scala 59:35:@648.4]
  wire [2:0] _T_49; // @[PositDecode.scala 59:35:@650.4]
  wire [4:0] _T_51; // @[PositDecode.scala 69:37:@658.4]
  wire [2:0] cl0; // @[PositDecode.scala 31:17:@617.4 PositDecode.scala 66:7:@657.4]
  wire [11:0] _GEN_2; // @[PositDecode.scala 69:72:@659.4]
  wire [11:0] _T_52; // @[PositDecode.scala 69:72:@659.4]
  wire  _T_56; // @[PositDecode.scala 76:31:@665.4]
  wire  isSpecial; // @[PositDecode.scala 76:16:@666.4]
  wire [2:0] _T_67; // @[PositDecode.scala 89:87:@681.8]
  wire [3:0] _T_68; // @[PositDecode.scala 89:85:@682.8]
  wire [2:0] _T_69; // @[PositDecode.scala 89:85:@683.8]
  wire [3:0] cl0extended; // @[PositDecode.scala 79:25:@668.4 PositDecode.scala 80:15:@669.4]
  wire [3:0] _GEN_0; // @[PositDecode.scala 85:47:@677.6]
  wire [3:0] unsignedRegime; // @[PositDecode.scala 82:28:@671.4]
  wire  _T_70; // @[PositDecode.scala 122:29:@688.4]
  wire  _T_75; // @[PositDecode.scala 123:20:@693.4]
  wire  _T_79; // @[PositDecode.scala 124:18:@697.4]
  wire [4:0] esAndFractionBits; // @[PositDecode.scala 48:31:@622.4 PositDecode.scala 69:21:@660.4]
  wire  _T_84; // @[PositDecode.scala 132:32:@702.4]
  CountLeadingZeros countingLeadingZeros ( // @[PositDecode.scala 64:36:@653.4]
    .io_in(countingLeadingZeros_io_in),
    .io_out(countingLeadingZeros_io_out)
  );
  assign remainderBits = io_in_bits[6:0]; // @[PositDecode.scala 72:30:@661.4]
  assign _T_28 = remainderBits[6]; // @[PositDecode.scala 54:44:@623.4]
  assign _T_29 = remainderBits[5]; // @[PositDecode.scala 54:63:@624.4]
  assign remainderXorVec_5 = _T_28 ^ _T_29; // @[PositDecode.scala 54:48:@625.4]
  assign _T_32 = remainderBits[4]; // @[PositDecode.scala 54:63:@628.4]
  assign remainderXorVec_4 = _T_29 ^ _T_32; // @[PositDecode.scala 54:48:@629.4]
  assign _T_35 = remainderBits[3]; // @[PositDecode.scala 54:63:@632.4]
  assign remainderXorVec_3 = _T_32 ^ _T_35; // @[PositDecode.scala 54:48:@633.4]
  assign _T_38 = remainderBits[2]; // @[PositDecode.scala 54:63:@636.4]
  assign remainderXorVec_2 = _T_35 ^ _T_38; // @[PositDecode.scala 54:48:@637.4]
  assign _T_41 = remainderBits[1]; // @[PositDecode.scala 54:63:@640.4]
  assign remainderXorVec_1 = _T_38 ^ _T_41; // @[PositDecode.scala 54:48:@641.4]
  assign _T_44 = remainderBits[0]; // @[PositDecode.scala 54:63:@644.4]
  assign remainderXorVec_0 = _T_41 ^ _T_44; // @[PositDecode.scala 54:48:@645.4]
  assign _T_47 = {remainderXorVec_2,remainderXorVec_1,remainderXorVec_0}; // @[PositDecode.scala 59:35:@648.4]
  assign _T_49 = {remainderXorVec_5,remainderXorVec_4,remainderXorVec_3}; // @[PositDecode.scala 59:35:@650.4]
  assign _T_51 = remainderBits[4:0]; // @[PositDecode.scala 69:37:@658.4]
  assign cl0 = countingLeadingZeros_io_out; // @[PositDecode.scala 31:17:@617.4 PositDecode.scala 66:7:@657.4]
  assign _GEN_2 = {{7'd0}, _T_51}; // @[PositDecode.scala 69:72:@659.4]
  assign _T_52 = _GEN_2 << cl0; // @[PositDecode.scala 69:72:@659.4]
  assign _T_56 = remainderBits != 7'h0; // @[PositDecode.scala 76:31:@665.4]
  assign isSpecial = _T_56 == 1'h0; // @[PositDecode.scala 76:16:@666.4]
  assign _T_67 = ~ cl0; // @[PositDecode.scala 89:87:@681.8]
  assign _T_68 = 3'h6 + _T_67; // @[PositDecode.scala 89:85:@682.8]
  assign _T_69 = 3'h6 + _T_67; // @[PositDecode.scala 89:85:@683.8]
  assign cl0extended = {{1'd0}, cl0}; // @[PositDecode.scala 79:25:@668.4 PositDecode.scala 80:15:@669.4]
  assign _GEN_0 = _T_28 ? cl0extended : {{1'd0}, _T_69}; // @[PositDecode.scala 85:47:@677.6]
  assign unsignedRegime = isSpecial ? 4'h0 : _GEN_0; // @[PositDecode.scala 82:28:@671.4]
  assign _T_70 = io_in_bits[7]; // @[PositDecode.scala 122:29:@688.4]
  assign _T_75 = _T_70 == 1'h0; // @[PositDecode.scala 123:20:@693.4]
  assign _T_79 = isSpecial == 1'h0; // @[PositDecode.scala 124:18:@697.4]
  assign esAndFractionBits = _T_52[4:0]; // @[PositDecode.scala 48:31:@622.4 PositDecode.scala 69:21:@660.4]
  assign _T_84 = esAndFractionBits[4]; // @[PositDecode.scala 132:32:@702.4]
  assign io_out_isZero = _T_75 & isSpecial; // @[PositDecode.scala 123:17:@696.4]
  assign io_out_isInf = _T_70 & isSpecial; // @[PositDecode.scala 122:16:@691.4]
  assign io_out_sign = _T_79 & _T_70; // @[PositDecode.scala 124:15:@700.4]
  assign io_out_exponent = {unsignedRegime,_T_84}; // @[PositDecode.scala 135:21:@707.4]
  assign io_out_fraction = esAndFractionBits[3:0]; // @[PositDecode.scala 134:21:@705.4]
  assign countingLeadingZeros_io_in = {_T_49,_T_47}; // @[PositDecode.scala 65:30:@656.4]
endmodule
module PositMultiplyPackedToPacked( // @[:@2785.2]
  input  [7:0] io_a_bits, // @[:@2788.4]
  input  [7:0] io_b_bits, // @[:@2788.4]
  output [7:0] io_out_bits // @[:@2788.4]
);
  wire [7:0] decodeA_io_in_bits; // @[PositMultiplyPackedToPacked.scala 24:23:@2793.4]
  wire  decodeA_io_out_isZero; // @[PositMultiplyPackedToPacked.scala 24:23:@2793.4]
  wire  decodeA_io_out_isInf; // @[PositMultiplyPackedToPacked.scala 24:23:@2793.4]
  wire  decodeA_io_out_sign; // @[PositMultiplyPackedToPacked.scala 24:23:@2793.4]
  wire [4:0] decodeA_io_out_exponent; // @[PositMultiplyPackedToPacked.scala 24:23:@2793.4]
  wire [3:0] decodeA_io_out_fraction; // @[PositMultiplyPackedToPacked.scala 24:23:@2793.4]
  wire [7:0] decodeB_io_in_bits; // @[PositMultiplyPackedToPacked.scala 28:23:@2802.4]
  wire  decodeB_io_out_isZero; // @[PositMultiplyPackedToPacked.scala 28:23:@2802.4]
  wire  decodeB_io_out_isInf; // @[PositMultiplyPackedToPacked.scala 28:23:@2802.4]
  wire  decodeB_io_out_sign; // @[PositMultiplyPackedToPacked.scala 28:23:@2802.4]
  wire [4:0] decodeB_io_out_exponent; // @[PositMultiplyPackedToPacked.scala 28:23:@2802.4]
  wire [3:0] decodeB_io_out_fraction; // @[PositMultiplyPackedToPacked.scala 28:23:@2802.4]
  wire  multiply_io_a_isZero; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_a_isInf; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_a_sign; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire [4:0] multiply_io_a_exponent; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire [3:0] multiply_io_a_fraction; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_b_isZero; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_b_isInf; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_b_sign; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire [4:0] multiply_io_b_exponent; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire [3:0] multiply_io_b_fraction; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_out_isZero; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_out_isInf; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_out_sign; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire [4:0] multiply_io_out_exponent; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire [3:0] multiply_io_out_fraction; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire [1:0] multiply_io_trailingBits; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  multiply_io_stickyBit; // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
  wire  encode_io_in_isZero; // @[PositMultiplyPackedToPacked.scala 45:22:@2831.4]
  wire  encode_io_in_isInf; // @[PositMultiplyPackedToPacked.scala 45:22:@2831.4]
  wire  encode_io_in_sign; // @[PositMultiplyPackedToPacked.scala 45:22:@2831.4]
  wire [4:0] encode_io_in_exponent; // @[PositMultiplyPackedToPacked.scala 45:22:@2831.4]
  wire [3:0] encode_io_in_fraction; // @[PositMultiplyPackedToPacked.scala 45:22:@2831.4]
  wire [7:0] encode_io_out_bits; // @[PositMultiplyPackedToPacked.scala 45:22:@2831.4]
  PositDecode decodeA ( // @[PositMultiplyPackedToPacked.scala 24:23:@2793.4]
    .io_in_bits(decodeA_io_in_bits),
    .io_out_isZero(decodeA_io_out_isZero),
    .io_out_isInf(decodeA_io_out_isInf),
    .io_out_sign(decodeA_io_out_sign),
    .io_out_exponent(decodeA_io_out_exponent),
    .io_out_fraction(decodeA_io_out_fraction)
  );
  PositDecode decodeB ( // @[PositMultiplyPackedToPacked.scala 28:23:@2802.4]
    .io_in_bits(decodeB_io_in_bits),
    .io_out_isZero(decodeB_io_out_isZero),
    .io_out_isInf(decodeB_io_out_isInf),
    .io_out_sign(decodeB_io_out_sign),
    .io_out_exponent(decodeB_io_out_exponent),
    .io_out_fraction(decodeB_io_out_fraction)
  );
  PositMultiply multiply ( // @[PositMultiplyPackedToPacked.scala 32:24:@2811.4]
    .io_a_isZero(multiply_io_a_isZero),
    .io_a_isInf(multiply_io_a_isInf),
    .io_a_sign(multiply_io_a_sign),
    .io_a_exponent(multiply_io_a_exponent),
    .io_a_fraction(multiply_io_a_fraction),
    .io_b_isZero(multiply_io_b_isZero),
    .io_b_isInf(multiply_io_b_isInf),
    .io_b_sign(multiply_io_b_sign),
    .io_b_exponent(multiply_io_b_exponent),
    .io_b_fraction(multiply_io_b_fraction),
    .io_out_isZero(multiply_io_out_isZero),
    .io_out_isInf(multiply_io_out_isInf),
    .io_out_sign(multiply_io_out_sign),
    .io_out_exponent(multiply_io_out_exponent),
    .io_out_fraction(multiply_io_out_fraction),
    .io_trailingBits(multiply_io_trailingBits),
    .io_stickyBit(multiply_io_stickyBit)
  );
  PositEncode encode ( // @[PositMultiplyPackedToPacked.scala 45:22:@2831.4]
    .io_in_isZero(encode_io_in_isZero),
    .io_in_isInf(encode_io_in_isInf),
    .io_in_sign(encode_io_in_sign),
    .io_in_exponent(encode_io_in_exponent),
    .io_in_fraction(encode_io_in_fraction),
    .io_out_bits(encode_io_out_bits)
  );
  assign io_out_bits = encode_io_out_bits; // @[PositMultiplyPackedToPacked.scala 47:10:@2839.4]
  assign decodeA_io_in_bits = io_a_bits; // @[PositMultiplyPackedToPacked.scala 25:17:@2796.4]
  assign decodeB_io_in_bits = io_b_bits; // @[PositMultiplyPackedToPacked.scala 29:17:@2805.4]
  assign multiply_io_a_isZero = decodeA_io_out_isZero; // @[PositMultiplyPackedToPacked.scala 33:17:@2818.4]
  assign multiply_io_a_isInf = decodeA_io_out_isInf; // @[PositMultiplyPackedToPacked.scala 33:17:@2817.4]
  assign multiply_io_a_sign = decodeA_io_out_sign; // @[PositMultiplyPackedToPacked.scala 33:17:@2816.4]
  assign multiply_io_a_exponent = decodeA_io_out_exponent; // @[PositMultiplyPackedToPacked.scala 33:17:@2815.4]
  assign multiply_io_a_fraction = decodeA_io_out_fraction; // @[PositMultiplyPackedToPacked.scala 33:17:@2814.4]
  assign multiply_io_b_isZero = decodeB_io_out_isZero; // @[PositMultiplyPackedToPacked.scala 34:17:@2823.4]
  assign multiply_io_b_isInf = decodeB_io_out_isInf; // @[PositMultiplyPackedToPacked.scala 34:17:@2822.4]
  assign multiply_io_b_sign = decodeB_io_out_sign; // @[PositMultiplyPackedToPacked.scala 34:17:@2821.4]
  assign multiply_io_b_exponent = decodeB_io_out_exponent; // @[PositMultiplyPackedToPacked.scala 34:17:@2820.4]
  assign multiply_io_b_fraction = decodeB_io_out_fraction; // @[PositMultiplyPackedToPacked.scala 34:17:@2819.4]
  assign encode_io_in_isZero = multiply_io_out_isZero; // @[PositMultiplyPackedToPacked.scala 46:16:@2838.4]
  assign encode_io_in_isInf = multiply_io_out_isInf; // @[PositMultiplyPackedToPacked.scala 46:16:@2837.4]
  assign encode_io_in_sign = multiply_io_out_sign; // @[PositMultiplyPackedToPacked.scala 46:16:@2836.4]
  assign encode_io_in_exponent = multiply_io_out_exponent; // @[PositMultiplyPackedToPacked.scala 46:16:@2835.4]
  assign encode_io_in_fraction = multiply_io_out_fraction; // @[PositMultiplyPackedToPacked.scala 46:16:@2834.4]
endmodule
module Test( // @[:@2841.2]
  input   clock, // @[:@2842.4]
  input   reset // @[:@2843.4]
);
  wire  multiply_io_a_isZero; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_a_isInf; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_a_sign; // @[Test.scala 35:24:@2849.4]
  wire [4:0] multiply_io_a_exponent; // @[Test.scala 35:24:@2849.4]
  wire [3:0] multiply_io_a_fraction; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_b_isZero; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_b_isInf; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_b_sign; // @[Test.scala 35:24:@2849.4]
  wire [4:0] multiply_io_b_exponent; // @[Test.scala 35:24:@2849.4]
  wire [3:0] multiply_io_b_fraction; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_out_isZero; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_out_isInf; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_out_sign; // @[Test.scala 35:24:@2849.4]
  wire [4:0] multiply_io_out_exponent; // @[Test.scala 35:24:@2849.4]
  wire [3:0] multiply_io_out_fraction; // @[Test.scala 35:24:@2849.4]
  wire [1:0] multiply_io_trailingBits; // @[Test.scala 35:24:@2849.4]
  wire  multiply_io_stickyBit; // @[Test.scala 35:24:@2849.4]
  wire  encodeTestA_io_in_isZero; // @[Test.scala 39:27:@2862.4]
  wire  encodeTestA_io_in_isInf; // @[Test.scala 39:27:@2862.4]
  wire  encodeTestA_io_in_sign; // @[Test.scala 39:27:@2862.4]
  wire [4:0] encodeTestA_io_in_exponent; // @[Test.scala 39:27:@2862.4]
  wire [3:0] encodeTestA_io_in_fraction; // @[Test.scala 39:27:@2862.4]
  wire [7:0] encodeTestA_io_out_bits; // @[Test.scala 39:27:@2862.4]
  wire [7:0] decodeTestA_io_in_bits; // @[Test.scala 44:27:@2872.4]
  wire  decodeTestA_io_out_isZero; // @[Test.scala 44:27:@2872.4]
  wire  decodeTestA_io_out_isInf; // @[Test.scala 44:27:@2872.4]
  wire  decodeTestA_io_out_sign; // @[Test.scala 44:27:@2872.4]
  wire [4:0] decodeTestA_io_out_exponent; // @[Test.scala 44:27:@2872.4]
  wire [3:0] decodeTestA_io_out_fraction; // @[Test.scala 44:27:@2872.4]
  wire  encodeTestB_io_in_isZero; // @[Test.scala 49:27:@2882.4]
  wire  encodeTestB_io_in_isInf; // @[Test.scala 49:27:@2882.4]
  wire  encodeTestB_io_in_sign; // @[Test.scala 49:27:@2882.4]
  wire [4:0] encodeTestB_io_in_exponent; // @[Test.scala 49:27:@2882.4]
  wire [3:0] encodeTestB_io_in_fraction; // @[Test.scala 49:27:@2882.4]
  wire [7:0] encodeTestB_io_out_bits; // @[Test.scala 49:27:@2882.4]
  wire [7:0] decodeTestB_io_in_bits; // @[Test.scala 54:27:@2892.4]
  wire  decodeTestB_io_out_isZero; // @[Test.scala 54:27:@2892.4]
  wire  decodeTestB_io_out_isInf; // @[Test.scala 54:27:@2892.4]
  wire  decodeTestB_io_out_sign; // @[Test.scala 54:27:@2892.4]
  wire [4:0] decodeTestB_io_out_exponent; // @[Test.scala 54:27:@2892.4]
  wire [3:0] decodeTestB_io_out_fraction; // @[Test.scala 54:27:@2892.4]
  wire [7:0] decodeTestC_io_in_bits; // @[Test.scala 62:27:@2903.4]
  wire  decodeTestC_io_out_isZero; // @[Test.scala 62:27:@2903.4]
  wire  decodeTestC_io_out_isInf; // @[Test.scala 62:27:@2903.4]
  wire  decodeTestC_io_out_sign; // @[Test.scala 62:27:@2903.4]
  wire [4:0] decodeTestC_io_out_exponent; // @[Test.scala 62:27:@2903.4]
  wire [3:0] decodeTestC_io_out_fraction; // @[Test.scala 62:27:@2903.4]
  wire [5:0] countingZeros_io_in; // @[Test.scala 78:29:@2923.4]
  wire [2:0] countingZeros_io_out; // @[Test.scala 78:29:@2923.4]
  wire [7:0] endToEndTest_io_a_bits; // @[Test.scala 88:28:@2941.4]
  wire [7:0] endToEndTest_io_b_bits; // @[Test.scala 88:28:@2941.4]
  wire [7:0] endToEndTest_io_out_bits; // @[Test.scala 88:28:@2941.4]
  reg [7:0] value; // @[Counter.scala 26:33:@2931.4]
  reg [31:0] _RAND_0;
  wire [8:0] _T_23; // @[Counter.scala 35:22:@2934.6]
  wire [7:0] _T_24; // @[Counter.scala 35:22:@2935.6]
  wire  _T_29; // @[Test.scala 96:15:@2949.4]
  wire  _T_32; // @[Test.scala 98:11:@2952.6]
  wire [7:0] aPacked_bits; // @[Test.scala 41:21:@2870.4 Test.scala 42:11:@2871.4]
  wire  aUnpacked_isZero; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2881.4]
  wire  aUnpacked_isInf; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2880.4]
  wire  aUnpacked_sign; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2879.4]
  wire [4:0] aUnpacked_exponent; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2878.4]
  wire [3:0] aUnpacked_fraction; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2877.4]
  wire [7:0] bPacked_bits; // @[Test.scala 51:21:@2890.4 Test.scala 52:11:@2891.4]
  wire  bUnpacked_isZero; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2901.4]
  wire  bUnpacked_isInf; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2900.4]
  wire  bUnpacked_sign; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2899.4]
  wire [4:0] bUnpacked_exponent; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2898.4]
  wire [3:0] bUnpacked_fraction; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2897.4]
  wire [7:0] cPacked_bits; // @[Test.scala 59:21:@2902.4 Test.scala 91:11:@2946.4]
  wire  cUnpacked_isZero; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2912.4]
  wire  cUnpacked_isInf; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2911.4]
  wire  cUnpacked_sign; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2910.4]
  wire [4:0] cUnpacked_exponent; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2909.4]
  wire [3:0] cUnpacked_fraction; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2908.4]
  wire [1:0] trailingBits; // @[Test.scala 67:26:@2913.4 Test.scala 70:16:@2915.4]
  wire  stickyBit; // @[Test.scala 68:23:@2914.4 Test.scala 71:13:@2916.4]
  wire [7:0] countOutput; // @[Test.scala 82:25:@2929.4 Test.scala 83:15:@2930.4]
  PositMultiply multiply ( // @[Test.scala 35:24:@2849.4]
    .io_a_isZero(multiply_io_a_isZero),
    .io_a_isInf(multiply_io_a_isInf),
    .io_a_sign(multiply_io_a_sign),
    .io_a_exponent(multiply_io_a_exponent),
    .io_a_fraction(multiply_io_a_fraction),
    .io_b_isZero(multiply_io_b_isZero),
    .io_b_isInf(multiply_io_b_isInf),
    .io_b_sign(multiply_io_b_sign),
    .io_b_exponent(multiply_io_b_exponent),
    .io_b_fraction(multiply_io_b_fraction),
    .io_out_isZero(multiply_io_out_isZero),
    .io_out_isInf(multiply_io_out_isInf),
    .io_out_sign(multiply_io_out_sign),
    .io_out_exponent(multiply_io_out_exponent),
    .io_out_fraction(multiply_io_out_fraction),
    .io_trailingBits(multiply_io_trailingBits),
    .io_stickyBit(multiply_io_stickyBit)
  );
  PositEncode encodeTestA ( // @[Test.scala 39:27:@2862.4]
    .io_in_isZero(encodeTestA_io_in_isZero),
    .io_in_isInf(encodeTestA_io_in_isInf),
    .io_in_sign(encodeTestA_io_in_sign),
    .io_in_exponent(encodeTestA_io_in_exponent),
    .io_in_fraction(encodeTestA_io_in_fraction),
    .io_out_bits(encodeTestA_io_out_bits)
  );
  PositDecode decodeTestA ( // @[Test.scala 44:27:@2872.4]
    .io_in_bits(decodeTestA_io_in_bits),
    .io_out_isZero(decodeTestA_io_out_isZero),
    .io_out_isInf(decodeTestA_io_out_isInf),
    .io_out_sign(decodeTestA_io_out_sign),
    .io_out_exponent(decodeTestA_io_out_exponent),
    .io_out_fraction(decodeTestA_io_out_fraction)
  );
  PositEncode encodeTestB ( // @[Test.scala 49:27:@2882.4]
    .io_in_isZero(encodeTestB_io_in_isZero),
    .io_in_isInf(encodeTestB_io_in_isInf),
    .io_in_sign(encodeTestB_io_in_sign),
    .io_in_exponent(encodeTestB_io_in_exponent),
    .io_in_fraction(encodeTestB_io_in_fraction),
    .io_out_bits(encodeTestB_io_out_bits)
  );
  PositDecode decodeTestB ( // @[Test.scala 54:27:@2892.4]
    .io_in_bits(decodeTestB_io_in_bits),
    .io_out_isZero(decodeTestB_io_out_isZero),
    .io_out_isInf(decodeTestB_io_out_isInf),
    .io_out_sign(decodeTestB_io_out_sign),
    .io_out_exponent(decodeTestB_io_out_exponent),
    .io_out_fraction(decodeTestB_io_out_fraction)
  );
  PositDecode decodeTestC ( // @[Test.scala 62:27:@2903.4]
    .io_in_bits(decodeTestC_io_in_bits),
    .io_out_isZero(decodeTestC_io_out_isZero),
    .io_out_isInf(decodeTestC_io_out_isInf),
    .io_out_sign(decodeTestC_io_out_sign),
    .io_out_exponent(decodeTestC_io_out_exponent),
    .io_out_fraction(decodeTestC_io_out_fraction)
  );
  CountLeadingZeros countingZeros ( // @[Test.scala 78:29:@2923.4]
    .io_in(countingZeros_io_in),
    .io_out(countingZeros_io_out)
  );
  PositMultiplyPackedToPacked endToEndTest ( // @[Test.scala 88:28:@2941.4]
    .io_a_bits(endToEndTest_io_a_bits),
    .io_b_bits(endToEndTest_io_b_bits),
    .io_out_bits(endToEndTest_io_out_bits)
  );
  assign _T_23 = value + 8'h1; // @[Counter.scala 35:22:@2934.6]
  assign _T_24 = value + 8'h1; // @[Counter.scala 35:22:@2935.6]
  assign _T_29 = value == 8'h38; // @[Test.scala 96:15:@2949.4]
  assign _T_32 = reset == 1'h0; // @[Test.scala 98:11:@2952.6]
  assign aPacked_bits = encodeTestA_io_out_bits; // @[Test.scala 41:21:@2870.4 Test.scala 42:11:@2871.4]
  assign aUnpacked_isZero = decodeTestA_io_out_isZero; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2881.4]
  assign aUnpacked_isInf = decodeTestA_io_out_isInf; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2880.4]
  assign aUnpacked_sign = decodeTestA_io_out_sign; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2879.4]
  assign aUnpacked_exponent = decodeTestA_io_out_exponent; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2878.4]
  assign aUnpacked_fraction = decodeTestA_io_out_fraction; // @[Test.scala 46:23:@2876.4 Test.scala 47:13:@2877.4]
  assign bPacked_bits = encodeTestB_io_out_bits; // @[Test.scala 51:21:@2890.4 Test.scala 52:11:@2891.4]
  assign bUnpacked_isZero = decodeTestB_io_out_isZero; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2901.4]
  assign bUnpacked_isInf = decodeTestB_io_out_isInf; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2900.4]
  assign bUnpacked_sign = decodeTestB_io_out_sign; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2899.4]
  assign bUnpacked_exponent = decodeTestB_io_out_exponent; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2898.4]
  assign bUnpacked_fraction = decodeTestB_io_out_fraction; // @[Test.scala 56:23:@2896.4 Test.scala 57:13:@2897.4]
  assign cPacked_bits = endToEndTest_io_out_bits; // @[Test.scala 59:21:@2902.4 Test.scala 91:11:@2946.4]
  assign cUnpacked_isZero = decodeTestC_io_out_isZero; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2912.4]
  assign cUnpacked_isInf = decodeTestC_io_out_isInf; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2911.4]
  assign cUnpacked_sign = decodeTestC_io_out_sign; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2910.4]
  assign cUnpacked_exponent = decodeTestC_io_out_exponent; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2909.4]
  assign cUnpacked_fraction = decodeTestC_io_out_fraction; // @[Test.scala 64:23:@2907.4 Test.scala 65:13:@2908.4]
  assign trailingBits = multiply_io_trailingBits; // @[Test.scala 67:26:@2913.4 Test.scala 70:16:@2915.4]
  assign stickyBit = multiply_io_stickyBit; // @[Test.scala 68:23:@2914.4 Test.scala 71:13:@2916.4]
  assign countOutput = {{5'd0}, countingZeros_io_out}; // @[Test.scala 82:25:@2929.4 Test.scala 83:15:@2930.4]
  assign multiply_io_a_isZero = 1'h0; // @[Test.scala 36:17:@2856.4]
  assign multiply_io_a_isInf = 1'h0; // @[Test.scala 36:17:@2855.4]
  assign multiply_io_a_sign = 1'h0; // @[Test.scala 36:17:@2854.4]
  assign multiply_io_a_exponent = 5'he; // @[Test.scala 36:17:@2853.4]
  assign multiply_io_a_fraction = 4'h4; // @[Test.scala 36:17:@2852.4]
  assign multiply_io_b_isZero = 1'h0; // @[Test.scala 37:17:@2861.4]
  assign multiply_io_b_isInf = 1'h0; // @[Test.scala 37:17:@2860.4]
  assign multiply_io_b_sign = 1'h0; // @[Test.scala 37:17:@2859.4]
  assign multiply_io_b_exponent = 5'hf; // @[Test.scala 37:17:@2858.4]
  assign multiply_io_b_fraction = 4'h0; // @[Test.scala 37:17:@2857.4]
  assign encodeTestA_io_in_isZero = 1'h0; // @[Test.scala 40:21:@2869.4]
  assign encodeTestA_io_in_isInf = 1'h0; // @[Test.scala 40:21:@2868.4]
  assign encodeTestA_io_in_sign = 1'h0; // @[Test.scala 40:21:@2867.4]
  assign encodeTestA_io_in_exponent = 5'he; // @[Test.scala 40:21:@2866.4]
  assign encodeTestA_io_in_fraction = 4'h4; // @[Test.scala 40:21:@2865.4]
  assign decodeTestA_io_in_bits = encodeTestA_io_out_bits; // @[Test.scala 45:21:@2875.4]
  assign encodeTestB_io_in_isZero = 1'h0; // @[Test.scala 50:21:@2889.4]
  assign encodeTestB_io_in_isInf = 1'h0; // @[Test.scala 50:21:@2888.4]
  assign encodeTestB_io_in_sign = 1'h0; // @[Test.scala 50:21:@2887.4]
  assign encodeTestB_io_in_exponent = 5'hf; // @[Test.scala 50:21:@2886.4]
  assign encodeTestB_io_in_fraction = 4'h0; // @[Test.scala 50:21:@2885.4]
  assign decodeTestB_io_in_bits = encodeTestB_io_out_bits; // @[Test.scala 55:21:@2895.4]
  assign decodeTestC_io_in_bits = endToEndTest_io_out_bits; // @[Test.scala 63:21:@2906.4]
  assign countingZeros_io_in = 6'h4; // @[Test.scala 81:23:@2928.4]
  assign endToEndTest_io_a_bits = encodeTestA_io_out_bits; // @[Test.scala 89:21:@2944.4]
  assign endToEndTest_io_b_bits = encodeTestB_io_out_bits; // @[Test.scala 90:21:@2945.4]
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
      value <= _T_24;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"a.exponent is %b \n",5'he); // @[Test.scala 98:11:@2954.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"a.fraction is %b \n",4'h4); // @[Test.scala 99:11:@2959.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"b.exponent is %b \n",5'hf); // @[Test.scala 100:11:@2964.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"b.fraction is %b \n",4'h0); // @[Test.scala 101:11:@2969.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"aPacked is %b \n",aPacked_bits); // @[Test.scala 103:11:@2974.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"now testing decoding for packed a... \n"); // @[Test.scala 104:11:@2979.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"sign is %b \n",aUnpacked_sign); // @[Test.scala 105:11:@2984.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"isInf is %b \n",aUnpacked_isInf); // @[Test.scala 106:11:@2989.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"isZero is %b \n",aUnpacked_isZero); // @[Test.scala 107:11:@2994.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"exponent is %b \n",aUnpacked_exponent); // @[Test.scala 108:11:@2999.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"fraction is %b \n",aUnpacked_fraction); // @[Test.scala 109:11:@3004.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"\n"); // @[Test.scala 110:11:@3009.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"bPacked is %b \n",bPacked_bits); // @[Test.scala 111:11:@3014.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"now testing decoding for packed b... \n"); // @[Test.scala 112:11:@3019.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"sign is %b \n",bUnpacked_sign); // @[Test.scala 113:11:@3024.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"isInf is %b \n",bUnpacked_isInf); // @[Test.scala 114:11:@3029.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"isZero is %b \n",bUnpacked_isZero); // @[Test.scala 115:11:@3034.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"exponent is %b \n",bUnpacked_exponent); // @[Test.scala 116:11:@3039.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"fraction is %b \n",bUnpacked_fraction); // @[Test.scala 117:11:@3044.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"\n"); // @[Test.scala 118:11:@3049.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"now testing packed to packed multiplication (end to end) \n"); // @[Test.scala 128:11:@3054.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"results: \n"); // @[Test.scala 129:11:@3059.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"%b is the packed output \n",cPacked_bits); // @[Test.scala 130:11:@3064.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"sign is %b \n",cUnpacked_sign); // @[Test.scala 131:11:@3069.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"isInf is %b \n",cUnpacked_isInf); // @[Test.scala 132:11:@3074.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"isZero is %b \n",cUnpacked_isZero); // @[Test.scala 133:11:@3079.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"exponent is %b \n",cUnpacked_exponent); // @[Test.scala 134:11:@3084.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"fraction is %b \n",cUnpacked_fraction); // @[Test.scala 135:11:@3089.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"\n"); // @[Test.scala 136:11:@3094.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"counting leading zeros of %b \n",6'h4); // @[Test.scala 137:11:@3099.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"output is %d \n",countOutput); // @[Test.scala 138:11:@3104.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"\n"); // @[Test.scala 139:11:@3109.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"out.sign is %b \n",multiply_io_out_sign); // @[Test.scala 141:11:@3114.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"out.isZero is %b \n",multiply_io_out_isZero); // @[Test.scala 142:11:@3119.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"out.isInf is %b \n",multiply_io_out_isInf); // @[Test.scala 143:11:@3124.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"out.trailingBits is %b \n",trailingBits); // @[Test.scala 144:11:@3129.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"out.stickyBit is %b \n",stickyBit); // @[Test.scala 145:11:@3134.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"out.exponent is %b \n",multiply_io_out_exponent); // @[Test.scala 147:11:@3139.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _T_32) begin
          $fwrite(32'h80000002,"out.fraction is %b \n",multiply_io_out_fraction); // @[Test.scala 148:11:@3144.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
