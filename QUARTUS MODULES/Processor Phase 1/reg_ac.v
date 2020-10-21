module reg_ac(input clk, 
				  input write_en, 
				  input [15:0]datain,
				  input alu_write_en,
				  input [15:0]alu_out,
				  
				  output reg[15:0] dataout = 16'd0);
	
	always @(posedge clk)
		begin
			if (write_en == 1)
				dataout <= datain;
			else if (alu_write_en == 1)
				dataout <= alu_out;
			else
				dataout <= dataout;
		end
endmodule
