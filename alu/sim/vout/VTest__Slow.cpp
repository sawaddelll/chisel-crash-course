// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTest.h for the primary calling header

#include "VTest.h"
#include "VTest__Syms.h"


//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(VTest) {
    VTest__Syms* __restrict vlSymsp = __VlSymsp = new VTest__Syms(this, name());
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VTest::__Vconfigure(VTest__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

VTest::~VTest() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------
// Internal Methods

void VTest::_initial__TOP__2(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_initial__TOP__2\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // INITIAL at /home/samsow/myChisel/chisel-crash-course/alu/sim/vout/Test.v:473
    vlTOPp->Test__DOT__alu__DOT___RAND_0 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__alu__DOT__storedValue = (0xffU 
						& vlTOPp->Test__DOT__alu__DOT___RAND_0);
    // INITIAL at /home/samsow/myChisel/chisel-crash-course/alu/sim/vout/Test.v:578
    vlTOPp->Test__DOT___RAND_0 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__value = (7U & vlTOPp->Test__DOT___RAND_0);
    // INITIAL at /home/samsow/myChisel/chisel-crash-course/alu/sim/vout/Test.v:134
    vlTOPp->Test__DOT__gen__DOT___RAND_0 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__value = (3U & vlTOPp->Test__DOT__gen__DOT___RAND_0);
    vlTOPp->Test__DOT__gen__DOT___RAND_1 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__value_1 = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_1);
    vlTOPp->Test__DOT__gen__DOT___RAND_2 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__value_2 = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_2);
    vlTOPp->Test__DOT__gen__DOT___RAND_3 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__aIn = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_3);
    vlTOPp->Test__DOT__gen__DOT___RAND_4 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__bIn = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_4);
    vlTOPp->Test__DOT__gen__DOT___RAND_5 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__prodIn = (0xffffU 
					   & vlTOPp->Test__DOT__gen__DOT___RAND_5);
    vlTOPp->Test__DOT__gen__DOT___RAND_6 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__ovflIn = (1U & vlTOPp->Test__DOT__gen__DOT___RAND_6);
    vlTOPp->Test__DOT__gen__DOT___RAND_7 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__ctrlIn = (7U & vlTOPp->Test__DOT__gen__DOT___RAND_7);
}

