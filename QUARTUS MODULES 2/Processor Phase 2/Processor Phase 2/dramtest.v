module dramtest(input clk,
				    input clear, 
					 input wren, 
					 input rden, 
					 input [7:0]address, 
					 input [7:0]data, 
					 output [7:0]q);

ChipMemory DRAM(.aclr(0),.data(data),.wren(wren), .address(address), .rden(rden), .clock(clk), .q(q));

endmodule
