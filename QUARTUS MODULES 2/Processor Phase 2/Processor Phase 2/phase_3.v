module phase_3(input [2:0]datain,
	
					input clk,   // clock
					input clk1,  //ctrl latch
					input clk2, //50Mhz
					
					input [12:0]ctrlsig_in,
					
					output reg [2:0]PC_out,
					output reg [2:0]R_out,
					output reg [2:0]DR_out,
					//output reg [2:0]bus_out,
					output reg [2:0]AC_out,
					
					output reg[6:0]conn);
					
wire [12:0]ctrlsig;

wire [2:0]Rout;
wire [2:0]DRout;
wire [2:0]PCout;
wire [2:0]bus;
wire [2:0]memout;

wire [15:0]mux_out;
wire [15:0]ALU_out;
wire [15:0]ACout;
wire z;

wire [7:0]WTR;
wire [7:0]INC;
wire [7:0]RESET;
wire [2:0]WTA;

control CU(.clk(clk2),.ctrlsig(ctrlsig));

reg_type1_16bit reg_R(.clk(clk), .write_en(ctrlsig[0]), .datain(bus), .dataout(Rout));

reg_type1_8bit reg_DR(.clk(clk), .write_en(ctrlsig[1]) , .datain(bus) , .dataout(DRout));

reg_type3_16bit PC(.clk(clk), .write_en(ctrlsig[2]),.datain(bus),.inc(ctrlsig[12]), .reset(0),.dataout(PCout));

reg_ac AC( .clk(clk), .write_en(0), .datain(bus), .alu_write_en(ctrlsig[3]), .alu_out(ALU_out), .dataout(ACout));

OPR_demux demux1( .operand(DRout), .OPR_sel(ctrlsig[6:4]), .WTR_operand(WTR), .INC_operand(INC), .RESET_operand(RESET), .WTA_operand(WTA));

memory IRAM(.clk(clk),.read_en(ctrlsig[7]), .addr(PCout), .datain(0), .dataout(memout));

WTA_mux mux1(.WTA_sel(WTA), .WTA_en(ctrlsig[8]), .wta_N(0) , .wta_M(0) , .wta_P(0) , .wta_R1(0) , .wta_ROW(0), .wta_COL(0), 
             .wta_CURR(0) , .wta_SUM(0) ,.wta_STA(0), .wta_STB(0) , .wta_STC(0) , .wta_A(0) , .wta_B(0) ,
             .wta_R(Rout) , .dataout(mux_out));
				 

BUS A_bus(.WTA(mux_out), .PC(0), .IR(0), .AR(0), .DR(0), .TR(0), .IRAM(memout), .datain(datain), .BUS_OUT(bus));


alu ALU(.clk(clk2),.in1(ACout), .in2(bus), .alu_op(ctrlsig[11:9]), .alu_out(ALU_out), .z(z) );



always @(posedge clk2)
begin	
	PC_out <= PCout;
	R_out  <= Rout;
	DR_out <= DRout;
	//bus_out<= bus;
	AC_out <= ACout;
	conn   <= ctrlsig[6:0]	;
end 

endmodule