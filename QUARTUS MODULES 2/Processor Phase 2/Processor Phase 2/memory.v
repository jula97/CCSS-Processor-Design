module memory (input clk,
					input read_en ,
					input [7:0] addr,
					input [7:0] datain,

					output reg [7:0] dataout);

reg [7:0] ram [60:0]; //[65535:0];

initial begin 
	ram[1] = 8'd1;
	ram[2] = 8'd2;
   ram[3] = 8'd3;
	ram[4] = 8'd4;
	ram[5] = 8'd5;
   ram[6] = 8'd6;
	ram[7] = 8'd7;
	ram[8] = 8'd8;
   ram[9] = 8'd9;
	ram[10] = 8'd10;
	ram[11] = 8'd11;
   ram[12] = 8'd12;
	ram[13] = 8'd13;
	ram[14] = 8'd14;
   ram[15] = 8'd15;
 	end

always @(posedge clk)
begin
		if (read_en == 1)
		   dataout <= ram[addr];
		else
			dataout <= 0;
end

endmodule
