module reg_type3_16bit(input clk, 
							  input write_en,
							  input [15:0]datain,
					        input inc,
							  input reset,
					
					        output reg [15:0]dataout = 16'd0);
	/*
	reg [15:0]F=16'd0;
	
always @ (posedge clk)
	begin
		F <= F+16'd1;
	end	*/					  

always @ (posedge clk)
		begin
			if (inc == 1)	          dataout <= dataout + 1;
			else if (reset == 1)     dataout <= 16'd0; 
			else if (write_en == 1)  dataout <= datain;
			else                     dataout <= dataout;
		end
/*	
always @ (posedge clk)
		begin
			if (write_en == 1) 		
				dataout = datain;
			else if (reset == 1)	
			   dataout = 16'd0; 	
			else if (inc == 1)	
			   //dataout <= F;
				dataout = dataout + 1;
			else 
			   dataout = dataout;
		end

		*/
endmodule