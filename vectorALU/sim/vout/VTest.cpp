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

VL_INLINE_OPT void VTest::_sequent__TOP__1(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_sequent__TOP__1\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    if (VL_UNLIKELY(((0U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"passThrough \n");
    }
    if (VL_UNLIKELY((((0U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
		      & (1U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"add \n");
    }
    if (VL_UNLIKELY((((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_10) 
		      & (2U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"subtract \n");
    }
    if (VL_UNLIKELY((((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_16) 
		      & (3U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"and \n");
    }
    if (VL_UNLIKELY((((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_16) 
		      & (3U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"%b &\n%b = \n%b \n",
		   8,vlTOPp->Test__DOT__gen__DOT__aIn_0,
		   8,(IData)(vlTOPp->Test__DOT__gen__DOT__bIn_0),
		   8,vlTOPp->Test__DOT__alu__DOT__storedValue_0);
    }
    if (VL_UNLIKELY((((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_30) 
		      & (4U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"or \n");
    }
    if (VL_UNLIKELY((((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_30) 
		      & (4U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"%b |\n%b = \n%b \n",
		   8,vlTOPp->Test__DOT__gen__DOT__aIn_0,
		   8,(IData)(vlTOPp->Test__DOT__gen__DOT__bIn_0),
		   8,vlTOPp->Test__DOT__alu__DOT__storedValue_0);
    }
    if (VL_UNLIKELY((((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_48) 
		      & (5U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"xor \n");
    }
    if (VL_UNLIKELY((((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_48) 
		      & (5U == (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"%b ^\n%b = \n%b \n",
		   8,vlTOPp->Test__DOT__gen__DOT__aIn_0,
		   8,(IData)(vlTOPp->Test__DOT__gen__DOT__bIn_0),
		   8,vlTOPp->Test__DOT__alu__DOT__storedValue_0);
    }
    if (VL_UNLIKELY((((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_48) 
		      & (5U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U," \n");
    }
    if (VL_UNLIKELY(((((4U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
		       & (3U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		      & (5U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"a is Vec(%3#, %3#)\n",
		   8,vlTOPp->Test__DOT__gen__DOT__aIn_0,
		   8,(IData)(vlTOPp->Test__DOT__gen__DOT__aIn_1));
    }
    if (VL_UNLIKELY(((((4U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
		       & (3U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		      & (5U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"b is Vec(%3#, %3#)\n",
		   8,vlTOPp->Test__DOT__gen__DOT__bIn_0,
		   8,(IData)(vlTOPp->Test__DOT__gen__DOT__bIn_1));
    }
    if (VL_UNLIKELY(((((4U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
		       & (3U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		      & (5U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"y is Vec(%3#, %3#) \n",
		   8,vlTOPp->Test__DOT__alu__DOT__storedValue_0,
		   8,(IData)(vlTOPp->Test__DOT__alu__DOT__storedValue_1));
    }
    if (VL_UNLIKELY(((((4U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
		       & (3U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		      & (5U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
		     & (~ (IData)(vlTOPp->reset))))) {
	VL_FWRITEF(0x80000002U,"ovfl:%1# zero:%1# neg:%1# \n \n",
		   1,vlTOPp->Test__DOT__gen__DOT__ovflIn,
		   1,(1U & (~ ((0U != (IData)(vlTOPp->Test__DOT__alu__DOT__storedValue_0)) 
			       | (0U != (IData)(vlTOPp->Test__DOT__alu__DOT__storedValue_1))))),
		   1,(1U & (((IData)(vlTOPp->Test__DOT__alu__DOT__storedValue_0) 
			     | (IData)(vlTOPp->Test__DOT__alu__DOT__storedValue_1)) 
			    >> 7U)));
    }
    if (VL_UNLIKELY((1U & ((~ (((4U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
				& (3U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn))) 
			       & (5U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)))) 
			   & (~ (IData)(vlTOPp->reset)))))) {
	VL_FWRITEF(0x80000002U,"\n");
    }
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    if (vlTOPp->reset) {
	vlTOPp->Test__DOT__gen__DOT__value_2 = 0U;
    } else {
	if ((8U < (IData)(vlTOPp->Test__DOT__gen__DOT__value_1))) {
	    vlTOPp->Test__DOT__gen__DOT__value_2 = vlTOPp->Test__DOT__gen__DOT___T_90;
	}
    }
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    vlTOPp->Test__DOT__gen__DOT__aIn_1 = 0U;
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    vlTOPp->Test__DOT__gen__DOT__bIn_1 = 0U;
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:520
    vlTOPp->Test__DOT__alu__DOT__storedValue_1 = 0U;
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    vlTOPp->Test__DOT__gen__DOT__bIn_0 = vlTOPp->Test__DOT__gen_io_b_0;
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    vlTOPp->Test__DOT__gen__DOT__ctrlIn = ((IData)(vlTOPp->reset)
					    ? 0U : (IData)(vlTOPp->Test__DOT__value));
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    vlTOPp->Test__DOT__gen__DOT__aIn_0 = vlTOPp->Test__DOT__gen__DOT__value_1;
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:520
    vlTOPp->Test__DOT__alu__DOT__storedValue_0 = (0xffU 
						  & ((0U 
						      == (IData)(vlTOPp->Test__DOT__value))
						      ? (IData)(vlTOPp->Test__DOT__gen__DOT__value_1)
						      : 
						     ((1U 
						       == (IData)(vlTOPp->Test__DOT__value))
						       ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_106)
						       : 
						      ((2U 
							== (IData)(vlTOPp->Test__DOT__value))
						        ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_108)
						        : 
						       ((3U 
							 == (IData)(vlTOPp->Test__DOT__value))
							 ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_112)
							 : 
							((4U 
							  == (IData)(vlTOPp->Test__DOT__value))
							  ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_114)
							  : 
							 ((5U 
							   == (IData)(vlTOPp->Test__DOT__value))
							   ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_116)
							   : 0U)))))));
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    vlTOPp->Test__DOT__gen__DOT__ovflIn = ((~ (IData)(vlTOPp->reset)) 
					   & (((1U 
						& ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
						   >> 7U)) 
					       == (1U 
						   & ((IData)(vlTOPp->Test__DOT__gen_io_b_0) 
						      >> 7U))) 
					      & ((1U 
						  & (((0U 
						       == (IData)(vlTOPp->Test__DOT__value))
						       ? (IData)(vlTOPp->Test__DOT__gen__DOT__value_1)
						       : 
						      ((1U 
							== (IData)(vlTOPp->Test__DOT__value))
						        ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_106)
						        : 
						       ((2U 
							 == (IData)(vlTOPp->Test__DOT__value))
							 ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_108)
							 : 
							((3U 
							  == (IData)(vlTOPp->Test__DOT__value))
							  ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_112)
							  : 
							 ((4U 
							   == (IData)(vlTOPp->Test__DOT__value))
							   ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_114)
							   : 
							  ((5U 
							    == (IData)(vlTOPp->Test__DOT__value))
							    ? (IData)(vlTOPp->Test__DOT__alu__DOT___T_116)
							    : 0U)))))) 
						     >> 7U)) 
						 != 
						 (1U 
						  & ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
						     >> 7U)))));
    vlTOPp->Test__DOT__gen__DOT___T_90 = (0xffU & ((IData)(1U) 
						   + (IData)(vlTOPp->Test__DOT__gen__DOT__value_2)));
    vlTOPp->Test__DOT__gen__DOT___GEN_10 = ((0U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
					    & (1U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:663
    vlTOPp->Test__DOT__value = ((IData)(vlTOPp->reset)
				 ? 0U : ((IData)(vlTOPp->Test__DOT___T_9)
					  ? 0U : (IData)(vlTOPp->Test__DOT___T_12)));
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    if (vlTOPp->reset) {
	vlTOPp->Test__DOT__gen__DOT__value_1 = 0U;
    } else {
	if ((0U == (3U & VL_MODDIV_III(2, (IData)(vlTOPp->Test__DOT__gen__DOT__value), (IData)(2U))))) {
	    vlTOPp->Test__DOT__gen__DOT__value_1 = vlTOPp->Test__DOT__gen__DOT___T_81;
	}
    }
    vlTOPp->Test__DOT__gen__DOT___GEN_16 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_10) 
					    & (2U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__gen__DOT___GEN_30 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_16) 
					    & (3U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT___T_9 = (5U == (IData)(vlTOPp->Test__DOT__value));
    vlTOPp->Test__DOT___T_12 = (7U & ((IData)(1U) + (IData)(vlTOPp->Test__DOT__value)));
    // ALWAYS at /home/samsow/chisel-crash-course/alu/sim/vout/Test.v:181
    vlTOPp->Test__DOT__gen__DOT__value = ((IData)(vlTOPp->reset)
					   ? 0U : (IData)(vlTOPp->Test__DOT__gen__DOT___T_66));
    vlTOPp->Test__DOT__gen__DOT___T_81 = (0xffU & ((IData)(1U) 
						   + (IData)(vlTOPp->Test__DOT__gen__DOT__value_1)));
    vlTOPp->Test__DOT__gen_io_b_0 = ((8U < (IData)(vlTOPp->Test__DOT__gen__DOT__value_1))
				      ? (IData)(vlTOPp->Test__DOT__gen__DOT__value_2)
				      : 1U);
    vlTOPp->Test__DOT__gen__DOT___GEN_48 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_30) 
					    & (4U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__alu__DOT___T_106 = (0xffU & 
					   ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
					    + (IData)(vlTOPp->Test__DOT__gen_io_b_0)));
    vlTOPp->Test__DOT__alu__DOT___T_108 = (0x1ffU & 
					   ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
					    - (IData)(vlTOPp->Test__DOT__gen_io_b_0)));
    vlTOPp->Test__DOT__alu__DOT___T_112 = ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
					   & (IData)(vlTOPp->Test__DOT__gen_io_b_0));
    vlTOPp->Test__DOT__alu__DOT___T_114 = ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
					   | (IData)(vlTOPp->Test__DOT__gen_io_b_0));
    vlTOPp->Test__DOT__alu__DOT___T_116 = ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
					   ^ (IData)(vlTOPp->Test__DOT__gen_io_b_0));
    vlTOPp->Test__DOT__gen__DOT___T_66 = (3U & ((IData)(1U) 
						+ (IData)(vlTOPp->Test__DOT__gen__DOT__value)));
}

void VTest::_eval(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_eval\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
	vlTOPp->_sequent__TOP__1(vlSymsp);
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
