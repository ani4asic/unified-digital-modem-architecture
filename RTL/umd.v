`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 16:40:40
// Design Name: 
// Module Name: umd_top
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


module umd(clk,rst,c,din);

input clk,rst;
input [16:0]c;
output reg [16:0] din;

counter_17_bit c1(clk,rst,c);

always @ (posedge clk or posedge rst)
begin
    if (c == 17'd3000)
        din<=1;
    else if (c == 17'd6000)
        din<=0;
     else if (c == 17'd10000)
        din<=1;
     else if (c == 17'd13000)
        din<=0;   
     else if (c == 17'd17000)
        din<=1;
      else
        din<=0;
end

endmodule
