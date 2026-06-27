`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 22:02:51
// Design Name: 
// Module Name: bpsk_mod
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


module bpsk_mod(
    input clk,
    input rst,
    input din,
    output [11:0] bpsk_mod
    );
parameter [14:0] cr_offset = 15'd0; 
wire [11:0] cos_out1;
reg [11:0] cos_out2;
reg [11:0] I_phase, Q_phase;
 
 dds_1MHz dfs1(clk,rst,cr_offset,cos_out1);      

 always @(posedge clk or posedge rst)
 begin 
    if(rst)
        cos_out2 <= 12'd0;
     else
        cos_out2 <= cos_out1;
 end

 always @(posedge clk or posedge rst)
 begin 
    if (rst)
        begin
          I_phase <= 12'd0;
          Q_phase <= 12'd0;
        end 
    else if (din == 1)
        begin 
            I_phase <= cos_out1;
            Q_phase <= 12'd0;
        end
    else
        begin 
            I_phase <= 12'd0;
            Q_phase <= ~cos_out2;
        end
end  

assign bpsk_mod = I_phase + Q_phase;

endmodule
