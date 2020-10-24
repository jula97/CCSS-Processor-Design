module WTR_Decoder(input [4:0]WTR_sel, 
			   input WTR_en,
			  
			  output wtr_PC ,
			  output wtr_IR ,
			  output wtr_AR,
			  output wtr_DR ,
			  output wtr_TR ,
			  output wtr_N ,
           output wtr_M ,
			  output wtr_P ,
			  output wtr_ROW,
			  output wtr_COL ,
			  output wtr_CURR ,
           output wtr_SUM ,
			  output wtr_AVAL ,
			  output wtr_STA,
			  output wtr_STB ,
			  output wtr_STC ,
			  output wtr_A ,
			  output wtr_B ,
           output wtr_AC );
	
	wire[18:0]decoder_out;
	
	assign decoder_out = (WTR_sel==5'd1 & WTR_en == 1) ? 19'b0000000000000000001 :
								(WTR_sel==5'd2 & WTR_en == 1) ? 19'b0000000000000000010 :
								(WTR_sel==5'd3 & WTR_en == 1) ? 19'b0000000000000000100 :
								(WTR_sel==5'd4 & WTR_en == 1) ? 19'b0000000000000001000 :
								(WTR_sel==5'd5 & WTR_en == 1) ? 19'b0000000000000010000 :
								(WTR_sel==5'd6 & WTR_en == 1) ? 19'b0000000000000100000 :
								(WTR_sel==5'd7 & WTR_en == 1) ? 19'b0000000000001000000 :
                        (WTR_sel==5'd8 & WTR_en == 1) ? 19'b0000000000010000000 :
								(WTR_sel==5'd9 & WTR_en == 1) ? 19'b0000000000100000000 :
							   (WTR_sel==5'd10 & WTR_en == 1) ? 19'b0000000001000000000 :
							   (WTR_sel==5'd11 & WTR_en == 1) ? 19'b0000000010000000000 :
								(WTR_sel==5'd12 & WTR_en == 1) ? 19'b0000000100000000000 :
								(WTR_sel==5'd13 & WTR_en == 1) ? 19'b0000001000000000000 :
								(WTR_sel==5'd14 & WTR_en == 1) ? 19'b0000010000000000000 :
                        (WTR_sel==5'd15 & WTR_en == 1) ? 19'b0000100000000000000 :
								(WTR_sel==5'd16 & WTR_en == 1) ? 19'b0001000000000000000 :
								(WTR_sel==5'd17 & WTR_en == 1) ? 19'b0010000000000000000 :
								(WTR_sel==5'd18 & WTR_en == 1) ? 19'b0100000000000000000 :
								(WTR_sel==5'd19 & WTR_en == 1) ? 19'b1000000000000000000 :
								19'b0000000000000000000;
			
	assign wtr_PC  = decoder_out[0];
	assign wtr_IR  = decoder_out[1];
	assign wtr_AR = decoder_out[2];
	assign wtr_DR  = decoder_out[3];
	assign wtr_TR  = decoder_out[4];
	assign wtr_N  = decoder_out[5];
	assign wtr_M	 = decoder_out[6];
   assign wtr_P  = decoder_out[7];
	assign wtr_ROW  = decoder_out[8];
	assign wtr_COL = decoder_out[9];
	assign wtr_CURR  = decoder_out[10];
	assign wtr_SUM  = decoder_out[11];
	assign wtr_AVAL  = decoder_out[12];
	assign wtr_STA	 = decoder_out[13];
   assign wtr_STB  = decoder_out[14];
	assign wtr_STC  = decoder_out[15];
	assign wtr_A = decoder_out[16];
	assign wtr_B  = decoder_out[17];
	assign wtr_AC  = decoder_out[18];

endmodule