module reg_type3_16bit_test(input clk, 
							  input write_en,
							  input [3:0]datain,
					        input inc,
							  input reset,
					
					        output reg [3:0]dataout = 4'd0);

abaclock clock1(.inclk(clk),.ena(1),.clk(clk2));
					
always @ (posedge clk2)
		begin
			if (inc & ~reset & ~write_en)	           dataout <= dataout + 4'd1;
			else if (~inc & reset & ~write_en)	     dataout <= 4'd0; 
			else if (~inc & ~reset & write_en)	     dataout <= datain;
			else   dataout <= dataout;
		end

endmodule