// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2014 by Wilson Snyder.

`define CHECK  text \
  multiline

Hello in t_preproc_psl.v

`ifdef NEVER
  not
`else
    yes
`endif

Multi `CHECK line

// Did we end up right?
Line: `__LINE__
