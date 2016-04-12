// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="BW_btbl_bitcount,hls_ip_2015_4,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=4.910000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=0,HLS_SYN_FF=2,HLS_SYN_LUT=49}" *)

module BW_btbl_bitcount (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in_r,
        mm,
        out_r,
        out_r_ap_vld,
        nn,
        ap_return
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 2'b1;
parameter    ap_ST_st2_fsm_1 = 2'b10;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv32_18 = 32'b11000;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_10 = 32'b10000;
parameter    ap_const_lv32_17 = 32'b10111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] in_r;
input  [31:0] mm;
output  [31:0] out_r;
output   out_r_ap_vld;
input  [31:0] nn;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_r_ap_vld;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm = 2'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_18;
wire   [7:0] bits_address0;
reg    bits_ce0;
wire   [3:0] bits_q0;
wire   [7:0] bits_address1;
reg    bits_ce1;
wire   [3:0] bits_q1;
wire   [7:0] bits_address2;
reg    bits_ce2;
wire   [3:0] bits_q2;
wire   [7:0] bits_address3;
reg    bits_ce3;
wire   [3:0] bits_q3;
wire   [63:0] tmp_1_fu_114_p1;
wire   [63:0] tmp_5_fu_129_p1;
wire   [63:0] tmp_9_fu_144_p1;
wire   [63:0] tmp_6_fu_159_p1;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_72;
wire   [7:0] tmp_fu_110_p1;
wire   [7:0] tmp_4_fu_119_p4;
wire   [7:0] tmp_8_fu_134_p4;
wire   [7:0] tmp_2_fu_149_p4;
wire   [4:0] tmp_2_cast_fu_164_p1;
wire   [4:0] tmp_6_cast_fu_168_p1;
wire   [4:0] tmp1_fu_180_p2;
wire   [4:0] tmp_cast_fu_172_p1;
wire   [4:0] tmp_13_cast_fu_176_p1;
wire   [4:0] tmp2_fu_190_p2;
wire   [5:0] tmp2_cast_fu_196_p1;
wire   [5:0] tmp1_cast_fu_186_p1;
wire   [5:0] tmp_s_fu_200_p2;
reg   [1:0] ap_NS_fsm;


BW_btbl_bitcount_bits #(
    .DataWidth( 4 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
bits_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .address0( bits_address0 ),
    .ce0( bits_ce0 ),
    .q0( bits_q0 ),
    .address1( bits_address1 ),
    .ce1( bits_ce1 ),
    .q1( bits_q1 ),
    .address2( bits_address2 ),
    .ce2( bits_ce2 ),
    .q2( bits_q2 ),
    .address3( bits_address3 ),
    .ce3( bits_ce3 ),
    .q3( bits_q3 )
);



always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (ap_sig_cseq_ST_st2_fsm_1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st2_fsm_1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_18) begin
    if (ap_sig_bdd_18) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_72) begin
    if (ap_sig_bdd_72) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        bits_ce0 = ap_const_logic_1;
    end else begin
        bits_ce0 = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        bits_ce1 = ap_const_logic_1;
    end else begin
        bits_ce1 = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        bits_ce2 = ap_const_logic_1;
    end else begin
        bits_ce2 = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        bits_ce3 = ap_const_logic_1;
    end else begin
        bits_ce3 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st2_fsm_1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        out_r_ap_vld = ap_const_logic_1;
    end else begin
        out_r_ap_vld = ap_const_logic_0;
    end
end
always @ (ap_start or ap_CS_fsm) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


assign ap_return = (mm + nn);


always @ (ap_CS_fsm) begin
    ap_sig_bdd_18 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_72 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

assign bits_address0 = tmp_1_fu_114_p1;

assign bits_address1 = tmp_5_fu_129_p1;

assign bits_address2 = tmp_9_fu_144_p1;

assign bits_address3 = tmp_6_fu_159_p1;

assign out_r = tmp_s_fu_200_p2;

assign tmp1_cast_fu_186_p1 = tmp1_fu_180_p2;

assign tmp1_fu_180_p2 = (tmp_2_cast_fu_164_p1 + tmp_6_cast_fu_168_p1);

assign tmp2_cast_fu_196_p1 = tmp2_fu_190_p2;

assign tmp2_fu_190_p2 = (tmp_cast_fu_172_p1 + tmp_13_cast_fu_176_p1);

assign tmp_13_cast_fu_176_p1 = bits_q3;

assign tmp_1_fu_114_p1 = tmp_fu_110_p1;

assign tmp_2_cast_fu_164_p1 = bits_q0;

assign tmp_2_fu_149_p4 = {{in_r[ap_const_lv32_17 : ap_const_lv32_10]}};

assign tmp_4_fu_119_p4 = {{in_r[ap_const_lv32_F : ap_const_lv32_8]}};

assign tmp_5_fu_129_p1 = tmp_4_fu_119_p4;

assign tmp_6_cast_fu_168_p1 = bits_q1;

assign tmp_6_fu_159_p1 = tmp_2_fu_149_p4;

assign tmp_8_fu_134_p4 = {{in_r[ap_const_lv32_1F : ap_const_lv32_18]}};

assign tmp_9_fu_144_p1 = tmp_8_fu_134_p4;

assign tmp_cast_fu_172_p1 = bits_q2;

assign tmp_fu_110_p1 = in_r[7:0];

assign tmp_s_fu_200_p2 = (tmp2_cast_fu_196_p1 + tmp1_cast_fu_186_p1);


endmodule //BW_btbl_bitcount

