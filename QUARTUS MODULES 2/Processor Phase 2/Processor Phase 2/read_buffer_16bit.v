module read_buffer_16bit(input read_en,
						      input [15:0]datain,
								
								output [15:0]dataout);
								
assign dataout = (read_en == 1) ? datain:
					   16'd0;
						  
endmodule
