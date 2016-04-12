// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1 ns / 1 ps

module encode_mul_11s_32s_42_3_Mul3S_12(clk, ce, a, b, p);
input clk;
input ce;
input[11 - 1 : 0] a; // synthesis attribute keep a "true"
input[32 - 1 : 0] b; // synthesis attribute keep b "true"
output[42 - 1 : 0] p;

reg signed [11 - 1 : 0] a_reg0;
reg signed [32 - 1 : 0] b_reg0;
wire signed [42 - 1 : 0] tmp_product;
reg signed [42 - 1 : 0] buff0;

assign p = buff0;
assign tmp_product = a_reg0 * b_reg0;
always @ (posedge clk) begin
    if (ce) begin
        a_reg0 <= a;
        b_reg0 <= b;
        buff0 <= tmp_product;
    end
end
endmodule

`timescale 1 ns / 1 ps
module encode_mul_11s_32s_42_3(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



encode_mul_11s_32s_42_3_Mul3S_12 encode_mul_11s_32s_42_3_Mul3S_12_U(
    .clk( clk ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

