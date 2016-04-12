// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module encrypt_AddRoundKey (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        statemt_address0,
        statemt_ce0,
        statemt_we0,
        statemt_d0,
        statemt_q0,
        statemt_address1,
        statemt_ce1,
        statemt_we1,
        statemt_d1,
        statemt_q1,
        type_r,
        n,
        word_address0,
        word_ce0,
        word_q0,
        word_address1,
        word_ce1,
        word_q1
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 8'b1;
parameter    ap_ST_st2_fsm_1 = 8'b10;
parameter    ap_ST_st3_fsm_2 = 8'b100;
parameter    ap_ST_st4_fsm_3 = 8'b1000;
parameter    ap_ST_st5_fsm_4 = 8'b10000;
parameter    ap_ST_st6_fsm_5 = 8'b100000;
parameter    ap_ST_st7_fsm_6 = 8'b1000000;
parameter    ap_ST_st8_fsm_7 = 8'b10000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_1F4C0 = 32'b11111010011000000;
parameter    ap_const_lv32_2EEC0 = 32'b101110111011000000;
parameter    ap_const_lv32_3E8C0 = 32'b111110100011000000;
parameter    ap_const_lv32_1F480 = 32'b11111010010000000;
parameter    ap_const_lv32_2EE80 = 32'b101110111010000000;
parameter    ap_const_lv32_3E880 = 32'b111110100010000000;
parameter    ap_const_lv4_4 = 4'b100;
parameter    ap_const_lv4_6 = 4'b110;
parameter    ap_const_lv4_8 = 4'b1000;
parameter    ap_const_lv4_1 = 4'b1;
parameter    ap_const_lv10_78 = 10'b1111000;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv5_1 = 5'b1;
parameter    ap_const_lv10_F0 = 10'b11110000;
parameter    ap_const_lv10_168 = 10'b101101000;
parameter    ap_const_lv5_2 = 5'b10;
parameter    ap_const_lv5_3 = 5'b11;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [6:0] statemt_address0;
output   statemt_ce0;
output   statemt_we0;
output  [31:0] statemt_d0;
input  [31:0] statemt_q0;
output  [6:0] statemt_address1;
output   statemt_ce1;
output   statemt_we1;
output  [31:0] statemt_d1;
input  [31:0] statemt_q1;
input  [31:0] type_r;
input  [31:0] n;
output  [8:0] word_address0;
output   word_ce0;
input  [31:0] word_q0;
output  [8:0] word_address1;
output   word_ce1;
input  [31:0] word_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[6:0] statemt_address0;
reg statemt_ce0;
reg statemt_we0;
reg[6:0] statemt_address1;
reg statemt_ce1;
reg statemt_we1;
reg[8:0] word_address0;
reg word_ce0;
reg[8:0] word_address1;
reg word_ce1;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm = 8'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_26;
wire   [31:0] grp_fu_157_p2;
reg   [31:0] reg_169;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_bdd_62;
reg    ap_sig_cseq_ST_st7_fsm_6;
reg    ap_sig_bdd_69;
wire   [31:0] grp_fu_163_p2;
reg   [31:0] reg_174;
wire   [3:0] sel_tmp1_cast_fu_239_p3;
reg   [3:0] sel_tmp1_cast_reg_377;
wire   [0:0] tmp_17_fu_247_p2;
reg   [0:0] tmp_17_reg_382;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_88;
wire   [3:0] nb_1_fu_253_p3;
reg   [3:0] nb_1_reg_392;
wire   [31:0] grp_fu_263_p2;
reg   [31:0] tmp_reg_402;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_bdd_101;
wire   [3:0] j_6_fu_278_p2;
reg   [3:0] j_6_reg_410;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_bdd_110;
wire   [9:0] tmp_132_fu_294_p1;
reg   [9:0] tmp_132_reg_415;
wire   [0:0] exitcond_fu_273_p2;
wire   [4:0] tmp_62_fu_313_p3;
reg   [4:0] tmp_62_reg_431;
reg   [6:0] statemt_addr_reg_437;
reg   [6:0] statemt_addr_77_reg_442;
reg   [6:0] statemt_addr_78_reg_457;
reg   [6:0] statemt_addr_79_reg_462;
reg   [3:0] j_reg_146;
reg    ap_sig_cseq_ST_st8_fsm_7;
reg    ap_sig_bdd_144;
wire  signed [63:0] tmp_61_fu_289_p1;
wire  signed [63:0] tmp_195_cast_fu_304_p1;
wire   [63:0] tmp_63_fu_321_p1;
wire   [63:0] tmp_66_fu_332_p1;
wire  signed [63:0] tmp_196_cast_fu_342_p1;
wire  signed [63:0] tmp_197_cast_fu_352_p1;
wire   [63:0] tmp_69_fu_362_p1;
wire   [63:0] tmp_72_fu_372_p1;
wire   [0:0] sel_tmp7_fu_185_p2;
wire   [0:0] sel_tmp8_fu_191_p2;
wire   [0:0] tmp15_fu_197_p2;
wire   [0:0] sel_tmp6_fu_179_p2;
wire   [0:0] sel_tmp4_fu_215_p2;
wire   [0:0] sel_tmp5_fu_221_p2;
wire   [0:0] tmp16_fu_227_p2;
wire   [0:0] sel_tmp3_fu_209_p2;
wire   [0:0] sel_tmp9_fu_233_p2;
wire   [0:0] sel_tmp_fu_203_p2;
wire   [3:0] grp_fu_263_p1;
wire   [31:0] j_cast1_fu_269_p1;
wire   [31:0] tmp_s_fu_284_p2;
wire   [9:0] tmp_194_fu_298_p2;
wire   [2:0] tmp_133_fu_309_p1;
wire   [4:0] tmp_65_fu_326_p2;
wire   [9:0] tmp_195_fu_337_p2;
wire   [9:0] tmp_196_fu_347_p2;
wire   [4:0] tmp_68_fu_357_p2;
wire   [4:0] tmp_71_fu_367_p2;
wire    grp_fu_263_ce;
reg   [7:0] ap_NS_fsm;
wire   [31:0] grp_fu_263_p10;


