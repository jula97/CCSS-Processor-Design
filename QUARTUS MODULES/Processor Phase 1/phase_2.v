//`timescale 1 ns/10 ps

module phase_2(input clk1, input clk, input [3:0]datain, input [2:0]ctrlsig, output reg [3:0]dataout, output reg clk3=1'd0);

wire [3:0]dout;
wire clk2;


clock_test_Clock_divider CLOCK(.clock_in(clk1), .clock_out(clk2));


reg_type3_16bit PC(.clk(clk2), 
						 .write_en(ctrlsig[0]),
						 .datain(datain),
					    .inc(ctrlsig[1]),
						 .reset(ctrlsig[2]),
				       .dataout(dout));

						 
always @ (posedge clk2)
begin
		if (clk3 == 1'd0)
			clk3 <= 1'd1;
		else if (clk3 == 1'd1)
			clk3 <= 1'd0;
			/*clk2 = 1;
			#100000000;
			clk2 = 0;
			#100000000;
			*/
end			
						 
always @(posedge clk2)
begin
	dataout <= dout;
	//clk3 <= clk2;
end
endmodule
