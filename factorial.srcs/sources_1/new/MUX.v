`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2018 12:26:54 PM
// Design Name: 
// Module Name: MUX
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


module MUX(sel, in1, in2, out);
    parameter Data_width = 8;
    input sel;
    input [Data_width-1:0] in1, in2;
    output reg[Data_width-1:0] out;
    
    always @ (in1, in2, sel)
    begin
        case(sel)
            0: out = in1;
            1: out = in2;
        endcase
    end                
endmodule
