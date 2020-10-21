module phase_3(input [3:0]datain,
					input [2:0]datain_DR,
					input clk,
					input clk1,
					input clk2,
					input [8:0]ctrlsig_in,
					
					output reg [3:0]dataout,
					output reg [3:0]Rout,
					output reg [2:0]DR_out,
					output reg [3:0]bus_out,
					output reg[2:0]conn);
					
reg [8:0]ctrlsig;
wire [3:0]R_out;
wire [15:0]mux_out;
wire [3:0]bus;
wire [15:0]ALU_out;
wire z;
wire [15:0]Dataout;
wire [2:0]DRout;
wire [7:0]WTR;
wire [7:0]INC;
wire [7:0]RESET;
wire [2:0]WTA;


reg_type1_16bit reg_R(.clk(clk), .write_en(1), .datain(datain), .dataout(R_out));

reg_type1_8bit reg_DR(.clk(clk), .write_en(ctrlsig) , .datain(datain_DR) , .dataout(DRout));

OPR_demux demux1( .operand(DRout), .OPR_sel(ctrlsig[8:6]), .WTR_operand(WTR), .INC_operand(INC), .RESET_operand(RESET), .WTA_operand(WTA));

WTA_mux mux1(.WTA_sel(WTA), .WTA_en(ctrlsig[0]), .wta_N(0) , .wta_M(0) , .wta_P(0) , .wta_R1(0) , .wta_ROW(0), .wta_COL(0), 
             .wta_CURR(0) , .wta_SUM(0) ,.wta_STA(0), .wta_STB(0) , .wta_STC(0) , .wta_A(0) , .wta_B(0) ,
             .wta_R(R_out) , .dataout(mux_out));
				 
BUS A_bus(.WTA(mux_out), .PC(0), .IR(0), .AR(0), .DR(0), .TR(0), .IRAM(0), .BUS_OUT(bus));

reg_ac AC( .clk(clk), .write_en(ctrlsig[1]), .datain(bus), .alu_write_en(ctrlsig[2]), .alu_out(ALU_out), .dataout(Dataout));

alu ALU(.clk(clk2),.in1(Dataout), .in2(bus), .alu_op(ctrlsig[5:3]), .alu_out(ALU_out), .z(z) );

memory IRAM(.clk(clk),.read_en(ctrlsig), .addr(), .datain(), .dataout());

reg_type3_16bit PC(.clk(clk), .write_en(ctrlsig),.datain(datain),.inc(ctrlsig), .reset(ctrlsig),.dataout(dout));

always @(posedge clk1)
begin
		ctrlsig <= ctrlsig_in;
end


always @(posedge clk2)
begin	
	dataout <= Dataout;
	Rout  <= R_out;
	DR_out <= DRout;
	bus_out <= bus;
	conn <= ctrlsig[5:3];
end 
endmodule