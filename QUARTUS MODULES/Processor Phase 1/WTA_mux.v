module WTA_mux(input [3:0]WTA_sel, 
			   input WTA_en,
			  
			  input [7:0] wta_N ,
			  input [7:0] wta_M ,
           input [7:0] wta_P ,
			  input [15:0] wta_R ,
			  input [7:0] wta_ROW,
			  input [7:0] wta_COL ,
			  input [7:0] wta_CURR ,
           input [15:0] wta_SUM ,
			  input [15:0] wta_STA,
			  input [15:0] wta_STB ,
			  input [15:0] wta_STC ,
			  input [15:0] wta_A ,
			  input [15:0] wta_B ,
           input [15:0] wta_R1,
				
			  output [15:0] dataout);
	
	assign dataout =  (WTA_sel==4'd1 & WTA_en == 1) ? wta_N :
							(WTA_sel==4'd2 & WTA_en == 1) ? wta_M:
							(WTA_sel==4'd3 & WTA_en == 1) ? wta_P :
							(WTA_sel==4'd4 & WTA_en == 1) ? wta_R :
							(WTA_sel==4'd5 & WTA_en == 1) ? wta_ROW:
							(WTA_sel==4'd6 & WTA_en == 1) ? wta_COL :
							(WTA_sel==4'd7 & WTA_en == 1) ? wta_CURR :
                     (WTA_sel==4'd8 & WTA_en == 1) ? wta_SUM :
							(WTA_sel==4'd9 & WTA_en == 1) ? wta_STA :
							(WTA_sel==4'd10 & WTA_en == 1) ? wta_STB :
					      (WTA_sel==4'd11 & WTA_en == 1) ? wta_STC :
							(WTA_sel==4'd12 & WTA_en == 1) ? wta_A :
							(WTA_sel==4'd13 & WTA_en == 1) ? wta_B :
							(WTA_sel==4'd14 & WTA_en == 1) ? wta_R1 :
                  	16'b0000000000000000;
			


endmodule