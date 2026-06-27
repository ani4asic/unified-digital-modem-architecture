`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 13:09:21
// Design Name: 
// Module Name: bask_mod
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


module bask_mod(
    input clk,
    input rst,
    input din,
    output reg [11:0] bask_mod
    );
 
 parameter [14:0] cr_offset = 15'd0; 
 wire [11:0] cos_out;
  
 dds_1MHz dfs(clk,rst,cr_offset,cos_out);   
 
 always @(posedge clk or posedge rst)
 begin
    if(rst)
        bask_mod <= 12'd0;
     else if (din == 1'b1)
        bask_mod <= cos_out;
     else 
        bask_mod <= 12'd0;
 end
endmodule
