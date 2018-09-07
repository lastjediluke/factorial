`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2018 12:25:26 PM
// Design Name: 
// Module Name: REG
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


module REG(D, Q, CLK, Load_reg);
    parameter Data_width = 32;
    input CLK, Load_reg;
    input [Data_width-1:0] D;
    output reg [Data_width-1:0] Q;
    
    always @ (posedge CLK)
        begin
            if(Load_reg) Q = D;
            else Q = Q;
        end
endmodule
