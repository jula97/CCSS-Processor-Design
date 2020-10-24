module data_mem (input clk,
					  input read_en ,
					  input write_en,
					  input [3:0] addr,
					  input [3:0] datain,

					  output reg [3:0] dataout);

reg [7:0] ram [60:0]; //[65535:0];

initial begin 
	ram[1] = 8'd2;
	ram[2] = 8'd3;
	ram[3] = 8'd4;
	end

always @(posedge clk)
begin
		if (read_en == 1)
		   dataout <= ram[addr];
		else if (write_en == 1)
			ram[addr] <= datain;
      else 
			dataout <= 4'd0;
end

endmodule
