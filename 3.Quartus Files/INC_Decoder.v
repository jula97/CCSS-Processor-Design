module INC_Decoder(input [6:0]INC_sel, 
			   input INC_en,
			  
			  output inc_ROW ,
			  output inc_COL ,
			  output inc_CURR,
			  output inc_STA ,
			  output inc_STB ,
			  output inc_STC ,
			  output inc_R1 );
	
	wire[6:0]decoder_out;
	
	assign decoder_out = (INC_en == 1) ? INC_sel :
                         7'b0000000;
			
	assign inc_ROW  = decoder_out[0]; 
	assign inc_COL  = decoder_out[1];
	assign inc_CURR = decoder_out[2];
	assign inc_STA  = decoder_out[3];
	assign inc_STB  = decoder_out[4];
	assign inc_STC  = decoder_out[5];
	assign inc_R1	 = decoder_out[6];

endmodule
