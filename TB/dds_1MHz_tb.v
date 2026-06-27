`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 12:07:06
// Design Name: 
// Module Name: dds_1MHz_tb
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


module dds_1MHz_tb();
reg clk,rst;
reg [14:0]	cr_offset;
wire [11:0]	cos_out	;

dds_1MHz uut(clk,rst,cr_offset,cos_out);
initial
clk = 1'b0;
always #5 clk = ~clk;

initial
begin
     rst = 1'b1; cr_offset = 15'b0;
  #10 rst = 1'b0;
  #4000 $finish;
end
endmodule
