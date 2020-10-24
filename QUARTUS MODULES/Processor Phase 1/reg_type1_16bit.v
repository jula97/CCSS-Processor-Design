module reg_type1_16bit(input clk, 
							 input write_en,
							 input [15:0]datain,
							 
							 output reg [15:0]dataout = 16'd0);


	always @ (posedge clk)
		begin
			if (write_en == 1)
				dataout <= datain; 
			else 
				dataout <= dataout;
		end

endmodule 