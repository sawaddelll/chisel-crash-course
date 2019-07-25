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

void VTest::_settle__TOP__1(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_settle__TOP__1\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Test__DOT__endToEndTest__DOT__encode_io_out_bits = 0x7fU;
    vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend = 2U;
    vlTOPp->Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out = 4U;
}

void VTest::_initial__TOP__3(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_initial__TOP__3\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // INITIAL at /home/samsow/myChisel/chisel-crash-course/PositMultiplyV1/sim/vout/Test.v:855
    vlTOPp->Test__DOT___RAND_0 = VL_RANDOM_I(32);
    vlTOPp->Test__DOT__value = (0xffU & vlTOPp->Test__DOT___RAND_0);
}

void VTest::_settle__TOP__4(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_settle__TOP__4\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Test__DOT___T_24 = (0xffU & ((IData)(1U) 
					 + (IData)(vlTOPp->Test__DOT__value)));
}

void VTest::_eval_initial(VTest__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_eval_initial\n"); );
    VTest* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
    vlTOPp->_initial__TOP__3(vlSymsp);
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
    vlTOPp->_settle__TOP__1(vlSymsp);
    vlTOPp->_settle__TOP__4(vlSymsp);
}

void VTest::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTest::_ctor_var_reset\n"); );
    // Body
    clock = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    Test__DOT__value = VL_RAND_RESET_I(8);
    Test__DOT___RAND_0 = VL_RAND_RESET_I(32);
    Test__DOT___T_24 = VL_RAND_RESET_I(8);
    Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__CountLeadingZerosTree_io_out = VL_RAND_RESET_I(3);
    Test__DOT__decodeTestC__DOT__countingLeadingZeros__DOT__tree__DOT__rCountExtend = VL_RAND_RESET_I(3);
    Test__DOT__endToEndTest__DOT__encode_io_out_bits = VL_RAND_RESET_I(8);
}
