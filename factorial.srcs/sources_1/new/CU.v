`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 10:47:11 AM
// Design Name: 
// Module Name: CU
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


module CU(
    input wire go,
    input wire CLK,
    input wire GT, GT12,
    input wire [3:0]cnt_out,
    output wire [3:0]cs,
    output reg done, err,
    output reg sel1, sel2, Load_cnt, EN, Load_reg
    );
    
    parameter S0 = 4'b0000;
    parameter S1 = 4'b0001;
    parameter S2 = 4'b0010;
    parameter S3 = 4'b0011;
    parameter S4 = 4'b0100;
    parameter S5 = 4'b0101;
    parameter S6 = 4'b0110;
    parameter S7 = 4'b0111;
    parameter S8 = 4'b1000;
    
    reg [3:0] CS, NS;
    assign cs = CS;
    
    initial begin
        CS = S0;
        NS = S0;
    end
    
    always@(CS, go) begin
        case (CS)
            S0: begin               
                if(go) NS = S1;
                else NS = S0;
            end
            
            S1: begin
                NS = S2;
            end
            
            S2: begin   //countdown
                NS = S6;
            end
            
            S6: begin       //wait
                
                if(GT12)begin
                    $display("Too big of a number");
                    NS = S0;  
                end
                else if ((cnt_out == 1)||(cnt_out == 0)) begin
                    NS = S5;
                end
                else NS = S3;
            end
            
            S3: begin
                NS = S4;
            end
            
           /* S6: begin
                NS = S4;
            end */
            
            S4: begin   //wait state
                if(GT)NS = S2;
                else NS = S5;
            end
            
            S5: begin
                NS = S0;
            end
                
        endcase
    end
    
   /* input wire go,
        input wire CLK,
        input wire GT,
        output wire [3:0]cs,
        output reg done,
        output reg sel1, sel2, Load_cnt, EN, Load_reg*/
        
    always @ (posedge CLK) begin
        CS = NS;
    end
    
    always @ (CS, GT, GT12) begin
        case(CS)
            S0: begin
                done <= 0; sel1 <= 0; sel2 <= 0; err <= 0;
                Load_cnt <= 0; EN <= 0; Load_reg <= 0;
            end
            
            S1: begin
                done <= 0; sel1 <= 0; sel2 <= 0; err <= 0;
                Load_cnt <= 1; EN <= 0; Load_reg <= 1;
            end
            
            S2: begin   //wait
                done <= 0; sel1 <= 1; sel2 <= 0; err <= 0;
                Load_cnt <= 0; EN <= 0; Load_reg <= 0;
            end
            
            S3: begin
                done <= 0; sel1 <= 1; sel2 <= 0; err <= 0;
                Load_cnt <= 0; EN <= 0; Load_reg <= 1;
            end
            
            S6: begin   //wait after we load the reg
                if (GT12) begin
                    done <= 0; sel1 <= 1; sel2 <= 0; err <= 1;
                    Load_cnt <= 0; EN <= 0; Load_reg <= 0;
                end
                
                else begin
                    done <= 0; sel1 <= 1; sel2 <= 0; err <= 0;
                    Load_cnt <= 0; EN <= 0; Load_reg <= 0;
                end
            end
            
            S4: begin       //start downcounting
                done <= 0; sel1 <= 1; sel2 <= 0; err <= 0;
                Load_cnt <= 0; EN <= 1; Load_reg <= 0;
            end
            
            S5: begin       //output stage
                done <= 1; sel1 <= 1; sel2 <= 1; err <= 0;
                Load_cnt <= 0; EN <= 0; Load_reg <= 0;
            end
            
            default: begin
                done <= 0; sel1 <= 0; sel2 <= 0; err <= 0;
                Load_cnt <= 0; EN <= 0; Load_reg <= 0;
            end
            
            
        endcase
    end
    
    
    
endmodule
