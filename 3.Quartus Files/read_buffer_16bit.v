//filename : read_buffer_16bit.v
//used to give the read_en control signal to registers

module read_buffer_16bit(input read_en,
						      input [23:0]datain,
								
								output [23:0]dataout);
								
assign dataout = (read_en == 1) ? datain:
					   24'd0;
						  
endmodule
