`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 13:25:59
// Design Name: 
// Module Name: bfsk_mod
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


module bfsk_mod(
    input clk,
    input rst,
    input din,
    output reg [11:0] bfsk_mod
    );
 
 parameter [14:0] cr_offset = 15'd0; 
 wire [11:0] cos_out1, cos_out2;
  
 dds_1MHz dfs1(clk,rst,cr_offset,cos_out1);   
 dds_500kHz dfs2(clk,rst,cr_offset,cos_out2);
 
 //BFSK Logic
 always @(posedge clk or posedge rst)
 begin
    if(rst)
        begin
           bfsk_mod <= 12'd0;
        end
     else if (din == 1'b1)
        bfsk_mod <= cos_out1;
     else 
        bfsk_mod <= cos_out2;
 end
endmodule