encrypt_mul_32s_4ns_32_3 #(
    .ID( 1 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 4 ),
    .dout_WIDTH( 32 ))
encrypt_mul_32s_4ns_32_3_U10(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( n ),
    .din1( grp_fu_263_p1 ),
    .ce( grp_fu_263_ce ),
    .dout( grp_fu_263_p2 )
);



always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        j_reg_146 <= j_6_reg_410;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        j_reg_146 <= ap_const_lv4_0;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        j_6_reg_410 <= j_6_fu_278_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        nb_1_reg_392[3 : 1] <= nb_1_fu_253_p3[3 : 1];
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) | (ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6))) begin
        reg_169 <= grp_fu_157_p2;
        reg_174 <= grp_fu_163_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        sel_tmp1_cast_reg_377[1] <= sel_tmp1_cast_fu_239_p3[1];
        tmp_17_reg_382 <= tmp_17_fu_247_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) & (exitcond_fu_273_p2 == ap_const_lv1_0))) begin
        statemt_addr_77_reg_442[4 : 2] <= tmp_66_fu_332_p1[4 : 2];
        statemt_addr_reg_437[4 : 2] <= tmp_63_fu_321_p1[4 : 2];
        tmp_132_reg_415 <= tmp_132_fu_294_p1;
        tmp_62_reg_431[4 : 2] <= tmp_62_fu_313_p3[4 : 2];
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        statemt_addr_78_reg_457[4 : 2] <= tmp_69_fu_362_p1[4 : 2];
        statemt_addr_79_reg_462[4 : 2] <= tmp_72_fu_372_p1[4 : 2];
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        tmp_reg_402 <= grp_fu_263_p2;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0 or ap_sig_cseq_ST_st5_fsm_4 or exitcond_fu_273_p2) begin
    if (((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) & ~(exitcond_fu_273_p2 == ap_const_lv1_0)))) begin
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

