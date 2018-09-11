`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 10:49:32 AM
// Design Name: 
// Module Name: FPGA_factorial
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


module FPGA_factorial(clk100MHZ, go, rst, n, LEDSEL, LEDOUT, done, button);
    supply1 [7:0] vcc;
    input clk100MHZ, go, button, rst;
    input [3:0] n;
    output done;
    output [7:0] LEDSEL, LEDOUT;
    
    wire DONT_USE, clk5KHZ;
    wire debounced_button;
    wire [31:0] outputLED;
    
    wire [3:0] dig0;
    wire [3:0] dig1;     
    wire [3:0] dig2;     
    wire [3:0] dig3;     
    wire [3:0] dig4;     
    wire [3:0] dig5;     
    wire [3:0] dig6;     
    wire [3:0] dig7;
    
    wire [7:0] s0, s1, s2, s3, s4, s5, s6, s7;
    
    clk_gen CLK (clk100MHZ, DONT_USE, clk5KHZ);
    
    button_debouncer MCLK (clk5KHZ, button, debounced_button);
    
    Top factorial (debounced_button, go, n, done, outputLED);
    
    bin2bcd32 convert (outputLED, dig0, dig1, dig2, dig3, dig4, dig5,
                        dig6, dig7);
                        
    bcd_to_7seg BCD1 (dig0, s0);
    bcd_to_7seg BCD2 (dig1, s1);
    bcd_to_7seg BCD3 (dig2, s2);
    bcd_to_7seg BCD4 (dig3, s3);
    bcd_to_7seg BCD5 (dig4, s4);
    bcd_to_7seg BCD6 (dig5, s5);
    bcd_to_7seg BCD7 (dig6, s6);
    bcd_to_7seg BCD8 (dig7, s7);
    
    led_mux LED (clk5KHZ, rst, s7, s6, s5, s4, s3, s2, s1, s0, LEDSEL, LEDOUT);
    
    
    
    
endmodule
