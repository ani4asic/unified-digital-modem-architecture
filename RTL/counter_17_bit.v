`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 16:22:27
// Design Name: 
// Module Name: counter_17_bit
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


module counter_17_bit(clk,rst,c);
input clk,rst;
output reg [16:0] c;

always @(posedge clk or posedge rst)
begin
       if(rst)
       c<= 17'd0;
       else
       c <= c + 1'b1;
end
endmodule
