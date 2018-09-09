`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 10:47:38 AM
// Design Name: 
// Module Name: DP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DP(n, Load_cnt, EN_cnt, CLK, Load_reg, 
sel1, sel2, GT, mux2_out, cnt_out);     //cnt_out may be an issue
    parameter size = 32;
    parameter one = 1;
    parameter zero = 0;
    input [3:0] n;
    //input one, zero;
    input Load_cnt, EN_cnt, CLK, Load_reg, sel1, sel2;
    
    output GT;
    output [size-1:0]mux2_out;
    wire [size-1:0] reg_out, mux1_out, z;
    output wire [3:0] cnt_out;
    
    
    MUX m1 (sel1, 1'b1, z, mux1_out); 
    MUX m2 (sel2, 1'b0, reg_out, mux2_out);
    
    CNT cnt (n, Load_cnt, EN_cnt, CLK, cnt_out);
    
    CMP cmp (cnt_out, 4'b0001, GT);
    
    mult multiplier(cnt_out, reg_out, z);
    
    REG reggie (mux1_out, reg_out, CLK, Load_reg);
    
    
    
    
endmodule
