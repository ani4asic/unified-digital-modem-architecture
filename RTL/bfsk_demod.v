`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 23:09:52
// Design Name: 
// Module Name: bfsk_demod
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


module bfsk_demod(clk,rst,din,dout);
input clk,rst;
input [11:0] din;
output reg dout;

parameter [14:0] cr_offset = 15'd0; 
wire [11:0] cos_out1, cos_out2;
reg [11:0] cos_out3, cos_out4, cos_out5,cos_out6;
  
dds_1MHz dfs1(clk,rst,cr_offset,cos_out1);   
dds_500kHz dfs2(clk,rst,cr_offset,cos_out2);

//SINGLE FLOP SYNCHRONIZER
always @(posedge clk or posedge rst)
 begin 
    if(rst)
        begin
        cos_out3 <= 12'd0;
        cos_out4 <= 12'd0;
        end
     else   
        begin
        cos_out3 <= cos_out1;
        cos_out4 <= cos_out2;
        end
 end
 always @(posedge clk or posedge rst)
 begin 
    if(rst)
        begin
        cos_out5 <= 12'd0;
        cos_out6 <= 12'd0;
        end
     else   
        begin
        cos_out5 <= cos_out3;
        cos_out6 <= cos_out4;
        end
 end
//DOUBLE SYNCHRONIZER IMPLEMENTED ONLY FOR GETTING DOUT IN UNIVERSAL MOD DEMOD. TO RUN THIS MODULE SEPARATELY, REMOVE THIS AND RUN 
always @ (posedge clk or posedge rst)
begin 
    if (rst)
    dout<=1'b0;
    else 
    begin 
        if (din == cos_out5)
            dout<= 1'b1;
    else if(din == cos_out6)
             dout<= 1'b0; 
    end
 end
endmodule
