module RST_Decoder(input [3:0]RST_sel, 
			   input RST_en,
			  
			  output rst_ROW ,
			  output rst_COL ,
			  output rst_CURR,
			  output rst_SUM );

wire[3:0]decoder_out;
	
	assign decoder_out = (RST_en == 1) ? RST_sel :
		                   4'b0000;
			
	assign rst_ROW  = decoder_out[0];
	assign rst_COL  = decoder_out[1];
	assign rst_CURR = decoder_out[2];
	assign rst_SUM  = decoder_out[3];

endmodule