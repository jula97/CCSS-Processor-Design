module reg_SUM(input clk, 
					input write_en,
					input [15:0]datain,
					input reset,
					
					output reg [15:0]dataout = 16'd0);

					
	always @ (posedge clk)
		begin
			if (write_en == 1) 		
				dataout <= datain;
			else if (reset == 1)	
			   dataout <= 16'd0; 
			else
				dataout <= dataout;
		end

endmodule