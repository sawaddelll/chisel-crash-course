// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTest.h for the primary calling header

#include "VTest.h"
#include "VTest__Syms.h"


//--------------------


void VTest::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VTest::eval\n"); );
    VTest__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
	VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
	_eval(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) {
	    // About to fail, so enable debug to see what's not settling.
	    // Note you must run make with OPT=-DVL_DEBUG for debug prints.
	    int __Vsaved_debug = Verilated::debug();
	    Verilated::debug(1);
	    __Vchange = _change_request(vlSymsp);
	    Verilated::debug(__Vsaved_debug);
	    VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't converge");
	} else {
	    __Vchange = _change_request(vlSymsp);
	}
    } while (VL_UNLIKELY(__Vchange));
}

void VTest::_eval_initial_loop(VTest__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
	_eval_settle(vlSymsp);
	_eval(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) {
	    // About to fail, so enable debug to see what's not settling.
	    // Note you must run make with OPT=-DVL_DEBUG for debug prints.
	    int __Vsaved_debug = Verilated::debug();
	    Verilated::debug(1);
	    __Vchange = _change_request(vlSymsp);
	    Verilated::debug(__Vsaved_debug);
	    VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't DC converge");
	} else {
	    __Vchange = _change_request(vlSymsp);
	}
    } while (VL_UNLIKELY(__Vchange));
}

//--------------------
// Internal Methods

VL_INLINE_OPT void VTest::_sequent__TOP__2(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_sequent__TOP__2\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at /home/samsow/myChisel/chisel-crash-course/PositMultiplyV1/sim/vout/Test.v:868
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"a.exponent is 01110 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"a.fraction is 0100 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"b.exponent is 01111 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"b.fraction is 0000 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"aPacked is 01100010 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"now testing decoding for packed a... \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"sign is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"isInf is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"isZero is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"exponent is 00010 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"fraction is 0100 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"\n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"bPacked is 01101000 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"now testing decoding for packed b... \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"sign is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"isInf is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"isZero is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"exponent is 00011 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"fraction is 0000 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"\n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"\n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"counting leading zeros of 001111 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"output is   2 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"\n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"out.sign is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"out.isZero is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"out.isInf is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"out.trailingBits is 00 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"out.stickyBit is 0 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"out.exponent is 10001 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"out.fraction is 0100 \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"outPacked is 01110101");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"\n \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"now testing packed to packed multiplication (end to end) \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"results: \n");
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"%b is the packed output \n",
		   8,vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits);
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"sign is %b \n",1,((0U 
						   != 
						   (0x7fU 
						    & (IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits))) 
						  & ((IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits) 
						     >> 7U)));
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"isInf is %b \n",1,(
						   ((IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits) 
						    >> 7U) 
						   & (0U 
						      == 
						      (0x7fU 
						       & (IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits)))));
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"isZero is %b \n",1,
		   ((~ ((IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits) 
			>> 7U)) & (0U == (0x7fU & (IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits)))));
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"exponent is %b \n",
		   5,((((0U == (0x7fU & (IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits)))
			 ? 0U : ((0x40U & (IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits))
				  ? (7U & ((4U & ((IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out) 
						  & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend)))
					    ? 4U : 
					   ((4U & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out))
					     ? (4U 
						| (3U 
						   & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend)))
					     : (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out))))
				  : (7U & ((IData)(6U) 
					   + (~ ((4U 
						  & ((IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out) 
						     & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend)))
						  ? 4U
						  : 
						 ((4U 
						   & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out))
						   ? 
						  (4U 
						   | (3U 
						      & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend)))
						   : (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out)))))))) 
		       << 1U) | (1U & (((0x1fU & (IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits)) 
					<< (7U & ((4U 
						   & ((IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out) 
						      & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend)))
						   ? 4U
						   : 
						  ((4U 
						    & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out))
						    ? 
						   (4U 
						    | (3U 
						       & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend)))
						    : (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out))))) 
				       >> 4U))));
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"fraction is %b \n",
		   4,(0xfU & ((0x1fU & (IData)(vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits)) 
			      << (7U & ((4U & ((IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out) 
					       & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend)))
					 ? 4U : ((4U 
						  & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out))
						  ? 
						 (4U 
						  | (3U 
						     & (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend)))
						  : (IData)(vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out)))))));
    }
    if (VL_UNLIKELY(((0x38U == (IData)(vlTOPp->Test__DOT__value)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"\n");
    }
    // ALWAYS at /home/samsow/myChisel/chisel-crash-course/PositMultiplyV1/sim/vout/Test.v:868
    vlTOPp->Test__DOT__value = ((IData)(vlTOPp->reset)
				 ? 0U : (IData)(vlTOPp->Test__DOT___T_24));
    vlTOPp->Test__DOT___T_24 = (0xffU & ((IData)(1U) 
					 + (IData)(vlTOPp->Test__DOT__value)));
}

void VTest::_eval(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_eval\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
	vlTOPp->_sequent__TOP__2(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
}

VL_INLINE_OPT QData VTest::_change_request(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_change_request\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData VTest::_change_request_1(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_change_request_1\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VTest::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clock & 0xfeU))) {
	Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
	Verilated::overWidthError("reset");}
}
#endif // VL_DEBUG
