module reg_type2_16bit(input clk, 
							  input write_en,
							  input [15:0]datain,
					        input inc,
					
					        output reg [15:0]dataout);

					
	always @ (posedge clk)
		begin
			if (write_en == 1) 		
				dataout <= datain;
			else if (inc == 1)	
			   dataout <= dataout + 1;	
			else 
				dataout <= dataout;
		end

endmodule