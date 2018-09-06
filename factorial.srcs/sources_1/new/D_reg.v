`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2018 01:44:19 PM
// Design Name: 
// Module Name: D_reg
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


module D_reg_8#(parameter WIDTH = 8) 
(input clk, reset,input en,input[WIDTH-1:0] d, output reg [WIDTH-1:0] q); 
//   asynchronous, active HIGH reset w. enable input
always@(posedge clk, posedge reset)
if (reset) q <= 0;
else if (en) q <= d;
else q <= q; 

endmodule

module D_reg_4#(parameter WIDTH = 4) 
(input clk, reset,input en,input[WIDTH-1:0] d, output reg [WIDTH-1:0] q); 
//   asynchronous, active HIGH reset w. enable input
always@(posedge clk, posedge reset)
if (reset) q <= 0;
else if (en) q <= d;
else q <= q; 

endmodule
