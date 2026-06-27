`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 13:14:14
// Design Name: 
// Module Name: tb_bask_mod
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


module tb_bask_mod();
    reg clk;
    reg rst;
    reg din;
    wire [11:0] bask_mod;

bask_mod dut (clk,rst,din,bask_mod);

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
