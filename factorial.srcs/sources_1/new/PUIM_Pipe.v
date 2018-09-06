`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2018 01:26:51 PM
// Design Name: 
// Module Name: PUIM_Pipe
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


module PUIM_Pipe(input button, input [3:0] A, B, output [7:0] ans_out);

wire [7:0] PP0, PP1, PP2, PP3, PP01, PP23;
wire [3:0] And0, And1, And2, And3;
wire en, rst;
wire [7:0] result;
wire [3:0] Ain, Bin;
wire [7:0] Upper, lower, answer;

assign en = 1;
assign rst = 0;

D_reg_4 Areg(button, rst, en, A, Ain);
D_reg_4 Breg(button, rst, en, B, Bin);

/*And_PUIM(A, b out)*/
And_PUIM AB0(Ain, Bin[0], And0);
And_PUIM AB1(Ain, Bin[1], And1);
And_PUIM AB2(Ain, Bin[2], And2);
And_PUIM AB3(Ain, Bin[3], And3);

/*SAP(A, S, OUT)*/
SAP SP1(And0, 0, PP0);
SAP SP2(And1, 1, PP1);
SAP SP3(And2, 2, PP2);
SAP SP4(And3, 3, PP3);

Adder8 P01(PP0, PP1, PP01);
Adder8 P23(PP2, PP3, PP23);

D_reg_8 upreg(button, rst, en, PP01, Upper);
D_reg_8 lowreg(button, rst, en, PP23, lower);

Adder8 P(Upper, lower, result);

assign ans_out = answer;

D_reg_8 resreg(button, rst, en, result, answer);

endmodule

