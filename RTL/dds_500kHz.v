`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 13:27:02
// Design Name: 
// Module Name: dds_500kHz
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


module dds_500kHz(clk,rst,cr_offset,cos_out);

input 			clk ;
input 			rst ;
input		[14:0]	cr_offset; 
output  	[11:0]	cos_out	;


reg		[11:0]	cos_out	;										
wire 		[19:0]	ph_acc ;
reg		[19:0]	ph_acc_reg ;
reg 				cin ;
wire		[9:0]		ph_acc_reg_comp ;					
wire		[2:0]		select ;				
wire		[14:0]	cos_out_next ;				
wire		[12:0]	mux_in ;									
reg 		[12:0]	mux1_out ;					
reg 		[12:0]	mux2_out ;				
reg		[12:0]	mux3_out ;					


//parameter fcw = 10485;	//frequency control word for 1MHZ
parameter fcw = 5243;	//frequency control word for 500 KHZ


always @(posedge clk or posedge rst)
begin
if(rst == 1'b1)				
	begin
		ph_acc_reg <= 20'd0 ;
		cin <= 1'b0	;
		cos_out <= 12'd0 ;
	end
else if (ph_acc_reg[19]^ph_acc_reg[18] == 1'b1)
   	begin
		ph_acc_reg <= ph_acc ;
		cin <= ~cin	;
		cos_out <= ~cos_out_next[14:3] ;
	end
else 
	begin
		ph_acc_reg <= ph_acc	;
		cin <= ~cin	;
		cos_out <= cos_out_next[14:3] ;
	end
end
			
assign ph_acc = (fcw + cr_offset) + (ph_acc_reg + cin) ;
assign ph_acc_reg_comp[9:0] = (ph_acc_reg[18]) ? ph_acc_reg[17:8] : (~ph_acc_reg[17:8]) ;
assign select[2:0]  = ph_acc_reg_comp[9:7] ;			
assign mux_in[12:0] = {3'b0,ph_acc_reg_comp[6:0],3'b0} ;


always @(select or mux_in)	
	case (select)
	3'd0:		begin		mux1_out = mux_in   	 ;	
							mux2_out = (mux_in >> 1) ;	
							mux3_out = 13'd16   ;	
				end			
	3'd1:		begin		mux1_out = mux_in   	 ;	
							mux2_out = (mux_in >> 1) ;	
							mux3_out = 13'd1528 ;	
				end			
	3'd2:		begin		mux1_out = mux_in   	 ;	
							mux2_out = (mux_in >> 2) ;
							mux3_out = 13'd3072 ;	
				end			
	3'd3:		begin		mux1_out = mux_in   	 ;	
							mux2_out = (mux_in >> 3) ;	
							mux3_out = 13'd4416 ;	
				end
	3'd4:		begin		mux1_out = mux_in   	 ;	
							mux2_out = 13'd0		 ;	
							mux3_out = 13'd5576 ;	
				end						
	3'd5:		begin		mux1_out = (mux_in >> 1) ;
							mux2_out = (mux_in >> 2) ;	
							mux3_out = 13'd6552 ;	
				end			
	3'd6:		begin		mux1_out = (mux_in >> 1) ;	
							mux2_out = 13'd0		 ;	
							mux3_out = 13'd7272 ;	
				end	
	3'd7:		begin		mux1_out = 13'd0         ;    
							mux2_out = (mux_in >> 3) ;	
							mux3_out = 13'd7768 ;	
			   end
	default:	begin		mux1_out = 13'd0		 ;	
							mux2_out = 13'd0		 ;	
							mux3_out = 13'd0 ;	
				end
endcase

assign cos_out_next = mux1_out + mux2_out + mux3_out ;

endmodule 