always @ (ap_sig_cseq_ST_st5_fsm_4 or exitcond_fu_273_p2) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) & ~(exitcond_fu_273_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_26) begin
    if (ap_sig_bdd_26) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_88) begin
    if (ap_sig_bdd_88) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_101) begin
    if (ap_sig_bdd_101) begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_110) begin
    if (ap_sig_bdd_110) begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_62) begin
    if (ap_sig_bdd_62) begin
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_69) begin
    if (ap_sig_bdd_69) begin
        ap_sig_cseq_ST_st7_fsm_6 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st7_fsm_6 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_144) begin
    if (ap_sig_bdd_144) begin
        ap_sig_cseq_ST_st8_fsm_7 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st8_fsm_7 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st5_fsm_4 or statemt_addr_reg_437 or statemt_addr_78_reg_457 or ap_sig_cseq_ST_st8_fsm_7 or tmp_63_fu_321_p1 or tmp_69_fu_362_p1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        statemt_address0 = statemt_addr_78_reg_457;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        statemt_address0 = statemt_addr_reg_437;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        statemt_address0 = tmp_69_fu_362_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        statemt_address0 = tmp_63_fu_321_p1;
    end else begin
        statemt_address0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st5_fsm_4 or statemt_addr_77_reg_442 or statemt_addr_79_reg_462 or ap_sig_cseq_ST_st8_fsm_7 or tmp_66_fu_332_p1 or tmp_72_fu_372_p1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        statemt_address1 = statemt_addr_79_reg_462;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        statemt_address1 = statemt_addr_77_reg_442;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        statemt_address1 = tmp_72_fu_372_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        statemt_address1 = tmp_66_fu_332_p1;
    end else begin
        statemt_address1 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st5_fsm_4 or ap_sig_cseq_ST_st8_fsm_7) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) | (ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6) | (ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) | (ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7))) begin
        statemt_ce0 = ap_const_logic_1;
    end else begin
        statemt_ce0 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st5_fsm_4 or ap_sig_cseq_ST_st8_fsm_7) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) | (ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6) | (ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) | (ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7))) begin
        statemt_ce1 = ap_const_logic_1;
    end else begin
        statemt_ce1 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st8_fsm_7) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6) | (ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7))) begin
        statemt_we0 = ap_const_logic_1;
    end else begin
        statemt_we0 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st8_fsm_7) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6) | (ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7))) begin
        statemt_we1 = ap_const_logic_1;
    end else begin
        statemt_we1 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5 or ap_sig_cseq_ST_st5_fsm_4 or tmp_61_fu_289_p1 or tmp_196_cast_fu_342_p1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        word_address0 = tmp_196_cast_fu_342_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        word_address0 = tmp_61_fu_289_p1;
    end else begin
        word_address0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5 or ap_sig_cseq_ST_st5_fsm_4 or tmp_195_cast_fu_304_p1 or tmp_197_cast_fu_352_p1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        word_address1 = tmp_197_cast_fu_352_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        word_address1 = tmp_195_cast_fu_304_p1;
    end else begin
        word_address1 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5 or ap_sig_cseq_ST_st5_fsm_4) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) | (ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4))) begin
        word_ce0 = ap_const_logic_1;
    end else begin
        word_ce0 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5 or ap_sig_cseq_ST_st5_fsm_4) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) | (ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4))) begin
        word_ce1 = ap_const_logic_1;
    end else begin
        word_ce1 = ap_const_logic_0;
    end
end
always @ (ap_start or ap_CS_fsm or exitcond_fu_273_p2) begin
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
            ap_NS_fsm = ap_ST_st3_fsm_2;
        end
        ap_ST_st3_fsm_2 : 
        begin
            ap_NS_fsm = ap_ST_st4_fsm_3;
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        ap_ST_st5_fsm_4 : 
        begin
            if (~(exitcond_fu_273_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end
        end
        ap_ST_st6_fsm_5 : 
        begin
            ap_NS_fsm = ap_ST_st7_fsm_6;
        end
        ap_ST_st7_fsm_6 : 
        begin
            ap_NS_fsm = ap_ST_st8_fsm_7;
        end
        ap_ST_st8_fsm_7 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end



always @ (ap_CS_fsm) begin
    ap_sig_bdd_101 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_110 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_4]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_144 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_7]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_26 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_62 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_5]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_69 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_6]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_88 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

assign exitcond_fu_273_p2 = (j_reg_146 == nb_1_reg_392? 1'b1: 1'b0);

assign grp_fu_157_p2 = (statemt_q0 ^ word_q0);

assign grp_fu_163_p2 = (statemt_q1 ^ word_q1);

assign grp_fu_263_ce = ap_const_logic_1;

assign grp_fu_263_p1 = grp_fu_263_p10;

assign grp_fu_263_p10 = nb_1_fu_253_p3;

assign j_6_fu_278_p2 = (j_reg_146 + ap_const_lv4_1);

assign j_cast1_fu_269_p1 = j_reg_146;

