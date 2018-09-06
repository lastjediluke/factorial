`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2018 01:25:20 PM
// Design Name: 
// Module Name: And_PUIM
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


module And_PUIM(input [3:0] A, input b, output[3:0] out);

assign out[0] = A[0] & b;
assign out[1] = A[1] & b;
assign out[2] = A[2] & b;
assign out[3] = A[3] & b;

endmodule

module Adder8(input [7:0] A, B, output [7:0] out);

wire [3:0] PPAL, PPAU, PPBL, PPBU, PPL, PPU;
wire zero, PPLC, PPUC;

assign zero = 0;

assign PPAL = A[3:0];
assign PPAU = A[7:4];
assign PPBL = B[3:0];
assign PPBU = B[7:4];

Adder4 AL(PPAL, PPBL, zero, PPL, PPLC);
Adder4 AU(PPAU, PPBU, PPLC, PPU, PPUC);

assign out[3:0] = PPL;
assign out[7:4] = PPU;

endmodule

module SAP(input [3:0]PP, input [1:0] space, output [7:0] out);

wire [7:0] temp;

assign temp[7:0] = PP;
assign out = temp << space;

endmodule

module PUIM(input [3:0] A, B, output [7:0] result);
wire [7:0] PP0, PP1, PP2, PP3, PP01, PP23;
wire [3:0] And0, And1, And2, And3;

/*And_PUIM(A, b out)*/
And_PUIM AB0(A, B[0], And0);
And_PUIM AB1(A, B[1], And1);
And_PUIM AB2(A, B[2], And2);
And_PUIM AB3(A, B[3], And3);

/*SAP(A, S, OUT)*/
SAP SP1(And0, 0, PP0);
SAP SP2(And1, 1, PP1);
SAP SP3(And2, 2, PP2);
SAP SP4(And3, 3, PP3);

Adder8 P01(PP0, PP1, PP01);
Adder8 P23(PP2, PP3, PP23);
Adder8 P(PP01, PP23, result);

endmodule

