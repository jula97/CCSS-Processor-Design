module reg_type1_8bit(input clk, 
							 input write_en,
							 input [7:0]datain,
							 
							 output reg [7:0]dataout = 8'd0);


	always @ (posedge clk)
		begin
			if (write_en == 1)
				dataout <= datain; 
			else
				dataout <= dataout;
		end

endmodule 