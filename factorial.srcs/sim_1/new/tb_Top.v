`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 12:15:00 PM
// Design Name: 
// Module Name: tb_Top
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


module tb_Top();
    
    parameter size = 32;
    wire Done;
    wire [size-1:0] result;
    wire [3:0] CS;
    reg CLK, Go;
    reg [3:0] n;
    integer i;
    //wire [3:0] cnt_out;
    
    
    //module Top(CLK, Go, n, Done, CS, result);
    
    Top DUT (CLK, Go, n, Done, result);
    
    initial begin
        CLK = 0;
        Go = 1;
        n = 12;
        i = 0;
        
        tick;
        tick;
        Go = 0;
        
        while ( i < 100) begin
            tick;
            i = i + 1;
        end
        
    end
    
    task tick;
        begin
        #5 CLK = 1;
        #5 CLK = 0;
        end
    endtask
    
endmodule
