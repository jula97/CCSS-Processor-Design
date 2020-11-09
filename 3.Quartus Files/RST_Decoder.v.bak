module RST_Decoder(input [2:0]RST_sel, 
			   input RST_en,
			  
			  output rst_ROW ,
			  output rst_COL ,
			  output rst_CURR,
			  output rst_SUM );

wire[3:0]decoder_out;
	
	assign decoder_out = (RST_sel==3'd1 & RST_en == 1) ? 4'b0001 :
								(RST_sel==3'd2 & RST_en == 1) ? 4'b0010 :
								(RST_sel==3'd3 & RST_en == 1) ? 4'b0100 :
								(RST_sel==3'd4 & RST_en == 1) ? 4'b1000 :
		                   4'b0000;
			
	assign rst_ROW  = decoder_out[0];
	assign rst_COL  = decoder_out[1];
	assign rst_CURR = decoder_out[2];
	assign rst_SUM  = decoder_out[3];

endmodule