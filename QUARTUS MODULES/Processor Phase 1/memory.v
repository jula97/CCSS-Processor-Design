module memory (input clk,
					input read_en ,
					input [3:0] addr,
					input [3:0] datain,

					output reg [3:0] dataout);

reg [7:0] ram [60:0]; //[65535:0];

initial begin 
	ram[1] = 8'd2;
	ram[2] = 8'd3;
	end

always @(posedge clk)
begin
		if (read_en == 1)
		   dataout <= ram[addr];
		else
			dataout <= dataout;
end

endmodule