void VTest::_settle__TOP__3(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_settle__TOP__3\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Test__DOT___T_12 = (7U & ((IData)(1U) + (IData)(vlTOPp->Test__DOT__value)));
    vlTOPp->Test__DOT__gen__DOT___T_52 = (0xffU & ((IData)(1U) 
						   + (IData)(vlTOPp->Test__DOT__gen__DOT__value_2)));
    vlTOPp->Test__DOT__gen__DOT___T_43 = (0xffU & ((IData)(1U) 
						   + (IData)(vlTOPp->Test__DOT__gen__DOT__value_1)));
    vlTOPp->Test__DOT__gen_io_b = ((8U < (IData)(vlTOPp->Test__DOT__gen__DOT__value_1))
				    ? (IData)(vlTOPp->Test__DOT__gen__DOT__value_2)
				    : 1U);
    vlTOPp->Test__DOT__gen__DOT___GEN_10 = ((0U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
					    & (1U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__gen__DOT___T_28 = (3U & ((IData)(1U) 
						+ (IData)(vlTOPp->Test__DOT__gen__DOT__value)));
    vlTOPp->Test__DOT__alu_io_product = (0xffffU & 
					 ((0U == (IData)(vlTOPp->Test__DOT__value))
					   ? 0U : (
						   (1U 
						    == (IData)(vlTOPp->Test__DOT__value))
						    ? 0U
						    : 
						   ((2U 
						     == (IData)(vlTOPp->Test__DOT__value))
						     ? 0U
						     : 
						    ((3U 
						      == (IData)(vlTOPp->Test__DOT__value))
						      ? 
						     ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
						      * (IData)(vlTOPp->Test__DOT__gen_io_b))
						      : 0U)))));
    vlTOPp->Test__DOT__gen__DOT___GEN_16 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_10) 
					    & (2U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__alu__DOT___GEN_10 = ((0U == (IData)(vlTOPp->Test__DOT__value))
					     ? (IData)(vlTOPp->Test__DOT__gen__DOT__value_1)
					     : ((1U 
						 == (IData)(vlTOPp->Test__DOT__value))
						 ? 
						(0xffU 
						 & ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
						    + (IData)(vlTOPp->Test__DOT__gen_io_b)))
						 : 
						((2U 
						  == (IData)(vlTOPp->Test__DOT__value))
						  ? 
						 (0xffU 
						  & ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
						     - (IData)(vlTOPp->Test__DOT__gen_io_b)))
						  : 
						 ((3U 
						   == (IData)(vlTOPp->Test__DOT__value))
						   ? (IData)(vlTOPp->Test__DOT__alu_io_product)
						   : 
						  (0xffU 
						   & ((4U 
						       == (IData)(vlTOPp->Test__DOT__value))
						       ? 
						      VL_DIV_III(8, (IData)(vlTOPp->Test__DOT__gen__DOT__value_1), (IData)(vlTOPp->Test__DOT__gen_io_b))
						       : 
						      ((5U 
							== (IData)(vlTOPp->Test__DOT__value))
						        ? 
						       ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
							& (IData)(vlTOPp->Test__DOT__gen_io_b))
						        : 
						       ((6U 
							 == (IData)(vlTOPp->Test__DOT__value))
							 ? 
							((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
							 | (IData)(vlTOPp->Test__DOT__gen_io_b))
							 : 
							((7U 
							  == (IData)(vlTOPp->Test__DOT__value))
							  ? 
							 ((IData)(vlTOPp->Test__DOT__gen__DOT__value_1) 
							  ^ (IData)(vlTOPp->Test__DOT__gen_io_b))
							  : 0U)))))))));
    vlTOPp->Test__DOT__gen__DOT___GEN_24 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_16) 
					    & (3U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__gen__DOT___GEN_34 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_24) 
					    & (4U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__gen__DOT___GEN_56 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_34) 
					    & (5U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__gen__DOT___GEN_82 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_56) 
					    & (6U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
}

void VTest::_eval_initial(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_eval_initial\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
    vlTOPp->_initial__TOP__2(vlSymsp);
}

void VTest::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::final\n"); );
    // Variables
    VTest__Syms* __restrict vlSymsp = this->__VlSymsp;
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VTest::_eval_settle(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_eval_settle\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__3(vlSymsp);
}

void VTest::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_ctor_var_reset\n"); );
    // Body
    clock = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    Test__DOT__gen_io_b = VL_RAND_RESET_I(8);
    Test__DOT__alu_io_product = VL_RAND_RESET_I(16);
    Test__DOT__value = VL_RAND_RESET_I(3);
    Test__DOT___RAND_0 = VL_RAND_RESET_I(32);
    Test__DOT___T_12 = VL_RAND_RESET_I(3);
    Test__DOT__gen__DOT__value = VL_RAND_RESET_I(2);
    Test__DOT__gen__DOT___RAND_0 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT___T_28 = VL_RAND_RESET_I(2);
    Test__DOT__gen__DOT__value_1 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_1 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT___T_43 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT__value_2 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_2 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT___T_52 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT__aIn = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_3 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__bIn = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_4 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__prodIn = VL_RAND_RESET_I(16);
    Test__DOT__gen__DOT___RAND_5 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__ovflIn = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___RAND_6 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__ctrlIn = VL_RAND_RESET_I(3);
    Test__DOT__gen__DOT___RAND_7 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT___GEN_10 = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___GEN_16 = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___GEN_24 = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___GEN_34 = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___GEN_56 = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___GEN_82 = VL_RAND_RESET_I(1);
    Test__DOT__alu__DOT__storedValue = VL_RAND_RESET_I(8);
    Test__DOT__alu__DOT___RAND_0 = VL_RAND_RESET_I(32);
    Test__DOT__alu__DOT___GEN_10 = VL_RAND_RESET_I(16);
}
