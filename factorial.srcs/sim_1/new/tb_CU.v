`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 12:13:25 PM
// Design Name: 
// Module Name: tb_CU
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

/*input wire go,
    input wire CLK,
    input wire GT,
    output wire [3:0]cs,
    output reg done,
    output reg sel1, sel2, Load_cnt, EN, Load_reg*/
module tb_CU();
    reg go, CLK, GT;
    reg[3:0] cnt_out;
    wire[3:0] cs;
    wire done, sel1, sel2, Load_cnt, EN, Load_reg;
    
    CU DUT (go, CLK, GT, cnt_out, cs, done, sel1, sel2, Load_cnt, EN, Load_reg);
    initial begin
        CLK = 0;
        go = 1;
        GT = 1;
        tick;
        tick;
        tick;
        tick;
        GT = 0;
        tick;
        tick;
        tick;
        tick;
        tick;
        cnt_out = 4;
        tick;
        tick;
        tick;
    end
    
    task tick;
        begin
        #5 CLK = 1;
        #5 CLK = 0;
        end
    endtask
endmodule
