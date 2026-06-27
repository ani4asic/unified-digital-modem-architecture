`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 12:21:29
// Design Name: 
// Module Name: ask_mod_demod_tb
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


module ask_mod_demod_tb();
reg clk,rst,din;
wire [11:0] mod_out;
wire dout;

ask_mod_demod md1(clk,rst,din,mod_out,dout);
initial
begin 
        clk = 1'b0; 
        rst = 1'b1; 
        din = 1'b0;
end
always #5 clk = ~clk;

initial
begin 
  #10 rst = 0;
      din = 1;
  #2000 din = 0;
  #4000 din = 1;
  #2000 din = 0;
  #4000 din = 1;
  #6000 din = 0;
  #5000 din = 1;
  #5000 din = 0;
  #4000 din = 1; 
  #4000 din = 0;
  #500  $finish ;
end
endmodule
