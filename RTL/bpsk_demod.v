`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 11:59:44
// Design Name: 
// Module Name: bpsk_demod
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


module bpsk_demod(clk,rst,din,dout);
input clk,rst;
input [11:0] din;
output reg dout;
      
parameter [14:0] cr_offset = 15'd0; 
wire [11:0] cos_out1;
reg [11:0] cos_out2;
reg [11:0] cos_out3;

dds_1MHz dfs(clk,rst,cr_offset,cos_out1); 
//DOUBLE FLOP SYNCHRONIZER
always @(posedge clk or posedge rst)
 begin 
    if(rst)
        begin
        cos_out2 <= 12'd0;
        end
     else
        cos_out2 <= cos_out1;
 end
 
 always @(posedge clk or posedge rst)
 begin 
    if(rst)
        cos_out3 <= 12'd0;
     else
        cos_out3 <= cos_out2;
 end

always @(posedge clk or posedge rst)
 begin 
    if (rst)
          dout <= 1'd0;
    else if (din == cos_out3)
        dout <= 1'd1;
    else
        dout<= 1'd0;
end
endmodule
