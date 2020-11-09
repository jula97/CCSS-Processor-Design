module WTR_Decoder(input [7:0]WTR_sel, 
			   input WTR_en,
			  
			  output wtr_N ,
           output wtr_M ,
			  output wtr_P ,
			  output wtr_ROW,
			  output wtr_COL ,
			  output wtr_CURR ,
           output wtr_SUM ,
			  output wtr_R ,
			  output wtr_STA,
			  output wtr_STB ,
			  output wtr_STC ,
			  output wtr_A ,
			  output wtr_B ,
           output wtr_R1,
			  output wtr_CoreID );
	
	wire[14:0]decoder_out;
	
	assign decoder_out = (WTR_sel==8'd1 & WTR_en == 1) ?  15'b000000000000001 :
								(WTR_sel==8'd2 & WTR_en == 1) ?  15'b000000000000010 :
								(WTR_sel==8'd3 & WTR_en == 1) ?  15'b000000000000100 :
								(WTR_sel==8'd4 & WTR_en == 1) ?  15'b000000000001000 :
								(WTR_sel==8'd5 & WTR_en == 1) ?  15'b000000000010000 :
								(WTR_sel==8'd6 & WTR_en == 1) ?  15'b000000000100000 :
								(WTR_sel==8'd7 & WTR_en == 1) ?  15'b000000001000000 :
                        (WTR_sel==8'd8 & WTR_en == 1) ?  15'b000000010000000 :
								(WTR_sel==8'd9 & WTR_en == 1) ?  15'b000000100000000 :
							   (WTR_sel==8'd10 & WTR_en == 1) ? 15'b000001000000000 :
							   (WTR_sel==8'd11 & WTR_en == 1) ? 15'b000010000000000 :
								(WTR_sel==8'd12 & WTR_en == 1) ? 15'b000100000000000 :
								(WTR_sel==8'd13 & WTR_en == 1) ? 15'b001000000000000 :
								(WTR_sel==8'd14 & WTR_en == 1) ? 15'b010000000000000 :
								(WTR_sel==8'd15 & WTR_en == 1) ? 15'b100000000000000 :
								15'b000000000000000;
			

	assign wtr_N    = decoder_out[0];
	assign wtr_M	 = decoder_out[1];
   assign wtr_P    = decoder_out[2];
   assign wtr_R1   = decoder_out[3];
	assign wtr_ROW  = decoder_out[4];
	assign wtr_COL  = decoder_out[5];
	assign wtr_CURR = decoder_out[6];
	assign wtr_SUM  = decoder_out[7];
	assign wtr_STA	 = decoder_out[8];
   assign wtr_STB  = decoder_out[9];
	assign wtr_STC  = decoder_out[10];
	assign wtr_A    = decoder_out[11];
	assign wtr_B    = decoder_out[12];
	assign wtr_R    = decoder_out[13];
   assign wtr_CoreID = decoder_out[14]; 
endmodule