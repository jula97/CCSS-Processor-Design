module read_buffer_8bit(input read_en,
						      input [7:0]datain,
								
								output [7:0]dataout);
								
assign dataout = (read_en == 1) ? datain:
					   8'd0;
						  
endmodule
