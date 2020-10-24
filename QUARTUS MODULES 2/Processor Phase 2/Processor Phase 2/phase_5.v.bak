module phase_5(input [3:0]datain,
	
					input clk,   // clock
					input clk1,  //ctrl latch
					input clk2, //50Mhz
					
					input [9:0]ctrlsig,
					
					output segmentA, segmentB, segmentC, segmentD, segmentE, segmentF, segmentG,
					output segmentA1, segmentB1, segmentC1, segmentD1, segmentE1, segmentF1, segmentG1,
					output segmentA2, segmentB2, segmentC2, segmentD2, segmentE2, segmentF2, segmentG2,
					output segmentA3, segmentB3, segmentC3, segmentD3, segmentE3, segmentF3, segmentG3,
					output segmentA4, segmentB4, segmentC4, segmentD4, segmentE4, segmentF4, segmentG4,
					
					//output reg [3:0]PC_out,
					//output reg [3:0]DR_out,
					//output reg [2:0]bus_out,
					//output reg [2:0]AC_out,
					output reg [9:0]ctrlsig_out);
					//output reg[6:0]conn);


//wire [9:0]ctrlsig;
//wire [2:0]Rout;

wire [3:0]DRout;
wire [3:0]PCout;
wire [3:0]bus;
wire [3:0]memout;

wire [15:0]mux_out;
//wire [15:0]ALU_out;
//wire [15:0]ACout;
//wire z;

wire [7:0]WTR;
wire [7:0]INC;
wire [7:0]RESET;
wire [2:0]WTA;

wire row_INC;
wire col_INC;
wire curr_INC;

wire row_RST;
wire col_RST;
wire curr_RST;

wire wrt_row;
wire wrt_col;
wire wrt_curr;


bin27 display_reg_ROW(.clk(clk),.datain(ROWout),.segmentA(segmentA),.segmentB(segmentB),.segmentC(segmentC),.segmentD(segmentD),
                      .segmentE(segmentE), .segmentF(segmentF), .segmentG(segmentG) );
							 
bin27 display_reg_COL(.clk(clk),.datain(COLout),.segmentA(segmentA1),.segmentB(segmentB1),.segmentC(segmentC1),.segmentD(segmentD1),
                      .segmentE(segmentE1),.segmentF(segmentF1), .segmentG(segmentG1) );

bin27 display_reg_CURR(.clk(clk),.datain(CURRout),.segmentA(segmentA2),.segmentB(segmentB2),.segmentC(segmentC2),.segmentD(segmentD2),
                      .segmentE(segmentE2),.segmentF(segmentF2), .segmentG(segmentG2) );
							 
bin27 display_reg_DR(.clk(clk),.datain(DRout),.segmentA(segmentA3),.segmentB(segmentB3),.segmentC(segmentC3),.segmentD(segmentD3),
                      .segmentE(segmentE3), .segmentF(segmentF3), .segmentG(segmentG3) );	
	
bin27 display_reg_PC(.clk(clk),.datain(PCout),.segmentA(segmentA4),.segmentB(segmentB4),.segmentC(segmentC4),.segmentD(segmentD4),
                      .segmentE(segmentE4), .segmentF(segmentF4), .segmentG(segmentG4) );	
 

INC_Decoder   inc(.INC_sel(INC), .INC_en(ctrlsig[0]),.inc_ROW(row_INC) ,.inc_COL(col_INC) ,.inc_CURR(curr_INC),.inc_STA(0) ,.inc_STB(0) ,
			         .inc_STC(0) ,.inc_R1(0) );

RST_Decoder   rst(.RST_sel(RST),.RST_en(ctrlsig[1]),.rst_ROW(row_RST) ,.rst_COL(col_RST) ,.rst_CURR(curr_RST),.rst_SUM(0) );

WTR_Decoder   wrt( .WTR_sel(WTR), .WTR_en(ctrlsig[2]),
			          .wtr_N(0) , .wtr_M(0), .wtr_P(0) ,.wtr_ROW(wrt_row), .wtr_COL(wtr_col) , .wtr_CURR(wtr_curr) , .wtr_SUM(wtr_sum) ,
						 .wtr_AVAL(0) ,.wtr_STA(0),.wtr_STB(0) ,.wtr_STC(0) ,.wtr_A(0) ,.wtr_B(0) ,.wtr_AC(0) );

						 
reg_type3_8bit   reg_ROW(.clk(clk), .write_en(wrt_row),.datain(bus), .inc(row_INC), .reset(row_RST), .dataout(ROWout));
reg_type3_8bit   reg_COL(.clk(clk), .write_en(wrt_col),.datain(bus), .inc(col_INC), .reset(col_RST), .dataout(COLout));
reg_type3_8bit   reg_CURR(.clk(clk), .write_en(wrt_curr),.datain(bus), .inc(curr_INC), .reset(curr_RST), .dataout(CURRout));


reg_type1_8bit   reg_DR(.clk(clk), .write_en(ctrlsig[3]) , .datain(bus) , .dataout(DRout));

reg_type3_16bit  PC(.clk(clk), .write_en(ctrlsig[4]),.datain(bus),.inc(0), .reset(0),.dataout(PCout));

//reg_ac           AC( .clk(clk), .write_en(0), .datain(bus), .alu_write_en(ctrlsig[5]), .alu_out(ALU_out), .dataout(ACout));

OPR_demux  demux1( .operand(DRout), .OPR_sel(ctrlsig[7:5]), .WTR_operand(WTR), .INC_operand(INC), .RESET_operand(RESET), .WTA_operand(WTA));

memory    IRAM(.clk(clk),.read_en(ctrlsig[8]), .addr(PCout), .datain(0), .dataout(memout));

WTA_mux   mux1(.WTA_sel(WTA), .WTA_en(ctrlsig[9]), .wta_N(0) , .wta_M(0) , .wta_P(0) , .wta_R1(0) , .wta_ROW(ROWout), .wta_COL(COLout), 
             .wta_CURR(CURRout) , .wta_SUM(0) ,.wta_STA(0), .wta_STB(0) , .wta_STC(0) , .wta_A(0) , .wta_B(0) ,
             .wta_R(Rout) , .dataout(mux_out));
				 

BUS    A_bus(.WTA(mux_out), .PC(0), .IR(0), .AR(0), .DR(0), .TR(0), .IRAM(memout), .datain(datain), .BUS_OUT(bus));


always @(posedge clk2)
begin	
	//PC_out <= PCout;
	//DR_out <= DRout;
	//bus_out<= bus;
	//AC_out <= ACout;
	ctrlsig_out  <= ctrlsig;
end 

endmodule
