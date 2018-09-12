`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 12:15:27 PM
// Design Name: 
// Module Name: Top
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


module Top(CLK, Go, n, Done, err, result);
    
    parameter size = 32;
    input Go, CLK;
    input [3:0] n;
    output Done, err;
    wire [3:0] CS;
    output [size-1:0] result;
    
    wire Load_cnt, EN_cnt, Load_reg, sel1, sel2, GT;
    wire [3:0] cnt_out;
    
    
   /* module CU(
        input wire go,
        input wire CLK,
        input wire GT,
        input wire [3:0]cnt_out,
        output wire [3:0]cs,
        output reg done,
        output reg sel1, sel2, Load_cnt, EN, Load_reg
        ); */
    
    CU cu (Go, CLK, GT, GT12, cnt_out, CS, Done, err, sel1, sel2, 
    Load_cnt, EN_cnt, Load_reg);
    
    
    /*module DP(n, Load_cnt, EN_cnt, CLK, Load_reg, 
    sel1, sel2, GT, mux2_out);*/
    
    DP dp (n, Load_cnt, EN_cnt, CLK, Load_reg, sel1,
    sel2, GT, result, cnt_out, GT12);


endmodule
