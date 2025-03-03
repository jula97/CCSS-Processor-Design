module reg_type3_16bit(input clk, 
							  input write_en,
							  input [15:0]datain,
					        input inc,
							  input reset,
					
					        output reg [15:0]dataout = 16'd0);			  

always @ (posedge clk)
		begin
			if ((inc == 1)&(write_en==0)&(reset==0))       dataout <= dataout + 16'd1;
			else if ((inc == 0)&(write_en==0)&(reset==1))  dataout <= 16'd0; 
			else if ((inc == 0)&(write_en==1)&(reset==0))  dataout <= datain;
			else                                          dataout <= dataout;
		end

endmodule