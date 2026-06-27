`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 22:19:22
// Design Name: 
// Module Name: tb_bpsk_mod
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


module tb_bpsk_mod();
    reg clk;
    reg rst;
    reg din;
    wire [11:0] bpsk_mod;

bpsk_mod dut (clk,rst,din,bpsk_mod);

initial begin
    clk = 0;
    rst = 1;
    din = 0;
end

always #5 clk = ~clk;

initial begin
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
