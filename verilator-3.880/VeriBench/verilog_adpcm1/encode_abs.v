// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module encode_abs (
        n,
        ap_return
);

parameter    ap_true = 1'b1;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;

input  [31:0] n;
output  [31:0] ap_return;

wire   [0:0] tmp_fu_22_p3;
wire   [31:0] m_fu_30_p2;




assign ap_return = ((tmp_fu_22_p3[0:0] === 1'b1) ? m_fu_30_p2 : n);

assign m_fu_30_p2 = (ap_const_lv32_0 - n);

assign tmp_fu_22_p3 = n[ap_const_lv32_1F];


endmodule //encode_abs
