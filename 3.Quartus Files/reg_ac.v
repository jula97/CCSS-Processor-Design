module reg_ac(input clk, 
				  input write_en, 
				  input [15:0]datain,
				  input alu_write_en,
				  input [15:0]alu_out,
				  input reset,
				  
				  output reg[15:0] dataout = 16'd0);
	
	always @(posedge clk)
		begin
			if ((write_en == 1)&(alu_write_en == 0)&(reset == 0))       dataout <= datain;
			else if ((alu_write_en == 1)&(write_en == 0)&(reset == 0))  dataout <= alu_out;
			else if ((write_en == 0)&(alu_write_en == 0)&(reset == 1))  dataout <= 16'd0;
			else                               				               dataout <= dataout;
		end
endmodule
