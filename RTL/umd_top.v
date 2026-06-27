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


module umd_top(clk,rst,din,dout);
input clk,rst,din


umd u1(clk,rst,din);
universal_mod_demod u2(clk,rst,din,dout);
endmodule