`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2018 01:26:08 PM
// Design Name: 
// Module Name: Add_half
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


module Add_half
(a, b, sum, c_out);
input a,b;
output sum, c_out;
assign sum = a ^ b;
assign c_out = a & b;
endmodule

module xor2
(input a, b, output c);
assign c = a ^ b;
endmodule

module cla4
(input [3:0] A, B, input c_in, output[3:0] C);
wire [3:0]P, G;

Add_half ha1 (A[0], B[0], P[0], G[0]);
Add_half ha2 (A[1], B[1], P[1], G[1]);
Add_half ha3 (A[2], B[2], P[2], G[2]);
Add_half ha4 (A[3], B[3], P[3], G[3]);

assign C[0] = (G[0] | (P[0] & c_in));
assign C[1] = (G[1] | (G[0] & P[1]) | (c_in & P[0] & P[1]));
assign C[2] = (G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]) | (c_in & P[0] & P[1] & P[2]));
assign C[3] = (G[3] | (G[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (c_in & P[0] & P[1] & P[2] & P[3]));

endmodule

module Adder4
(A, B, c_in, sum, c_out);

input [3:0] A, B;
input c_in;
output [3:0] sum;
output c_out;
wire [3:0] C;
wire [3:0] P, G;

Add_half ha1 (A[0], B[0], P[0], G[0]);
Add_half ha2 (A[1], B[1], P[1], G[1]);
Add_half ha3 (A[2], B[2], P[2], G[2]);
Add_half ha4 (A[3], B[3], P[3], G[3]);

cla4 cla(A, B, c_in, C);

xor2 x0(c_in, P[0], sum[0]);
xor2 x1(C[0], P[1], sum[1]);
xor2 x2(C[1], P[2], sum[2]);
xor2 x3(C[2], P[3], sum[3]);

assign c_out = C[3];

endmodule

