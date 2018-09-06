`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2018 12:25:59 PM
// Design Name: 
// Module Name: CMP
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


module CMP(A, B, GT);
    parameter datain_width = 4;
    input[datain_width-1:0] A, B;
    output reg GT;
    
    always @ (A or B)
        begin
            if (A > B) 
                GT <= 1;
            else
                GT <= 0;
        end
        
    
endmodule
