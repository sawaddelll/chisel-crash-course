// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header

#ifndef _VTest__Syms_H_
#define _VTest__Syms_H_

#include "verilated_heavy.h"

// INCLUDE MODULE CLASSES
#include "VTest.h"

// SYMS CLASS
class VTest__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_didInit;
    
    // SUBCELL STATE
    VTest*                         TOPp;
    
    // CREATORS
    VTest__Syms(VTest* topp, const char* namep);
    ~VTest__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    
} VL_ATTR_ALIGNED(64);

#endif // guard