assign nb_1_fu_253_p3 = ((tmp_17_reg_382[0:0] === 1'b1) ? sel_tmp1_cast_reg_377 : ap_const_lv4_8);

assign sel_tmp1_cast_fu_239_p3 = ((sel_tmp9_fu_233_p2[0:0] === 1'b1) ? ap_const_lv4_4 : ap_const_lv4_6);

assign sel_tmp3_fu_209_p2 = (type_r == ap_const_lv32_1F480? 1'b1: 1'b0);

assign sel_tmp4_fu_215_p2 = (type_r == ap_const_lv32_2EE80? 1'b1: 1'b0);

assign sel_tmp5_fu_221_p2 = (type_r == ap_const_lv32_3E880? 1'b1: 1'b0);

assign sel_tmp6_fu_179_p2 = (type_r == ap_const_lv32_1F4C0? 1'b1: 1'b0);

assign sel_tmp7_fu_185_p2 = (type_r == ap_const_lv32_2EEC0? 1'b1: 1'b0);

assign sel_tmp8_fu_191_p2 = (type_r == ap_const_lv32_3E8C0? 1'b1: 1'b0);

assign sel_tmp9_fu_233_p2 = (tmp16_fu_227_p2 | sel_tmp3_fu_209_p2);

assign sel_tmp_fu_203_p2 = (tmp15_fu_197_p2 | sel_tmp6_fu_179_p2);

assign statemt_d0 = reg_169;

assign statemt_d1 = reg_174;

assign tmp15_fu_197_p2 = (sel_tmp7_fu_185_p2 | sel_tmp8_fu_191_p2);

assign tmp16_fu_227_p2 = (sel_tmp4_fu_215_p2 | sel_tmp5_fu_221_p2);

assign tmp_132_fu_294_p1 = tmp_s_fu_284_p2[9:0];

assign tmp_133_fu_309_p1 = j_reg_146[2:0];

assign tmp_17_fu_247_p2 = (sel_tmp9_fu_233_p2 | sel_tmp_fu_203_p2);

assign tmp_194_fu_298_p2 = (ap_const_lv10_78 + tmp_132_fu_294_p1);

assign tmp_195_cast_fu_304_p1 = $signed(tmp_194_fu_298_p2);

assign tmp_195_fu_337_p2 = (ap_const_lv10_F0 + tmp_132_reg_415);

assign tmp_196_cast_fu_342_p1 = $signed(tmp_195_fu_337_p2);

assign tmp_196_fu_347_p2 = (ap_const_lv10_168 + tmp_132_reg_415);

assign tmp_197_cast_fu_352_p1 = $signed(tmp_196_fu_347_p2);

assign tmp_61_fu_289_p1 = $signed(tmp_s_fu_284_p2);

assign tmp_62_fu_313_p3 = {{tmp_133_fu_309_p1}, {ap_const_lv2_0}};

assign tmp_63_fu_321_p1 = tmp_62_fu_313_p3;

assign tmp_65_fu_326_p2 = (tmp_62_fu_313_p3 | ap_const_lv5_1);

assign tmp_66_fu_332_p1 = tmp_65_fu_326_p2;

assign tmp_68_fu_357_p2 = (tmp_62_reg_431 | ap_const_lv5_2);

assign tmp_69_fu_362_p1 = tmp_68_fu_357_p2;

assign tmp_71_fu_367_p2 = (tmp_62_reg_431 | ap_const_lv5_3);

assign tmp_72_fu_372_p1 = tmp_71_fu_367_p2;

assign tmp_s_fu_284_p2 = (tmp_reg_402 + j_cast1_fu_269_p1);
always @ (posedge ap_clk) begin
    sel_tmp1_cast_reg_377[0] <= 1'b0;
    sel_tmp1_cast_reg_377[3:2] <= 2'b01;
    nb_1_reg_392[0] <= 1'b0;
    tmp_62_reg_431[1:0] <= 2'b00;
    statemt_addr_reg_437[1:0] <= 2'b00;
    statemt_addr_reg_437[6:5] <= 2'b00;
    statemt_addr_77_reg_442[1:0] <= 2'b01;
    statemt_addr_77_reg_442[6:5] <= 2'b00;
    statemt_addr_78_reg_457[1:0] <= 2'b10;
    statemt_addr_78_reg_457[6:5] <= 2'b00;
    statemt_addr_79_reg_462[1:0] <= 2'b11;
    statemt_addr_79_reg_462[6:5] <= 2'b00;
end



endmodule //encrypt_AddRoundKey

