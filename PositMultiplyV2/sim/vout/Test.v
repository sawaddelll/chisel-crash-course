module CountLeadingZerosTree( // @[:@3.2]
  input        io_left, // @[:@6.4]
  input        io_right, // @[:@6.4]
  output [1:0] io_out // @[:@6.4]
);
  wire  rCount; // @[PositDef.scala 318:15:@19.4]
  wire  lCount; // @[PositDef.scala 309:15:@16.4]
  wire  _T_27; // @[PositDef.scala 333:40:@23.4]
  wire  _T_33; // @[PositDef.scala 335:17:@30.6]
  wire [1:0] _T_35; // @[Cat.scala 30:58:@32.8]
  wire [1:0] _GEN_0; // @[PositDef.scala 335:51:@31.6]
  assign rCount = ~ io_right; // @[PositDef.scala 318:15:@19.4]
  assign lCount = ~ io_left; // @[PositDef.scala 309:15:@16.4]
  assign _T_27 = lCount & rCount; // @[PositDef.scala 333:40:@23.4]
  assign _T_33 = lCount == 1'h0; // @[PositDef.scala 335:17:@30.6]
  assign _T_35 = {1'h0,lCount}; // @[Cat.scala 30:58:@32.8]
  assign _GEN_0 = _T_33 ? _T_35 : 2'h1; // @[PositDef.scala 335:51:@31.6]
  assign io_out = _T_27 ? 2'h2 : _GEN_0; // @[PositDef.scala 334:14:@26.6 PositDef.scala 336:14:@33.8 PositDef.scala 338:14:@36.8]
endmodule
module CountLeadingZerosTree_2( // @[:@75.2]
  input  [3:0] io_left, // @[:@78.4]
  output [2:0] io_out // @[:@78.4]
);
  wire  CountLeadingZerosTree_io_left; // @[PositDef.scala 304:27:@92.4]
  wire  CountLeadingZerosTree_io_right; // @[PositDef.scala 304:27:@92.4]
  wire [1:0] CountLeadingZerosTree_io_out; // @[PositDef.scala 304:27:@92.4]
  wire  CountLeadingZerosTree_1_io_left; // @[PositDef.scala 313:27:@100.4]
  wire  CountLeadingZerosTree_1_io_right; // @[PositDef.scala 313:27:@100.4]
  wire [1:0] CountLeadingZerosTree_1_io_out; // @[PositDef.scala 313:27:@100.4]
  wire [1:0] rCount; // @[PositDef.scala 286:20:@81.4 PositDef.scala 316:12:@107.4]
  wire  rCountExtendVec_1; // @[PositDef.scala 294:33:@84.4]
  wire  rCountExtendVec_0; // @[PositDef.scala 294:33:@86.4]
  wire [2:0] rCountExtend; // @[PositDef.scala 301:35:@90.4]
  wire [1:0] _T_27; // @[PositDef.scala 305:33:@95.4]
  wire [1:0] _T_29; // @[PositDef.scala 314:33:@103.4]
  wire [2:0] lCount; // @[PositDef.scala 285:20:@80.4 PositDef.scala 307:12:@99.4]
  wire  _T_31; // @[PositDef.scala 322:16:@108.4]
  wire  _T_32; // @[PositDef.scala 322:55:@109.4]
  wire  _T_33; // @[PositDef.scala 322:40:@110.4]
  wire  _T_39; // @[PositDef.scala 324:17:@117.6]
  wire [3:0] _T_41; // @[Cat.scala 30:58:@119.8]
  wire [1:0] _T_43; // @[PositDef.scala 327:43:@123.8]
  wire [3:0] _T_44; // @[Cat.scala 30:58:@124.8]
  wire [3:0] _GEN_0; // @[PositDef.scala 324:51:@118.6]
  wire [3:0] _GEN_1; // @[PositDef.scala 322:80:@111.4]
  CountLeadingZerosTree CountLeadingZerosTree ( // @[PositDef.scala 304:27:@92.4]
    .io_left(CountLeadingZerosTree_io_left),
    .io_right(CountLeadingZerosTree_io_right),
    .io_out(CountLeadingZerosTree_io_out)
  );
  CountLeadingZerosTree CountLeadingZerosTree_1 ( // @[PositDef.scala 313:27:@100.4]
    .io_left(CountLeadingZerosTree_1_io_left),
    .io_right(CountLeadingZerosTree_1_io_right),
    .io_out(CountLeadingZerosTree_1_io_out)
  );
  assign rCount = CountLeadingZerosTree_1_io_out; // @[PositDef.scala 286:20:@81.4 PositDef.scala 316:12:@107.4]
  assign rCountExtendVec_1 = rCount[1]; // @[PositDef.scala 294:33:@84.4]
  assign rCountExtendVec_0 = rCount[0]; // @[PositDef.scala 294:33:@86.4]
  assign rCountExtend = {1'h0,rCountExtendVec_1,rCountExtendVec_0}; // @[PositDef.scala 301:35:@90.4]
  assign _T_27 = io_left[3:2]; // @[PositDef.scala 305:33:@95.4]
  assign _T_29 = io_left[1:0]; // @[PositDef.scala 314:33:@103.4]
  assign lCount = {{1'd0}, CountLeadingZerosTree_io_out}; // @[PositDef.scala 285:20:@80.4 PositDef.scala 307:12:@99.4]
  assign _T_31 = lCount[2]; // @[PositDef.scala 322:16:@108.4]
  assign _T_32 = rCountExtend[2]; // @[PositDef.scala 322:55:@109.4]
  assign _T_33 = _T_31 & _T_32; // @[PositDef.scala 322:40:@110.4]
  assign _T_39 = _T_31 == 1'h0; // @[PositDef.scala 324:17:@117.6]
  assign _T_41 = {1'h0,lCount}; // @[Cat.scala 30:58:@119.8]
  assign _T_43 = rCountExtend[1:0]; // @[PositDef.scala 327:43:@123.8]
  assign _T_44 = {2'h1,_T_43}; // @[Cat.scala 30:58:@124.8]
  assign _GEN_0 = _T_39 ? _T_41 : _T_44; // @[PositDef.scala 324:51:@118.6]
  assign _GEN_1 = _T_33 ? 4'h4 : _GEN_0; // @[PositDef.scala 322:80:@111.4]
  assign io_out = _GEN_1[2:0]; // @[PositDef.scala 323:14:@113.6 PositDef.scala 325:14:@120.8 PositDef.scala 327:14:@125.8]
  assign CountLeadingZerosTree_io_left = _T_27[0]; // @[PositDef.scala 305:23:@96.4]
  assign CountLeadingZerosTree_io_right = io_left[0]; // @[PositDef.scala 306:24:@98.4]
  assign CountLeadingZerosTree_1_io_left = _T_29[0]; // @[PositDef.scala 314:23:@104.4]
  assign CountLeadingZerosTree_1_io_right = io_left[0]; // @[PositDef.scala 315:24:@106.4]
endmodule
module CountLeadingZeros( // @[:@128.2]
  input  [5:0] io_in, // @[:@131.4]
  output [2:0] io_out // @[:@131.4]
);
  wire [3:0] tree_io_left; // @[PositDef.scala 371:20:@153.4]
  wire [2:0] tree_io_out; // @[PositDef.scala 371:20:@153.4]
  wire  inPadVec_5; // @[PositDef.scala 368:25:@135.4]
  wire  inPadVec_4; // @[PositDef.scala 368:25:@137.4]
  wire  inPadVec_3; // @[PositDef.scala 368:25:@139.4]
  wire  inPadVec_2; // @[PositDef.scala 368:25:@141.4]
  wire  inPadVec_1; // @[PositDef.scala 368:25:@143.4]
  wire  inPadVec_0; // @[PositDef.scala 368:25:@145.4]
  wire [5:0] inPad; // @[PositDef.scala 370:21:@151.4]
  CountLeadingZerosTree_2 tree ( // @[PositDef.scala 371:20:@153.4]
    .io_left(tree_io_left),
    .io_out(tree_io_out)
  );
  assign inPadVec_5 = io_in[5]; // @[PositDef.scala 368:25:@135.4]
  assign inPadVec_4 = io_in[4]; // @[PositDef.scala 368:25:@137.4]
  assign inPadVec_3 = io_in[3]; // @[PositDef.scala 368:25:@139.4]
  assign inPadVec_2 = io_in[2]; // @[PositDef.scala 368:25:@141.4]
  assign inPadVec_1 = io_in[1]; // @[PositDef.scala 368:25:@143.4]
  assign inPadVec_0 = io_in[0]; // @[PositDef.scala 368:25:@145.4]
  assign inPad = {inPadVec_5,inPadVec_4,inPadVec_3,inPadVec_2,inPadVec_1,inPadVec_0}; // @[PositDef.scala 370:21:@151.4]
  assign io_out = tree_io_out; // @[PositDef.scala 374:10:@160.4]
  assign tree_io_left = inPad[5:2]; // @[PositDef.scala 372:16:@157.4]
endmodule
module PositDecode( // @[:@162.2]
  input  [7:0] io_in_bits, // @[:@165.4]
  output       io_out_isZero, // @[:@165.4]
  output       io_out_isInf, // @[:@165.4]
  output       io_out_sign, // @[:@165.4]
  output [4:0] io_out_exponent, // @[:@165.4]
  output [3:0] io_out_fraction // @[:@165.4]
);
  wire [5:0] countingLeadingZeros_io_in; // @[PositDecode.scala 64:36:@206.4]
  wire [2:0] countingLeadingZeros_io_out; // @[PositDecode.scala 64:36:@206.4]
  wire [6:0] remainderBits; // @[PositDecode.scala 72:30:@214.4]
  wire  _T_28; // @[PositDecode.scala 54:44:@176.4]
  wire  _T_29; // @[PositDecode.scala 54:63:@177.4]
  wire  remainderXorVec_5; // @[PositDecode.scala 54:48:@178.4]
  wire  _T_32; // @[PositDecode.scala 54:63:@181.4]
  wire  remainderXorVec_4; // @[PositDecode.scala 54:48:@182.4]
  wire  _T_35; // @[PositDecode.scala 54:63:@185.4]
  wire  remainderXorVec_3; // @[PositDecode.scala 54:48:@186.4]
  wire  _T_38; // @[PositDecode.scala 54:63:@189.4]
  wire  remainderXorVec_2; // @[PositDecode.scala 54:48:@190.4]
  wire  _T_41; // @[PositDecode.scala 54:63:@193.4]
  wire  remainderXorVec_1; // @[PositDecode.scala 54:48:@194.4]
  wire  _T_44; // @[PositDecode.scala 54:63:@197.4]
  wire  remainderXorVec_0; // @[PositDecode.scala 54:48:@198.4]
  wire [2:0] _T_47; // @[PositDecode.scala 59:35:@201.4]
  wire [2:0] _T_49; // @[PositDecode.scala 59:35:@203.4]
  wire [4:0] _T_51; // @[PositDecode.scala 69:37:@211.4]
  wire [2:0] cl0; // @[PositDecode.scala 31:17:@170.4 PositDecode.scala 66:7:@210.4]
  wire [11:0] _GEN_2; // @[PositDecode.scala 69:72:@212.4]
  wire [11:0] _T_52; // @[PositDecode.scala 69:72:@212.4]
  wire  _T_56; // @[PositDecode.scala 76:31:@218.4]
  wire  isSpecial; // @[PositDecode.scala 76:16:@219.4]
  wire [3:0] cl0extended; // @[PositDecode.scala 79:25:@221.4 PositDecode.scala 80:15:@222.4]
  wire [3:0] _T_67; // @[PositDecode.scala 89:83:@234.8]
  wire [4:0] _T_68; // @[PositDecode.scala 89:81:@235.8]
  wire [3:0] _T_69; // @[PositDecode.scala 89:81:@236.8]
  wire [3:0] _GEN_0; // @[PositDecode.scala 85:47:@230.6]
  wire [3:0] unsignedRegime; // @[PositDecode.scala 82:28:@224.4]
  wire  _T_70; // @[PositDecode.scala 122:29:@241.4]
  wire  _T_75; // @[PositDecode.scala 123:20:@246.4]
  wire  _T_79; // @[PositDecode.scala 124:18:@250.4]
  wire [4:0] esAndFractionBits; // @[PositDecode.scala 48:31:@175.4 PositDecode.scala 69:21:@213.4]
  wire  _T_84; // @[PositDecode.scala 132:32:@255.4]
  CountLeadingZeros countingLeadingZeros ( // @[PositDecode.scala 64:36:@206.4]
    .io_in(countingLeadingZeros_io_in),
    .io_out(countingLeadingZeros_io_out)
  );
  assign remainderBits = io_in_bits[6:0]; // @[PositDecode.scala 72:30:@214.4]
  assign _T_28 = remainderBits[6]; // @[PositDecode.scala 54:44:@176.4]
  assign _T_29 = remainderBits[5]; // @[PositDecode.scala 54:63:@177.4]
  assign remainderXorVec_5 = _T_28 ^ _T_29; // @[PositDecode.scala 54:48:@178.4]
  assign _T_32 = remainderBits[4]; // @[PositDecode.scala 54:63:@181.4]
  assign remainderXorVec_4 = _T_29 ^ _T_32; // @[PositDecode.scala 54:48:@182.4]
  assign _T_35 = remainderBits[3]; // @[PositDecode.scala 54:63:@185.4]
  assign remainderXorVec_3 = _T_32 ^ _T_35; // @[PositDecode.scala 54:48:@186.4]
  assign _T_38 = remainderBits[2]; // @[PositDecode.scala 54:63:@189.4]
  assign remainderXorVec_2 = _T_35 ^ _T_38; // @[PositDecode.scala 54:48:@190.4]
  assign _T_41 = remainderBits[1]; // @[PositDecode.scala 54:63:@193.4]
  assign remainderXorVec_1 = _T_38 ^ _T_41; // @[PositDecode.scala 54:48:@194.4]
  assign _T_44 = remainderBits[0]; // @[PositDecode.scala 54:63:@197.4]
  assign remainderXorVec_0 = _T_41 ^ _T_44; // @[PositDecode.scala 54:48:@198.4]
  assign _T_47 = {remainderXorVec_2,remainderXorVec_1,remainderXorVec_0}; // @[PositDecode.scala 59:35:@201.4]
  assign _T_49 = {remainderXorVec_5,remainderXorVec_4,remainderXorVec_3}; // @[PositDecode.scala 59:35:@203.4]
  assign _T_51 = remainderBits[4:0]; // @[PositDecode.scala 69:37:@211.4]
  assign cl0 = countingLeadingZeros_io_out; // @[PositDecode.scala 31:17:@170.4 PositDecode.scala 66:7:@210.4]
  assign _GEN_2 = {{7'd0}, _T_51}; // @[PositDecode.scala 69:72:@212.4]
  assign _T_52 = _GEN_2 << cl0; // @[PositDecode.scala 69:72:@212.4]
  assign _T_56 = remainderBits != 7'h0; // @[PositDecode.scala 76:31:@218.4]
  assign isSpecial = _T_56 == 1'h0; // @[PositDecode.scala 76:16:@219.4]
  assign cl0extended = {{1'd0}, cl0}; // @[PositDecode.scala 79:25:@221.4 PositDecode.scala 80:15:@222.4]
  assign _T_67 = ~ cl0extended; // @[PositDecode.scala 89:83:@234.8]
  assign _T_68 = 4'h6 + _T_67; // @[PositDecode.scala 89:81:@235.8]
  assign _T_69 = 4'h6 + _T_67; // @[PositDecode.scala 89:81:@236.8]
  assign _GEN_0 = _T_28 ? cl0extended : _T_69; // @[PositDecode.scala 85:47:@230.6]
  assign unsignedRegime = isSpecial ? 4'h0 : _GEN_0; // @[PositDecode.scala 82:28:@224.4]
  assign _T_70 = io_in_bits[7]; // @[PositDecode.scala 122:29:@241.4]
  assign _T_75 = _T_70 == 1'h0; // @[PositDecode.scala 123:20:@246.4]
  assign _T_79 = isSpecial == 1'h0; // @[PositDecode.scala 124:18:@250.4]
  assign esAndFractionBits = _T_52[4:0]; // @[PositDecode.scala 48:31:@175.4 PositDecode.scala 69:21:@213.4]
  assign _T_84 = esAndFractionBits[4]; // @[PositDecode.scala 132:32:@255.4]
  assign io_out_isZero = _T_75 & isSpecial; // @[PositDecode.scala 123:17:@249.4]
  assign io_out_isInf = _T_70 & isSpecial; // @[PositDecode.scala 122:16:@244.4]
  assign io_out_sign = _T_79 & _T_70; // @[PositDecode.scala 124:15:@253.4]
  assign io_out_exponent = {unsignedRegime,_T_84}; // @[PositDecode.scala 135:21:@260.4]
  assign io_out_fraction = esAndFractionBits[3:0]; // @[PositDecode.scala 134:21:@258.4]
  assign countingLeadingZeros_io_in = {_T_49,_T_47}; // @[PositDecode.scala 65:30:@209.4]
endmodule
module DataGen( // @[:@521.2]
  input        clock, // @[:@522.4]
  input        reset, // @[:@523.4]
  output       io_a_isZero, // @[:@524.4]
  output       io_a_isInf, // @[:@524.4]
  output       io_a_sign, // @[:@524.4]
  output [4:0] io_a_exponent, // @[:@524.4]
  output [3:0] io_a_fraction, // @[:@524.4]
  output       io_b_isZero, // @[:@524.4]
  output       io_b_isInf, // @[:@524.4]
  output       io_b_sign, // @[:@524.4]
  output [4:0] io_b_exponent, // @[:@524.4]
  output [3:0] io_b_fraction // @[:@524.4]
);
  wire [7:0] decoding_io_in_bits; // @[Test.scala 29:24:@530.4]
  wire  decoding_io_out_isZero; // @[Test.scala 29:24:@530.4]
  wire  decoding_io_out_isInf; // @[Test.scala 29:24:@530.4]
  wire  decoding_io_out_sign; // @[Test.scala 29:24:@530.4]
  wire [4:0] decoding_io_out_exponent; // @[Test.scala 29:24:@530.4]
  wire [3:0] decoding_io_out_fraction; // @[Test.scala 29:24:@530.4]
  wire [7:0] decodingB_io_in_bits; // @[Test.scala 33:25:@539.4]
  wire  decodingB_io_out_isZero; // @[Test.scala 33:25:@539.4]
  wire  decodingB_io_out_isInf; // @[Test.scala 33:25:@539.4]
  wire  decodingB_io_out_sign; // @[Test.scala 33:25:@539.4]
  wire [4:0] decodingB_io_out_exponent; // @[Test.scala 33:25:@539.4]
  wire [3:0] decodingB_io_out_fraction; // @[Test.scala 33:25:@539.4]
  wire  _T_15; // @[Test.scala 37:9:@549.4]
  PositDecode decoding ( // @[Test.scala 29:24:@530.4]
    .io_in_bits(decoding_io_in_bits),
    .io_out_isZero(decoding_io_out_isZero),
    .io_out_isInf(decoding_io_out_isInf),
    .io_out_sign(decoding_io_out_sign),
    .io_out_exponent(decoding_io_out_exponent),
    .io_out_fraction(decoding_io_out_fraction)
  );
  PositDecode decodingB ( // @[Test.scala 33:25:@539.4]
    .io_in_bits(decodingB_io_in_bits),
    .io_out_isZero(decodingB_io_out_isZero),
    .io_out_isInf(decodingB_io_out_isInf),
    .io_out_sign(decodingB_io_out_sign),
    .io_out_exponent(decodingB_io_out_exponent),
    .io_out_fraction(decodingB_io_out_fraction)
  );
  assign _T_15 = reset == 1'h0; // @[Test.scala 37:9:@549.4]
  assign io_a_isZero = decoding_io_out_isZero; // @[Test.scala 31:8:@538.4]
  assign io_a_isInf = decoding_io_out_isInf; // @[Test.scala 31:8:@537.4]
  assign io_a_sign = decoding_io_out_sign; // @[Test.scala 31:8:@536.4]
  assign io_a_exponent = decoding_io_out_exponent; // @[Test.scala 31:8:@535.4]
  assign io_a_fraction = decoding_io_out_fraction; // @[Test.scala 31:8:@534.4]
  assign io_b_isZero = decodingB_io_out_isZero; // @[Test.scala 35:8:@547.4]
  assign io_b_isInf = decodingB_io_out_isInf; // @[Test.scala 35:8:@546.4]
  assign io_b_sign = decodingB_io_out_sign; // @[Test.scala 35:8:@545.4]
  assign io_b_exponent = decodingB_io_out_exponent; // @[Test.scala 35:8:@544.4]
  assign io_b_fraction = decodingB_io_out_fraction; // @[Test.scala 35:8:@543.4]
  assign decoding_io_in_bits = 8'h62; // @[Test.scala 30:18:@533.4]
  assign decodingB_io_in_bits = 8'h68; // @[Test.scala 34:19:@542.4]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_15) begin
          $fwrite(32'h80000002,"a before decoding is %b \n",8'h62); // @[Test.scala 37:9:@551.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_15) begin
          $fwrite(32'h80000002,"b before decoding is %b \n",8'h68); // @[Test.scala 38:9:@556.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ZeroPadRight( // @[:@559.2]
  input  [9:0] io_in, // @[:@562.4]
  output [2:0] io_out // @[:@562.4]
);
  assign io_out = io_in[9:7]; // @[PositDef.scala 139:12:@565.4]
endmodule
module ShiftRightSticky( // @[:@567.2]
  input  [9:0] io_in, // @[:@570.4]
  output [2:0] io_out, // @[:@570.4]
  output       io_sticky // @[:@570.4]
);
  wire [9:0] padding_io_in; // @[PositDef.scala 185:23:@594.4]
  wire [2:0] padding_io_out; // @[PositDef.scala 185:23:@594.4]
  wire  valVectorOfVecs_0_2; // @[PositDef.scala 189:44:@602.4]
  wire  valVectorOfVecs_0_1; // @[PositDef.scala 189:44:@600.4]
  wire  valVectorOfVecs_0_0; // @[PositDef.scala 189:44:@598.4]
  wire [2:0] valVector_0; // @[PositDef.scala 171:40:@581.4]
  wire  valVectorOfVecs_1_2; // @[PositDef.scala 206:52:@618.4]
  wire  valVectorOfVecs_1_1; // @[PositDef.scala 212:52:@615.4]
  wire  valVectorOfVecs_1_0; // @[PositDef.scala 212:52:@612.4]
  wire [2:0] valVector_1; // @[PositDef.scala 171:40:@578.4]
  wire  valVectorOfVecs_2_2; // @[PositDef.scala 206:52:@636.4]
  wire  valVectorOfVecs_2_1; // @[PositDef.scala 206:52:@633.4]
  wire [1:0] _T_109; // @[PositDef.scala 171:40:@574.4]
  wire  valVectorOfVecs_2_0; // @[PositDef.scala 212:52:@630.4]
  wire [6:0] _T_141; // @[PositDef.scala 196:29:@604.4]
  wire  valStickyVec_0; // @[PositDef.scala 196:59:@605.4]
  wire [2:0] valSticky; // @[PositDef.scala 177:29:@586.4]
  ZeroPadRight padding ( // @[PositDef.scala 185:23:@594.4]
    .io_in(padding_io_in),
    .io_out(padding_io_out)
  );
  assign valVectorOfVecs_0_2 = padding_io_out[2]; // @[PositDef.scala 189:44:@602.4]
  assign valVectorOfVecs_0_1 = padding_io_out[1]; // @[PositDef.scala 189:44:@600.4]
  assign valVectorOfVecs_0_0 = padding_io_out[0]; // @[PositDef.scala 189:44:@598.4]
  assign valVector_0 = {valVectorOfVecs_0_2,valVectorOfVecs_0_1,valVectorOfVecs_0_0}; // @[PositDef.scala 171:40:@581.4]
  assign valVectorOfVecs_1_2 = valVector_0[2]; // @[PositDef.scala 206:52:@618.4]
  assign valVectorOfVecs_1_1 = valVector_0[1]; // @[PositDef.scala 212:52:@615.4]
  assign valVectorOfVecs_1_0 = valVector_0[0]; // @[PositDef.scala 212:52:@612.4]
  assign valVector_1 = {valVectorOfVecs_1_2,valVectorOfVecs_1_1,valVectorOfVecs_1_0}; // @[PositDef.scala 171:40:@578.4]
  assign valVectorOfVecs_2_2 = valVector_1[2]; // @[PositDef.scala 206:52:@636.4]
  assign valVectorOfVecs_2_1 = valVector_1[1]; // @[PositDef.scala 206:52:@633.4]
  assign _T_109 = {valVectorOfVecs_2_2,valVectorOfVecs_2_1}; // @[PositDef.scala 171:40:@574.4]
  assign valVectorOfVecs_2_0 = valVector_1[0]; // @[PositDef.scala 212:52:@630.4]
  assign _T_141 = io_in[6:0]; // @[PositDef.scala 196:29:@604.4]
  assign valStickyVec_0 = _T_141 != 7'h0; // @[PositDef.scala 196:59:@605.4]
  assign valSticky = {valStickyVec_0,valStickyVec_0,valStickyVec_0}; // @[PositDef.scala 177:29:@586.4]
  assign io_out = {_T_109,valVectorOfVecs_2_0}; // @[PositDef.scala 255:14:@649.4]
  assign io_sticky = valSticky[2]; // @[PositDef.scala 256:17:@651.4]
  assign padding_io_in = io_in; // @[PositDef.scala 186:17:@597.4]
endmodule
module ZeroPadRight_1( // @[:@655.2]
  input  [3:0] io_in, // @[:@658.4]
  output [1:0] io_out // @[:@658.4]
);
  assign io_out = io_in[3:2]; // @[PositDef.scala 139:12:@661.4]
endmodule
module PositMultiply( // @[:@663.2]
  input        io_a_isZero, // @[:@666.4]
  input        io_a_isInf, // @[:@666.4]
  input        io_a_sign, // @[:@666.4]
  input  [4:0] io_a_exponent, // @[:@666.4]
  input  [3:0] io_a_fraction, // @[:@666.4]
  input        io_b_isZero, // @[:@666.4]
  input        io_b_isInf, // @[:@666.4]
  input        io_b_sign, // @[:@666.4]
  input  [4:0] io_b_exponent, // @[:@666.4]
  input  [3:0] io_b_fraction, // @[:@666.4]
  output       io_out_isZero, // @[:@666.4]
  output       io_out_isInf, // @[:@666.4]
  output       io_out_sign, // @[:@666.4]
  output [4:0] io_out_exponent, // @[:@666.4]
  output [3:0] io_out_fraction, // @[:@666.4]
  output [1:0] io_trailingBits, // @[:@666.4]
  output       io_stickyBit // @[:@666.4]
);
  wire [9:0] shiftRightWithSticky_io_in; // @[PositMultiply.scala 49:36:@682.4]
  wire [2:0] shiftRightWithSticky_io_out; // @[PositMultiply.scala 49:36:@682.4]
  wire  shiftRightWithSticky_io_sticky; // @[PositMultiply.scala 49:36:@682.4]
  wire [3:0] zeroPadRight_io_in; // @[PositMultiply.scala 64:28:@691.4]
  wire [1:0] zeroPadRight_io_out; // @[PositMultiply.scala 64:28:@691.4]
  wire [4:0] _T_33; // @[Cat.scala 30:58:@699.4]
  wire [4:0] _T_35; // @[Cat.scala 30:58:@700.4]
  wire [9:0] abUnshiftedProduct; // @[PositMultiply.scala 74:54:@701.4]
  wire  abExpShift; // @[PositMultiply.scala 78:35:@703.4]
  wire [8:0] _T_43; // @[PositMultiply.scala 91:47:@715.6]
  wire [9:0] _T_45; // @[Cat.scala 30:58:@716.6]
  wire [9:0] abShiftedProduct; // @[PositMultiply.scala 88:30:@711.4]
  wire  abSign; // @[PositMultiply.scala 70:23:@697.4]
  wire [5:0] _T_38; // @[PositMultiply.scala 83:26:@705.4]
  wire [4:0] _T_39; // @[PositMultiply.scala 83:26:@706.4]
  wire [4:0] _GEN_8; // @[PositMultiply.scala 83:42:@707.4]
  wire [5:0] _T_40; // @[PositMultiply.scala 83:42:@707.4]
  wire [4:0] _T_41; // @[PositMultiply.scala 83:42:@708.4]
  wire [5:0] abExp; // @[PositMultiply.scala 32:19:@669.4 PositMultiply.scala 83:9:@709.4]
  wire  abExpTooSmall; // @[PositMultiply.scala 96:27:@719.4]
  wire  abExpTooLarge; // @[PositMultiply.scala 99:27:@721.4]
  wire [6:0] _T_51; // @[PositMultiply.scala 101:29:@723.4]
  wire [6:0] _T_52; // @[PositMultiply.scala 101:29:@724.4]
  wire [5:0] finalExpExtended; // @[PositMultiply.scala 101:29:@725.4]
  wire [4:0] finalExp; // @[PositMultiply.scala 103:31:@727.4]
  wire  _T_62; // @[PositMultiply.scala 112:21:@736.4]
  wire  _T_63; // @[PositMultiply.scala 112:52:@737.4]
  wire  _T_69; // @[PositMultiply.scala 116:22:@744.4]
  wire [4:0] _GEN_1; // @[PositMultiply.scala 118:39:@750.6]
  wire  _T_73; // @[PositMultiply.scala 124:21:@756.4]
  wire  _T_75; // @[PositMultiply.scala 124:38:@758.4]
  wire [3:0] _T_77; // @[PositMultiply.scala 127:40:@763.6]
  wire  _T_78; // @[PositMultiply.scala 130:21:@766.4]
  wire  _T_79; // @[PositMultiply.scala 130:36:@767.4]
  wire  _T_81; // @[PositMultiply.scala 130:51:@769.4]
  wire [2:0] underflowProduct; // @[PositMultiply.scala 42:30:@678.4 PositMultiply.scala 54:19:@687.4]
  wire [1:0] _T_84; // @[PositMultiply.scala 133:40:@776.8]
  wire [1:0] normalTrailingBits; // @[PositMultiply.scala 45:32:@680.4 PositMultiply.scala 67:24:@696.4]
  wire [1:0] _GEN_4; // @[PositMultiply.scala 132:39:@775.6]
  wire  underflowSticky; // @[PositMultiply.scala 44:29:@679.4 PositMultiply.scala 55:19:@688.4]
  wire [1:0] _T_91; // @[PositMultiply.scala 147:40:@797.4]
  wire  normalStickyBit; // @[PositMultiply.scala 147:101:@798.4]
  wire  _GEN_6; // @[PositMultiply.scala 140:39:@791.6]
  ShiftRightSticky shiftRightWithSticky ( // @[PositMultiply.scala 49:36:@682.4]
    .io_in(shiftRightWithSticky_io_in),
    .io_out(shiftRightWithSticky_io_out),
    .io_sticky(shiftRightWithSticky_io_sticky)
  );
  ZeroPadRight_1 zeroPadRight ( // @[PositMultiply.scala 64:28:@691.4]
    .io_in(zeroPadRight_io_in),
    .io_out(zeroPadRight_io_out)
  );
  assign _T_33 = {1'h1,io_a_fraction}; // @[Cat.scala 30:58:@699.4]
  assign _T_35 = {1'h1,io_b_fraction}; // @[Cat.scala 30:58:@700.4]
  assign abUnshiftedProduct = _T_33 * _T_35; // @[PositMultiply.scala 74:54:@701.4]
  assign abExpShift = abUnshiftedProduct[9]; // @[PositMultiply.scala 78:35:@703.4]
  assign _T_43 = abUnshiftedProduct[8:0]; // @[PositMultiply.scala 91:47:@715.6]
  assign _T_45 = {_T_43,1'h0}; // @[Cat.scala 30:58:@716.6]
  assign abShiftedProduct = abExpShift ? abUnshiftedProduct : _T_45; // @[PositMultiply.scala 88:30:@711.4]
  assign abSign = io_a_sign ^ io_b_sign; // @[PositMultiply.scala 70:23:@697.4]
  assign _T_38 = io_a_exponent + io_b_exponent; // @[PositMultiply.scala 83:26:@705.4]
  assign _T_39 = io_a_exponent + io_b_exponent; // @[PositMultiply.scala 83:26:@706.4]
  assign _GEN_8 = {{4'd0}, abExpShift}; // @[PositMultiply.scala 83:42:@707.4]
  assign _T_40 = _T_39 + _GEN_8; // @[PositMultiply.scala 83:42:@707.4]
  assign _T_41 = _T_39 + _GEN_8; // @[PositMultiply.scala 83:42:@708.4]
  assign abExp = {{1'd0}, _T_41}; // @[PositMultiply.scala 32:19:@669.4 PositMultiply.scala 83:9:@709.4]
  assign abExpTooSmall = abExp < 6'hc; // @[PositMultiply.scala 96:27:@719.4]
  assign abExpTooLarge = abExp > 6'h24; // @[PositMultiply.scala 99:27:@721.4]
  assign _T_51 = abExp - 6'hc; // @[PositMultiply.scala 101:29:@723.4]
  assign _T_52 = $unsigned(_T_51); // @[PositMultiply.scala 101:29:@724.4]
  assign finalExpExtended = _T_52[5:0]; // @[PositMultiply.scala 101:29:@725.4]
  assign finalExp = finalExpExtended[4:0]; // @[PositMultiply.scala 103:31:@727.4]
  assign _T_62 = io_out_isInf == 1'h0; // @[PositMultiply.scala 112:21:@736.4]
  assign _T_63 = io_a_isZero | io_b_isZero; // @[PositMultiply.scala 112:52:@737.4]
  assign _T_69 = io_out_isZero | io_out_isInf; // @[PositMultiply.scala 116:22:@744.4]
  assign _GEN_1 = abExpTooLarge ? 5'h18 : finalExp; // @[PositMultiply.scala 118:39:@750.6]
  assign _T_73 = io_out_isInf | io_out_isZero; // @[PositMultiply.scala 124:21:@756.4]
  assign _T_75 = _T_73 | abExpTooLarge; // @[PositMultiply.scala 124:38:@758.4]
  assign _T_77 = abShiftedProduct[8:5]; // @[PositMultiply.scala 127:40:@763.6]
  assign _T_78 = io_out_isInf | io_a_isZero; // @[PositMultiply.scala 130:21:@766.4]
  assign _T_79 = _T_78 | io_b_isZero; // @[PositMultiply.scala 130:36:@767.4]
  assign _T_81 = _T_79 | abExpTooLarge; // @[PositMultiply.scala 130:51:@769.4]
  assign underflowProduct = shiftRightWithSticky_io_out; // @[PositMultiply.scala 42:30:@678.4 PositMultiply.scala 54:19:@687.4]
  assign _T_84 = underflowProduct[1:0]; // @[PositMultiply.scala 133:40:@776.8]
  assign normalTrailingBits = zeroPadRight_io_out; // @[PositMultiply.scala 45:32:@680.4 PositMultiply.scala 67:24:@696.4]
  assign _GEN_4 = abExpTooSmall ? _T_84 : normalTrailingBits; // @[PositMultiply.scala 132:39:@775.6]
  assign underflowSticky = shiftRightWithSticky_io_sticky; // @[PositMultiply.scala 44:29:@679.4 PositMultiply.scala 55:19:@688.4]
  assign _T_91 = abShiftedProduct[1:0]; // @[PositMultiply.scala 147:40:@797.4]
  assign normalStickyBit = _T_91 != 2'h0; // @[PositMultiply.scala 147:101:@798.4]
  assign _GEN_6 = abExpTooSmall ? underflowSticky : normalStickyBit; // @[PositMultiply.scala 140:39:@791.6]
  assign io_out_isZero = _T_62 & _T_63; // @[PositMultiply.scala 112:17:@739.4]
  assign io_out_isInf = io_a_isInf | io_b_isInf; // @[PositMultiply.scala 110:16:@735.4]
  assign io_out_sign = _T_62 & abSign; // @[PositMultiply.scala 114:15:@743.4]
  assign io_out_exponent = _T_69 ? 5'h0 : _GEN_1; // @[PositMultiply.scala 117:21:@746.6 PositMultiply.scala 119:21:@751.8 PositMultiply.scala 121:21:@754.8]
  assign io_out_fraction = _T_75 ? 4'h0 : _T_77; // @[PositMultiply.scala 125:21:@760.6 PositMultiply.scala 127:21:@764.6]
  assign io_trailingBits = _T_81 ? 2'h0 : _GEN_4; // @[PositMultiply.scala 131:21:@771.6 PositMultiply.scala 133:21:@777.8 PositMultiply.scala 135:21:@780.8]
  assign io_stickyBit = _T_81 ? 1'h0 : _GEN_6; // @[PositMultiply.scala 139:18:@787.6 PositMultiply.scala 141:18:@792.8 PositMultiply.scala 143:18:@795.8]
  assign shiftRightWithSticky_io_in = abExpShift ? abUnshiftedProduct : _T_45; // @[PositMultiply.scala 52:30:@685.4]
  assign zeroPadRight_io_in = abShiftedProduct[3:0]; // @[PositMultiply.scala 66:22:@695.4]
endmodule
module PositEncode( // @[:@801.2]
  input        io_in_isZero, // @[:@804.4]
  input        io_in_isInf, // @[:@804.4]
  input        io_in_sign, // @[:@804.4]
  input  [4:0] io_in_exponent, // @[:@804.4]
  input  [3:0] io_in_fraction, // @[:@804.4]
  output [7:0] io_out_bits // @[:@804.4]
);
  wire [3:0] _T_26; // @[UnpackedPosit.scala 26:38:@827.4]
  wire [4:0] _T_28; // @[UnpackedPosit.scala 26:92:@828.4]
  wire [4:0] _T_29; // @[UnpackedPosit.scala 26:92:@829.4]
  wire [3:0] _T_30; // @[UnpackedPosit.scala 26:92:@830.4]
  wire [3:0] signedRegime; // @[UnpackedPosit.scala 27:56:@831.4]
  wire  posRegime; // @[PositEncode.scala 55:30:@834.4]
  wire [1:0] firstBits; // @[PositEncode.scala 40:27:@815.4]
  wire  _T_20; // @[PositEncode.scala 47:55:@821.4]
  wire [6:0] _T_22; // @[Cat.scala 30:58:@823.4]
  wire [6:0] esAndFraction; // @[PositEncode.scala 47:83:@824.4]
  wire [2:0] _T_36; // @[PositEncode.scala 66:30:@838.6]
  wire [2:0] _T_38; // @[PositEncode.scala 72:18:@843.6]
  wire [2:0] shiftBits; // @[PositEncode.scala 65:27:@837.4]
  wire [6:0] esAndFractionShifted; // @[PositEncode.scala 37:41:@811.4]
  wire  _T_84; // @[PositEncode.scala 88:44:@897.8]
  wire  _GEN_3; // @[PositEncode.scala 81:28:@866.6]
  wire  outBitsVec_1; // @[PositEncode.scala 77:22:@855.4]
  wire  _T_85; // @[PositEncode.scala 88:44:@899.8]
  wire  _GEN_2; // @[PositEncode.scala 81:28:@866.6]
  wire  outBitsVec_0; // @[PositEncode.scala 77:22:@855.4]
  wire  _T_82; // @[PositEncode.scala 88:44:@893.8]
  wire  _GEN_5; // @[PositEncode.scala 81:28:@866.6]
  wire  outBitsVec_3; // @[PositEncode.scala 77:22:@855.4]
  wire  _T_83; // @[PositEncode.scala 88:44:@895.8]
  wire  _GEN_4; // @[PositEncode.scala 81:28:@866.6]
  wire  outBitsVec_2; // @[PositEncode.scala 77:22:@855.4]
  wire [3:0] _T_54; // @[PositEncode.scala 76:29:@849.4]
  wire  _T_80; // @[PositEncode.scala 88:44:@889.8]
  wire  _GEN_7; // @[PositEncode.scala 81:28:@866.6]
  wire  outBitsVec_5; // @[PositEncode.scala 77:22:@855.4]
  wire  _T_81; // @[PositEncode.scala 88:44:@891.8]
  wire  _GEN_6; // @[PositEncode.scala 81:28:@866.6]
  wire  outBitsVec_4; // @[PositEncode.scala 77:22:@855.4]
  wire  _GEN_9; // @[PositEncode.scala 81:28:@866.6]
  wire  outBitsVec_7; // @[PositEncode.scala 77:22:@855.4]
  wire  _T_79; // @[PositEncode.scala 88:44:@887.8]
  wire  _GEN_8; // @[PositEncode.scala 81:28:@866.6]
  wire  outBitsVec_6; // @[PositEncode.scala 77:22:@855.4]
  wire [3:0] _T_57; // @[PositEncode.scala 76:29:@852.4]
  assign _T_26 = io_in_exponent[4:1]; // @[UnpackedPosit.scala 26:38:@827.4]
  assign _T_28 = _T_26 - 4'h6; // @[UnpackedPosit.scala 26:92:@828.4]
  assign _T_29 = $unsigned(_T_28); // @[UnpackedPosit.scala 26:92:@829.4]
  assign _T_30 = _T_29[3:0]; // @[UnpackedPosit.scala 26:92:@830.4]
  assign signedRegime = $signed(_T_30); // @[UnpackedPosit.scala 27:56:@831.4]
  assign posRegime = $signed(signedRegime) >= $signed(4'sh0); // @[PositEncode.scala 55:30:@834.4]
  assign firstBits = posRegime ? 2'h2 : 2'h1; // @[PositEncode.scala 40:27:@815.4]
  assign _T_20 = io_in_exponent[0]; // @[PositEncode.scala 47:55:@821.4]
  assign _T_22 = {firstBits,_T_20,io_in_fraction}; // @[Cat.scala 30:58:@823.4]
  assign esAndFraction = $signed(_T_22); // @[PositEncode.scala 47:83:@824.4]
  assign _T_36 = signedRegime[2:0]; // @[PositEncode.scala 66:30:@838.6]
  assign _T_38 = ~ _T_36; // @[PositEncode.scala 72:18:@843.6]
  assign shiftBits = posRegime ? _T_36 : _T_38; // @[PositEncode.scala 65:27:@837.4]
  assign esAndFractionShifted = $signed(esAndFraction) >>> shiftBits; // @[PositEncode.scala 37:41:@811.4]
  assign _T_84 = esAndFractionShifted[1]; // @[PositEncode.scala 88:44:@897.8]
  assign _GEN_3 = io_in_isInf ? 1'h0 : _T_84; // @[PositEncode.scala 81:28:@866.6]
  assign outBitsVec_1 = io_in_isZero ? 1'h0 : _GEN_3; // @[PositEncode.scala 77:22:@855.4]
  assign _T_85 = esAndFractionShifted[0]; // @[PositEncode.scala 88:44:@899.8]
  assign _GEN_2 = io_in_isInf ? 1'h0 : _T_85; // @[PositEncode.scala 81:28:@866.6]
  assign outBitsVec_0 = io_in_isZero ? 1'h0 : _GEN_2; // @[PositEncode.scala 77:22:@855.4]
  assign _T_82 = esAndFractionShifted[3]; // @[PositEncode.scala 88:44:@893.8]
  assign _GEN_5 = io_in_isInf ? 1'h0 : _T_82; // @[PositEncode.scala 81:28:@866.6]
  assign outBitsVec_3 = io_in_isZero ? 1'h0 : _GEN_5; // @[PositEncode.scala 77:22:@855.4]
  assign _T_83 = esAndFractionShifted[2]; // @[PositEncode.scala 88:44:@895.8]
  assign _GEN_4 = io_in_isInf ? 1'h0 : _T_83; // @[PositEncode.scala 81:28:@866.6]
  assign outBitsVec_2 = io_in_isZero ? 1'h0 : _GEN_4; // @[PositEncode.scala 77:22:@855.4]
  assign _T_54 = {outBitsVec_3,outBitsVec_2,outBitsVec_1,outBitsVec_0}; // @[PositEncode.scala 76:29:@849.4]
  assign _T_80 = esAndFractionShifted[5]; // @[PositEncode.scala 88:44:@889.8]
  assign _GEN_7 = io_in_isInf ? 1'h0 : _T_80; // @[PositEncode.scala 81:28:@866.6]
  assign outBitsVec_5 = io_in_isZero ? 1'h0 : _GEN_7; // @[PositEncode.scala 77:22:@855.4]
  assign _T_81 = esAndFractionShifted[4]; // @[PositEncode.scala 88:44:@891.8]
  assign _GEN_6 = io_in_isInf ? 1'h0 : _T_81; // @[PositEncode.scala 81:28:@866.6]
  assign outBitsVec_4 = io_in_isZero ? 1'h0 : _GEN_6; // @[PositEncode.scala 77:22:@855.4]
  assign _GEN_9 = io_in_isInf ? 1'h1 : io_in_sign; // @[PositEncode.scala 81:28:@866.6]
  assign outBitsVec_7 = io_in_isZero ? 1'h0 : _GEN_9; // @[PositEncode.scala 77:22:@855.4]
  assign _T_79 = esAndFractionShifted[6]; // @[PositEncode.scala 88:44:@887.8]
  assign _GEN_8 = io_in_isInf ? 1'h0 : _T_79; // @[PositEncode.scala 81:28:@866.6]
  assign outBitsVec_6 = io_in_isZero ? 1'h0 : _GEN_8; // @[PositEncode.scala 77:22:@855.4]
  assign _T_57 = {outBitsVec_7,outBitsVec_6,outBitsVec_5,outBitsVec_4}; // @[PositEncode.scala 76:29:@852.4]
  assign io_out_bits = {_T_57,_T_54}; // @[PositEncode.scala 76:15:@854.4]
endmodule
module Test( // @[:@1107.2]
  input   clock, // @[:@1108.4]
  input   reset // @[:@1109.4]
);
  wire  gen_clock; // @[Test.scala 45:19:@1112.4]
  wire  gen_reset; // @[Test.scala 45:19:@1112.4]
  wire  gen_io_a_isZero; // @[Test.scala 45:19:@1112.4]
  wire  gen_io_a_isInf; // @[Test.scala 45:19:@1112.4]
  wire  gen_io_a_sign; // @[Test.scala 45:19:@1112.4]
  wire [4:0] gen_io_a_exponent; // @[Test.scala 45:19:@1112.4]
  wire [3:0] gen_io_a_fraction; // @[Test.scala 45:19:@1112.4]
  wire  gen_io_b_isZero; // @[Test.scala 45:19:@1112.4]
  wire  gen_io_b_isInf; // @[Test.scala 45:19:@1112.4]
  wire  gen_io_b_sign; // @[Test.scala 45:19:@1112.4]
  wire [4:0] gen_io_b_exponent; // @[Test.scala 45:19:@1112.4]
  wire [3:0] gen_io_b_fraction; // @[Test.scala 45:19:@1112.4]
  wire  multiply_io_a_isZero; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_a_isInf; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_a_sign; // @[Test.scala 46:24:@1115.4]
  wire [4:0] multiply_io_a_exponent; // @[Test.scala 46:24:@1115.4]
  wire [3:0] multiply_io_a_fraction; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_b_isZero; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_b_isInf; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_b_sign; // @[Test.scala 46:24:@1115.4]
  wire [4:0] multiply_io_b_exponent; // @[Test.scala 46:24:@1115.4]
  wire [3:0] multiply_io_b_fraction; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_out_isZero; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_out_isInf; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_out_sign; // @[Test.scala 46:24:@1115.4]
  wire [4:0] multiply_io_out_exponent; // @[Test.scala 46:24:@1115.4]
  wire [3:0] multiply_io_out_fraction; // @[Test.scala 46:24:@1115.4]
  wire [1:0] multiply_io_trailingBits; // @[Test.scala 46:24:@1115.4]
  wire  multiply_io_stickyBit; // @[Test.scala 46:24:@1115.4]
  wire  encodingInputA_io_in_isZero; // @[Test.scala 50:30:@1128.4]
  wire  encodingInputA_io_in_isInf; // @[Test.scala 50:30:@1128.4]
  wire  encodingInputA_io_in_sign; // @[Test.scala 50:30:@1128.4]
  wire [4:0] encodingInputA_io_in_exponent; // @[Test.scala 50:30:@1128.4]
  wire [3:0] encodingInputA_io_in_fraction; // @[Test.scala 50:30:@1128.4]
  wire [7:0] encodingInputA_io_out_bits; // @[Test.scala 50:30:@1128.4]
  wire  encodingInputB_io_in_isZero; // @[Test.scala 55:30:@1138.4]
  wire  encodingInputB_io_in_isInf; // @[Test.scala 55:30:@1138.4]
  wire  encodingInputB_io_in_sign; // @[Test.scala 55:30:@1138.4]
  wire [4:0] encodingInputB_io_in_exponent; // @[Test.scala 55:30:@1138.4]
  wire [3:0] encodingInputB_io_in_fraction; // @[Test.scala 55:30:@1138.4]
  wire [7:0] encodingInputB_io_out_bits; // @[Test.scala 55:30:@1138.4]
  wire  encodingOutput_io_in_isZero; // @[Test.scala 60:30:@1148.4]
  wire  encodingOutput_io_in_isInf; // @[Test.scala 60:30:@1148.4]
  wire  encodingOutput_io_in_sign; // @[Test.scala 60:30:@1148.4]
  wire [4:0] encodingOutput_io_in_exponent; // @[Test.scala 60:30:@1148.4]
  wire [3:0] encodingOutput_io_in_fraction; // @[Test.scala 60:30:@1148.4]
  wire [7:0] encodingOutput_io_out_bits; // @[Test.scala 60:30:@1148.4]
  wire  _T_13; // @[Test.scala 76:11:@1169.4]
  wire [7:0] aValue_bits; // @[Test.scala 52:20:@1136.4 Test.scala 53:10:@1137.4]
  wire [7:0] bValue_bits; // @[Test.scala 57:20:@1146.4 Test.scala 58:10:@1147.4]
  wire [7:0] outputValue_bits; // @[Test.scala 62:25:@1156.4 Test.scala 63:15:@1157.4]
  wire [7:0] trailingBits; // @[Test.scala 65:26:@1158.4 Test.scala 68:16:@1160.4]
  wire  stickyBit; // @[Test.scala 66:23:@1159.4 Test.scala 69:13:@1161.4]
  DataGen gen ( // @[Test.scala 45:19:@1112.4]
    .clock(gen_clock),
    .reset(gen_reset),
    .io_a_isZero(gen_io_a_isZero),
    .io_a_isInf(gen_io_a_isInf),
    .io_a_sign(gen_io_a_sign),
    .io_a_exponent(gen_io_a_exponent),
    .io_a_fraction(gen_io_a_fraction),
    .io_b_isZero(gen_io_b_isZero),
    .io_b_isInf(gen_io_b_isInf),
    .io_b_sign(gen_io_b_sign),
    .io_b_exponent(gen_io_b_exponent),
    .io_b_fraction(gen_io_b_fraction)
  );
  PositMultiply multiply ( // @[Test.scala 46:24:@1115.4]
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
  PositEncode encodingInputA ( // @[Test.scala 50:30:@1128.4]
    .io_in_isZero(encodingInputA_io_in_isZero),
    .io_in_isInf(encodingInputA_io_in_isInf),
    .io_in_sign(encodingInputA_io_in_sign),
    .io_in_exponent(encodingInputA_io_in_exponent),
    .io_in_fraction(encodingInputA_io_in_fraction),
    .io_out_bits(encodingInputA_io_out_bits)
  );
  PositEncode encodingInputB ( // @[Test.scala 55:30:@1138.4]
    .io_in_isZero(encodingInputB_io_in_isZero),
    .io_in_isInf(encodingInputB_io_in_isInf),
    .io_in_sign(encodingInputB_io_in_sign),
    .io_in_exponent(encodingInputB_io_in_exponent),
    .io_in_fraction(encodingInputB_io_in_fraction),
    .io_out_bits(encodingInputB_io_out_bits)
  );
  PositEncode encodingOutput ( // @[Test.scala 60:30:@1148.4]
    .io_in_isZero(encodingOutput_io_in_isZero),
    .io_in_isInf(encodingOutput_io_in_isInf),
    .io_in_sign(encodingOutput_io_in_sign),
    .io_in_exponent(encodingOutput_io_in_exponent),
    .io_in_fraction(encodingOutput_io_in_fraction),
    .io_out_bits(encodingOutput_io_out_bits)
  );
  assign _T_13 = reset == 1'h0; // @[Test.scala 76:11:@1169.4]
  assign aValue_bits = encodingInputA_io_out_bits; // @[Test.scala 52:20:@1136.4 Test.scala 53:10:@1137.4]
  assign bValue_bits = encodingInputB_io_out_bits; // @[Test.scala 57:20:@1146.4 Test.scala 58:10:@1147.4]
  assign outputValue_bits = encodingOutput_io_out_bits; // @[Test.scala 62:25:@1156.4 Test.scala 63:15:@1157.4]
  assign trailingBits = {{6'd0}, multiply_io_trailingBits}; // @[Test.scala 65:26:@1158.4 Test.scala 68:16:@1160.4]
  assign stickyBit = multiply_io_stickyBit; // @[Test.scala 66:23:@1159.4 Test.scala 69:13:@1161.4]
  assign gen_clock = clock; // @[:@1113.4]
  assign gen_reset = reset; // @[:@1114.4]
  assign multiply_io_a_isZero = gen_io_a_isZero; // @[Test.scala 47:17:@1122.4]
  assign multiply_io_a_isInf = gen_io_a_isInf; // @[Test.scala 47:17:@1121.4]
  assign multiply_io_a_sign = gen_io_a_sign; // @[Test.scala 47:17:@1120.4]
  assign multiply_io_a_exponent = gen_io_a_exponent; // @[Test.scala 47:17:@1119.4]
  assign multiply_io_a_fraction = gen_io_a_fraction; // @[Test.scala 47:17:@1118.4]
  assign multiply_io_b_isZero = gen_io_b_isZero; // @[Test.scala 48:17:@1127.4]
  assign multiply_io_b_isInf = gen_io_b_isInf; // @[Test.scala 48:17:@1126.4]
  assign multiply_io_b_sign = gen_io_b_sign; // @[Test.scala 48:17:@1125.4]
  assign multiply_io_b_exponent = gen_io_b_exponent; // @[Test.scala 48:17:@1124.4]
  assign multiply_io_b_fraction = gen_io_b_fraction; // @[Test.scala 48:17:@1123.4]
  assign encodingInputA_io_in_isZero = gen_io_a_isZero; // @[Test.scala 51:24:@1135.4]
  assign encodingInputA_io_in_isInf = gen_io_a_isInf; // @[Test.scala 51:24:@1134.4]
  assign encodingInputA_io_in_sign = gen_io_a_sign; // @[Test.scala 51:24:@1133.4]
  assign encodingInputA_io_in_exponent = gen_io_a_exponent; // @[Test.scala 51:24:@1132.4]
  assign encodingInputA_io_in_fraction = gen_io_a_fraction; // @[Test.scala 51:24:@1131.4]
  assign encodingInputB_io_in_isZero = gen_io_b_isZero; // @[Test.scala 56:24:@1145.4]
  assign encodingInputB_io_in_isInf = gen_io_b_isInf; // @[Test.scala 56:24:@1144.4]
  assign encodingInputB_io_in_sign = gen_io_b_sign; // @[Test.scala 56:24:@1143.4]
  assign encodingInputB_io_in_exponent = gen_io_b_exponent; // @[Test.scala 56:24:@1142.4]
  assign encodingInputB_io_in_fraction = gen_io_b_fraction; // @[Test.scala 56:24:@1141.4]
  assign encodingOutput_io_in_isZero = multiply_io_out_isZero; // @[Test.scala 61:24:@1155.4]
  assign encodingOutput_io_in_isInf = multiply_io_out_isInf; // @[Test.scala 61:24:@1154.4]
  assign encodingOutput_io_in_sign = multiply_io_out_sign; // @[Test.scala 61:24:@1153.4]
  assign encodingOutput_io_in_exponent = multiply_io_out_exponent; // @[Test.scala 61:24:@1152.4]
  assign encodingOutput_io_in_fraction = multiply_io_out_fraction; // @[Test.scala 61:24:@1151.4]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"a.exponent is %b \n",gen_io_a_exponent); // @[Test.scala 76:11:@1171.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"a.fraction is %b \n",gen_io_a_fraction); // @[Test.scala 77:11:@1176.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"b.exponent is %b \n",gen_io_b_exponent); // @[Test.scala 78:11:@1181.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"b.fraction is %b \n",gen_io_b_fraction); // @[Test.scala 79:11:@1186.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"out.sign is %b \n",multiply_io_out_sign); // @[Test.scala 81:11:@1191.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"out.isZero is %b \n",multiply_io_out_isZero); // @[Test.scala 82:11:@1196.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"out.isInf is %b \n",multiply_io_out_isInf); // @[Test.scala 83:11:@1201.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"out.trailingBits is %b \n",trailingBits); // @[Test.scala 85:11:@1206.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"out.stickyBit is %b \n",stickyBit); // @[Test.scala 86:11:@1211.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"out.exponent is %b \n",multiply_io_out_exponent); // @[Test.scala 88:11:@1216.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"out.fraction is %b \n",multiply_io_out_fraction); // @[Test.scala 89:11:@1221.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"a is %b \n",aValue_bits); // @[Test.scala 91:11:@1226.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"b is %b \n",bValue_bits); // @[Test.scala 92:11:@1231.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13) begin
          $fwrite(32'h80000002,"out is %b \n",outputValue_bits); // @[Test.scala 93:11:@1236.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
