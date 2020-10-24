module reg_type3_8bit(input clk, 
							  input write_en,
							  input [7:0]datain,
					        input inc,
							  input reset,
					
					        output reg [7:0]dataout = 8'd0);

					
	always @ (posedge clk)
		begin
			if (inc == 1)	
			   dataout <= dataout + 1;	
			else if (write_en == 1) 		
				dataout <= datain;
			else if (reset == 1)	
			   dataout <= 8'd0; 		
			else 
				dataout <= dataout;
		end

endmodule