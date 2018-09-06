`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2018 12:24:47 PM
// Design Name: 
// Module Name: CNT
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


module CNT(D, Load_cnt, EN, CLK, Q);
    parameter data_width = 4;
    input CLK, Load_cnt, EN;
    input[data_width-1:0] D;
    output reg[data_width-1:0] Q;
    
    always @ (posedge CLK)
        begin
            if(!EN) Q = Q;
            else if (Load_cnt) Q = D;
            else Q = Q - 1;
        end 
endmodule
