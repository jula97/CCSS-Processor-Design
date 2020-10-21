module reg_type3_16bit_test(input clk, 
							  input write_en,
							  input [3:0]datain,
					        input inc,
							  input reset,
					
					        output reg [3:0]dataout = 4'd0);

					
	always @ (posedge clk)
		begin
			if (write_en == 1) 		
				dataout <= datain;
			else if (reset == 1)	
			   dataout <= 4'd0; 	
			else if (inc == 1)	
			   dataout <= dataout + 4'd1;		
			else
				dataout <= dataout;
		end

endmodule