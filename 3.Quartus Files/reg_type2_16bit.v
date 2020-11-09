module reg_type2_16bit(input clk, 
							  input write_en,
							  input [15:0]datain,
					        input inc,
					
					        output reg [15:0]dataout);

					
	always @ (posedge clk)
		begin
			if ((inc == 1)&(write_en==0))       dataout <= dataout + 1;
			else if ((inc == 0)&(write_en==1))  dataout <= datain;
			else                               dataout <= dataout;
		end

endmodule