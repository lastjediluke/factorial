`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 05:53:27 PM
// Design Name: 
// Module Name: mult
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


module mult(x, y, z);
    parameter data_width = 32;
    input [data_width-1:0] y;
    input [3:0] x;
    output reg[data_width-1:0] z;
    
    always @ (x or y) begin
        z = x*y;
    end
endmodule
