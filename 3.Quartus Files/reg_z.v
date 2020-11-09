//filename : reg_z.v
//used to instantiate the ALU flag

module reg_z(input clk,
				 input datain,
								
				 output reg dataout = 0);

	always @ (posedge clk)
		begin
				dataout <= datain;
		end
		
endmodule
