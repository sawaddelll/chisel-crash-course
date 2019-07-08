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
    // INITIAL at /home/samsow/myChisel/chisel-crash-course/vectorALU/sim/vout/Test.v:503
    vlTOPp->Test__DOT__alu__DOT___RAND_0 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__alu__DOT__storedValue_0 = (0xffU 
						  & vlTOPp->Test__DOT__alu__DOT___RAND_0);
    vlTOPp->Test__DOT__alu__DOT___RAND_1 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__alu__DOT__storedValue_1 = (0xffU 
						  & vlTOPp->Test__DOT__alu__DOT___RAND_1);
    // INITIAL at /home/samsow/myChisel/chisel-crash-course/vectorALU/sim/vout/Test.v:650
    vlTOPp->Test__DOT___RAND_0 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__value = (7U & vlTOPp->Test__DOT___RAND_0);
    // INITIAL at /home/samsow/myChisel/chisel-crash-course/vectorALU/sim/vout/Test.v:136
    vlTOPp->Test__DOT__gen__DOT___RAND_0 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__value = (3U & vlTOPp->Test__DOT__gen__DOT___RAND_0);
    vlTOPp->Test__DOT__gen__DOT___RAND_1 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__value_1 = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_1);
    vlTOPp->Test__DOT__gen__DOT___RAND_2 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__value_2 = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_2);
    vlTOPp->Test__DOT__gen__DOT___RAND_3 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__aIn_0 = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_3);
    vlTOPp->Test__DOT__gen__DOT___RAND_4 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__aIn_1 = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_4);
    vlTOPp->Test__DOT__gen__DOT___RAND_5 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__bIn_0 = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_5);
    vlTOPp->Test__DOT__gen__DOT___RAND_6 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__bIn_1 = (0xffU & vlTOPp->Test__DOT__gen__DOT___RAND_6);
    vlTOPp->Test__DOT__gen__DOT___RAND_7 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__ovflIn = (1U & vlTOPp->Test__DOT__gen__DOT___RAND_7);
    vlTOPp->Test__DOT__gen__DOT___RAND_8 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__gen__DOT__ctrlIn = (7U & vlTOPp->Test__DOT__gen__DOT___RAND_8);
}

void VTest::_settle__TOP__3(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_settle__TOP__3\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Test__DOT___T_9 = (5U == (IData)(vlTOPp->Test__DOT__value));
    vlTOPp->Test__DOT___T_12 = (7U & ((IData)(1U) + (IData)(vlTOPp->Test__DOT__value)));
    vlTOPp->Test__DOT__gen__DOT___T_90 = (0xffU & ((IData)(1U) 
						   + (IData)(vlTOPp->Test__DOT__gen__DOT__value_2)));
    vlTOPp->Test__DOT__gen__DOT___T_81 = (0xffU & ((IData)(1U) 
						   + (IData)(vlTOPp->Test__DOT__gen__DOT__value_1)));
    vlTOPp->Test__DOT__gen_io_b_0 = ((8U < (IData)(vlTOPp->Test__DOT__gen__DOT__value_1))
				      ? (IData)(vlTOPp->Test__DOT__gen__DOT__value_2)
				      : 1U);
    vlTOPp->Test__DOT__gen__DOT___GEN_10 = ((0U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)) 
					    & (1U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__gen__DOT___T_66 = (3U & ((IData)(1U) 
						+ (IData)(vlTOPp->Test__DOT__gen__DOT__value)));
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
    vlTOPp->Test__DOT__gen__DOT___GEN_16 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_10) 
					    & (2U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__gen__DOT___GEN_30 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_16) 
					    & (3U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
    vlTOPp->Test__DOT__gen__DOT___GEN_48 = ((IData)(vlTOPp->Test__DOT__gen__DOT___GEN_30) 
					    & (4U != (IData)(vlTOPp->Test__DOT__gen__DOT__ctrlIn)));
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
    Test__DOT__gen_io_b_0 = VL_RAND_RESET_I(8);
    Test__DOT__value = VL_RAND_RESET_I(3);
    Test__DOT___RAND_0 = VL_RAND_RESET_I(32);
    Test__DOT___T_9 = VL_RAND_RESET_I(1);
    Test__DOT___T_12 = VL_RAND_RESET_I(3);
    Test__DOT__gen__DOT__value = VL_RAND_RESET_I(2);
    Test__DOT__gen__DOT___RAND_0 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT___T_66 = VL_RAND_RESET_I(2);
    Test__DOT__gen__DOT__value_1 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_1 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT___T_81 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT__value_2 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_2 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT___T_90 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT__aIn_0 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_3 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__aIn_1 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_4 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__bIn_0 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_5 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__bIn_1 = VL_RAND_RESET_I(8);
    Test__DOT__gen__DOT___RAND_6 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__ovflIn = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___RAND_7 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT__ctrlIn = VL_RAND_RESET_I(3);
    Test__DOT__gen__DOT___RAND_8 = VL_RAND_RESET_I(32);
    Test__DOT__gen__DOT___GEN_10 = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___GEN_16 = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___GEN_30 = VL_RAND_RESET_I(1);
    Test__DOT__gen__DOT___GEN_48 = VL_RAND_RESET_I(1);
    Test__DOT__alu__DOT__storedValue_0 = VL_RAND_RESET_I(8);
    Test__DOT__alu__DOT___RAND_0 = VL_RAND_RESET_I(32);
    Test__DOT__alu__DOT__storedValue_1 = VL_RAND_RESET_I(8);
    Test__DOT__alu__DOT___RAND_1 = VL_RAND_RESET_I(32);
    Test__DOT__alu__DOT___T_106 = VL_RAND_RESET_I(8);
    Test__DOT__alu__DOT___T_108 = VL_RAND_RESET_I(9);
    Test__DOT__alu__DOT___T_112 = VL_RAND_RESET_I(8);
    Test__DOT__alu__DOT___T_114 = VL_RAND_RESET_I(8);
    Test__DOT__alu__DOT___T_116 = VL_RAND_RESET_I(8);
}
