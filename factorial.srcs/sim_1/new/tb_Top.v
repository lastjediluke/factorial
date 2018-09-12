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
    integer x;
    //wire [3:0] cnt_out;
    
    
    //module Top(CLK, Go, n, Done, CS, result);
    
    Top DUT (CLK, Go, n, Done, err, result);
    
    initial begin
        CLK = 0;
        x = 0;
        n = 1;
        Go = 1;
        tick;
        tick;
        tick;
        tick;
        tick;
        Go = 0;
        
        CLK = 0;
        
        n = 12;
        Go = 1;
        
        while (x < 50) begin
            tick;
            x = x+1;
        end
        
        Go = 0;
        n = 13;
        Go = 1;
        tick;
        tick;
        tick;
        tick;
        
        
        
       /* for (i = 0; i < 14; i = i + 1) begin
            n = i;
            CLK = 0;
            Go = 1;
            tick;
            tick;
            tick;
            Go = 0;
            
            *//*while (x < 50) begin
                tick;
                x = x + 1;
            end
            x = 0;*//*
        end*/
        /*while ( i < 100 ) begin
            tick;
            i = i + 1;
        end*/
        
    end
    
    task tick;
        begin
        #5 CLK = 1;
        #5 CLK = 0;
        end
    endtask
    
endmodule
