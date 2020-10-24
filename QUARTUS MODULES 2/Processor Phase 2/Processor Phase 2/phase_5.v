module phase_5(input [3:0]datain,
	
					//input clk,   // clock
					//input clk1,  //ctrl latch
					input clk2, //50Mhz
					
					input [9:0]ctrlsig_in,
					
					output segmentA, segmentB, segmentC, segmentD, segmentE, segmentF, segmentG,
					output segmentA1, segmentB1, segmentC1, segmentD1, segmentE1, segmentF1, segmentG1,
					output segmentA2, segmentB2, segmentC2, segmentD2, segmentE2, segmentF2, segmentG2,
					output segmentA3, segmentB3, segmentC3, segmentD3, segmentE3, segmentF3, segmentG3,
					output segmentA4, segmentB4, segmentC4, segmentD4, segmentE4, segmentF4, segmentG4,
					
					//output reg [3:0]PC_out,
					//output reg [3:0]DR_out,
					output [7:0]bus_out,
					output col,
					//output reg [2:0]AC_out,
					output [9:0]ctrlsig_out);
					//output reg[6:0]conn);


wire [9:0]ctrlsig;
//wire [2:0]Rout;

wire [7:0]DRout;
wire [15:0]PCout;
wire [7:0]COLout;
wire [15:0]ROWout;
wire [7:0]CURRout;
wire [7:0]bus;
wire [7:0]memout;

wire [15:0]mux_out;
//wire [15:0]ALU_out;
//wire [15:0]ACout;
//wire z;

wire [7:0]WTR;
wire [7:0]INC;
wire [7:0]RESET;
wire [7:0]WTA;

wire row_INC;
wire col_INC;
wire curr_INC;

wire row_RST;
wire col_RST;
wire curr_RST;

wire wrt_row;
wire wrt_col;
wire wrt_curr;
wire common_INC;

abaclock clock(.inclk(clk2),.ena(1),.clk(clk1));

control CU(.clk(clk2),.ctrlsig(ctrlsig));


bin27 display_reg_ROW(.clk(clk2),.datain(ROWout),.segmentA(segmentA),.segmentB(segmentB),.segmentC(segmentC),.segmentD(segmentD),
                      .segmentE(segmentE), .segmentF(segmentF), .segmentG(segmentG) );
							 
bin27 display_reg_COL(.clk(clk2),.datain(COLout),.segmentA(segmentA1),.segmentB(segmentB1),.segmentC(segmentC1),.segmentD(segmentD1),
                      .segmentE(segmentE1),.segmentF(segmentF1), .segmentG(segmentG1) );

bin27 display_reg_CURR(.clk(clk2),.datain(CURRout),.segmentA(segmentA2),.segmentB(segmentB2),.segmentC(segmentC2),.segmentD(segmentD2),
                      .segmentE(segmentE2),.segmentF(segmentF2), .segmentG(segmentG2) );
							 
bin27 display_reg_DR(.clk(clk2),.datain(DRout),.segmentA(segmentA3),.segmentB(segmentB3),.segmentC(segmentC3),.segmentD(segmentD3),
                      .segmentE(segmentE3), .segmentF(segmentF3), .segmentG(segmentG3) );	
	
bin27 display_reg_PC(.clk(clk2),.datain(PCout),.segmentA(segmentA4),.segmentB(segmentB4),.segmentC(segmentC4),.segmentD(segmentD4),
                      .segmentE(segmentE4), .segmentF(segmentF4), .segmentG(segmentG4) );	
 

INC_Decoder   inc(.INC_sel(INC), .INC_en(ctrlsig[0]),.inc_ROW(row_INC) ,.inc_COL(col_INC) ,.inc_CURR(curr_INC),.inc_STA(common_INC) ,.inc_STB(common_INC) ,
			         .inc_STC(common_INC) ,.inc_R1(common_INC) );

RST_Decoder   rst(.RST_sel(RESET),.RST_en(ctrlsig[1]),.rst_ROW(row_RST) ,.rst_COL(col_RST) ,.rst_CURR(curr_RST),.rst_SUM(common_INC) );

WTR_Decoder   wrt( .WTR_sel(WTR), .WTR_en(ctrlsig[2]),
			          .wtr_N(common_INC) , .wtr_M(common_INC), .wtr_P(common_INC) ,.wtr_ROW(wrt_row), .wtr_COL(wrt_col) , .wtr_CURR(wrt_curr) ,
						 .wtr_SUM(common_INC) ,.wtr_R(common_INC) ,.wtr_STA(common_INC),.wtr_STB(common_INC) ,.wtr_STC(common_INC) ,.wtr_A(common_INC) ,.wtr_B(common_INC) ,.wtr_R1(common_INC) );

						 
reg_type3_8bit   reg_ROW(.clk(clk1), .write_en(wrt_row),.datain(bus), .inc(row_INC), .reset(row_RST), .dataout(ROWout));
reg_type3_8bit   reg_COL(.clk(clk1), .write_en(wrt_col),.datain(bus), .inc(col_INC), .reset(col_RST), .dataout(COLout));
reg_type3_8bit   reg_CURR(.clk(clk1), .write_en(wrt_curr),.datain(bus), .inc(curr_INC), .reset(curr_RST), .dataout(CURRout));


reg_type1_8bit   reg_DR(.clk(clk1), .write_en(ctrlsig[3]) , .datain(bus) , .dataout(DRout));

reg_type3_16bit  PC(.clk(clk1), .write_en(ctrlsig[4]),.datain(bus),.inc(0), .reset(0),.dataout(PCout));

//reg_ac           AC( .clk(clk), .write_en(0), .datain(bus), .alu_write_en(ctrlsig[5]), .alu_out(ALU_out), .dataout(ACout));

OPR_demux  demux1( .operand(DRout), .OPR_sel(ctrlsig[7:5]), .WTR_operand(WTR), .INC_operand(INC), .RESET_operand(RESET), .WTA_operand(WTA));

memory    IRAM(.clk(clk1),.read_en(ctrlsig[8]), .addr(PCout), .datain(0), .dataout(memout));

WTA_mux   mux1(.WTA_sel(WTA), .WTA_en(ctrlsig[9]), .wta_N(0) , .wta_M(0) , .wta_P(0) , .wta_R1(0) , .wta_ROW(ROWout), .wta_COL(COLout), 
             .wta_CURR(CURRout) , .wta_SUM(0) ,.wta_STA(0), .wta_STB(0) , .wta_STC(0) , .wta_A(0) , .wta_B(0) ,
             .wta_R(0) , .dataout(mux_out));
				 

BUS    A_bus(.WTA(mux_out), .PC(0), .IR(0), .AR(0), .DR(0), .TR(0), .IRAM(memout), .datain(datain), .BUS_OUT(bus));

/*always@(posedge clk)
 begin
 ctrlsig <= ctrlsig_in;
end*/	
	//PC_out <= PCout;
	//DR_out <= DRout;
	//AC_out <= ACout;
assign ctrlsig_out = ctrlsig;
assign bus_out = bus;


endmodule
