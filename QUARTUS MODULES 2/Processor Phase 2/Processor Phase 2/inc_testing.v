module inc_testing(input clk, 
							  input clk2,
							  input [12:0]ctrlsig_in,
					        //input datain[0],
							  //input datain[1],
					
					        output [6:0]out);
	/*
	reg [15:0]F=16'd0;
	
always @ (posedge clk)
	begin
		F <= F+16'd1;
	end	*/	
reg [6:0]dout;
	
clock_test_Clock_divider CLOCK(.clock_in(clk2), .clock_out(clk1));

always @ (posedge clk1)
		begin
			   dout <= (dout + 1) ;
			//else if (datain[0] == 1)     conn <= 7'd0; 
			//else if (clk == 1)  conn <= ctrlsig_in;
			//else                     conn <= conn;
		end
assign out = dout;		
/*	
always @ (posedge clk)
		begin
			if (write_en == 1) 		
				conn = datain;
			else if (reset == 1)	
			   conn = 16'd0; 	
			else if (inc == 1)	
			   //conn <= F;
				conn = conn + 1;
			else 
			   conn = conn;
		end

		*/
endmodule

 
 