module memory (input clk,
					input write_en ,
					input [15:0] addr,
					input [15:0] datain,

					output reg [7:0] dataout);

reg [7:0] ram [65535:0];

always @(posedge clock)
begin
		if (write_en == 1)
			ram[addr] <= datain[7:0];
		else
			dataout <= ram[addr];
end

endmodule
