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
sel1, sel2, cnt, GT, mux1_out, mux2_out, z);
    parameter size = 32;
    parameter one = 1;
    parameter zero = 0;
    input [3:0] n;
    //input one, zero;
    input Load_cnt, EN_cnt, CLK, Load_reg, sel1, sel2;
    output [3:0] cnt;
    output GT;
    output [size-1:0]mux1_out, mux2_out, z;
endmodule
