module phase_4(input clk,
				  input [4:0]ctrlsig,
				  input [3:0]datain,
				  output reg [3:0]PC_out,
				  output reg [3:0]DR_out,
				  output reg [3:0]bus_out,
				  output reg [3:0] dataout);
				  
wire [3:0]dout;
wire [3:0]DRout;
wire [15:0]bus;
wire [7:0]memout;
				  
reg_type3_16bit  PC(.clk(clk), .write_en(ctrlsig[0]),.datain(datain),.inc(ctrlsig[1]), .reset(ctrlsig[2]),.dataout(dout));
memory  IRAM(.clk(clk),.read_en(ctrlsig[3]), .addr(dout), .datain(0), .dataout(memout));
BUS  A_bus(.WTA(0), .PC(0), .IR(0), .AR(0), .DR(0), .TR(0), .IRAM(memout), .BUS_OUT(bus));
reg_type1_8bit  reg_DR(.clk(clk), .write_en(ctrlsig[4]) , .datain(bus) , .dataout(DRout));

always @ (posedge clk)
begin
	dataout <= memout;
	bus_out <= bus;
	PC_out <= dout;
	DR_out <= DRout;
end
endmodule
