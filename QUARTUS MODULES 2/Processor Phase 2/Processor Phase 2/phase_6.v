//file name: phase_6.v
//module for phase 7 of ccss-processor design
//intergrates all the modules and the control unit for a single core

module phase_6(	input [3:0]datain,
				input clk,  
				input clk2,
				output segmentA, segmentB, segmentC, segmentD, segmentE, segmentF, segmentG,
				output segmentA1, segmentB1, segmentC1, segmentD1, segmentE1, segmentF1, segmentG1,
				output segmentA2, segmentB2, segmentC2, segmentD2, segmentE2, segmentF2, segmentG2,
				output segmentA3, segmentB3, segmentC3, segmentD3, segmentE3, segmentF3, segmentG3,
				output segmentA4, segmentB4, segmentC4, segmentD4, segmentE4, segmentF4, segmentG4,
				output segmentA5, segmentB5, segmentC5, segmentD5, segmentE5, segmentF5, segmentG5,
				output segmentA6, segmentB6, segmentC6, segmentD6, segmentE6, segmentF6, segmentG6,
				output segmentA7, segmentB7, segmentC7, segmentD7, segmentE7, segmentF7, segmentG7,
				output [7:0]bus_out,
				output [14:0]ctrlsig_out);


wire [14:0]ctrlsig;

//internal register wires
wire [15:0]CoreIDout;
wire [15:0]IRout;
wire [15:0]ARout;
wire [15:0]PCout;
wire [15:0]DRout;
wire [15:0]ACout;

//register wires
wire [15:0]Nout;
wire [15:0]Mout;
wire [15:0]Pout;
wire [15:0]R1out;
wire [15:0]ROWout;
wire [15:0]COLout;
wire [15:0]CURRout;
wire [15:0]SUMout;
wire [15:0]STAout;
wire [15:0]STBout;
wire [15:0]STCout;
wire [15:0]Rout;

//buffer outputs
wire [15:0]CoreIDbufout;
wire [15:0]PCbufout;
wire [15:0]ACbufout;

//OPR Demux wires
wire [7:0]WTR;   //OPR=011
wire [7:0]INC;   //OPR=100
wire [7:0]RESET; //OPR=001
wire [7:0]WTA;   //OPR=010

//INC Decoder
wire row_INC;   //DR=1
wire col_INC;   //DR=2
wire curr_INC;  //DR=3
wire sta_INC;   //DR=4
wire stb_INC;   //DR=5
wire stc_INC;   //DR=6
wire r1_INC;    //DR=7

//RESET Decoder
wire row_RST;   //DR=1
wire col_RST;   //DR=2
wire curr_RST;  //DR=3
wire sum_RST;   //DR=4

//WTR Decoder
wire wrt_n;    //DR=1
wire wrt_m;    //DR=2
wire wrt_p;    //DR=3
wire wrt_r1;   //DR=4
wire wrt_row;  //DR=5
wire wrt_col;  //DR=6
wire wrt_curr; //DR=7
wire wrt_sum;  //DR=8
wire wrt_sta;  //DR=9
wire wrt_stb;  //DR=10
wire wrt_stc;  //DR=11
wire wrt_a;    //DR=12
wire wrt_b;    //DR=13
wire wrt_r;    //DR=14

//miscellaneous  wires
wire [15:0]bus;
wire [15:0]memout;
wire [15:0]mux_out;
wire [15:0]ALU_out;

wire z;

//abaclock clock(.inclk(clk2),.ena(1),.clk(clk1));

//control signal displays and bus display
assign ctrlsig_out = ctrlsig;
assign bus_out = bus;

//register displays
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

bin27 display_reg_R(.clk(clk2),.datain(Rout),.segmentA(segmentA5),.segmentB(segmentB5),.segmentC(segmentC5),.segmentD(segmentD5),
                      .segmentE(segmentE5), .segmentF(segmentF5), .segmentG(segmentG5) );	
	
bin27 display_reg_AC(.clk(clk2),.datain(ACout),.segmentA(segmentA6),.segmentB(segmentB6),.segmentC(segmentC6),.segmentD(segmentD6),
                      .segmentE(segmentE6), .segmentF(segmentF6), .segmentG(segmentG6) );
bin27 display_reg_SUM(.clk(clk2),.datain(SUMout),.segmentA(segmentA7),.segmentB(segmentB7),.segmentC(segmentC7),.segmentD(segmentD7),
                    .segmentE(segmentE7), .segmentF(segmentF7), .segmentG(segmentG7) );

//statemachine-->control signal generator
control CU(.clk(clk),.ctrlsig(ctrlsig));

//instruction memory
memory    IRAM(.clk(clk),.read_en(ctrlsig[8]), .addr(PCout), .datain(0), .dataout(memout));

//ALU
alu ALU(.clk(clk2),.in1(ACout), .in2(bus), .alu_op(ctrlsig[14:12]), .alu_out(ALU_out), .z(z) );

//combinational blocks
INC_Decoder   inc(.INC_sel(INC), .INC_en(ctrlsig[0]),.inc_ROW(row_INC) ,.inc_COL(col_INC) ,.inc_CURR(curr_INC),.inc_STA(sta_INC) ,
				  .inc_STB(stb_INC) ,.inc_STC(stc_INC) ,.inc_R1(r1_INC) );
RST_Decoder   rst(.RST_sel(RESET),.RST_en(ctrlsig[1]),.rst_ROW(row_RST) ,.rst_COL(col_RST) ,.rst_CURR(curr_RST),.rst_SUM(sum_RST) );
WTR_Decoder   wrt( .WTR_sel(WTR), .WTR_en(ctrlsig[2]),.wtr_N(common_INC) , .wtr_M(common_INC), .wtr_P(wrt_p) ,.wtr_ROW(wrt_row), 
				   .wtr_COL(wrt_col) , .wtr_CURR(wrt_curr) , .wtr_SUM(wrt_sum) ,.wtr_R(wrt_r) ,.wtr_STA(wrt_sta),.wtr_STB(wrt_stb) ,
				   .wtr_STC(wrt_stc) ,.wtr_A(wrt_a) ,.wtr_B(wrt_b) ,.wtr_R1(wrt_r1) );
OPR_demux  demux1( .operand(DRout), .OPR_sel(ctrlsig[7:5]), .WTR_operand(WTR), .INC_operand(INC), .RESET_operand(RESET), .WTA_operand(WTA));
WTA_mux   mux1(.WTA_sel(WTA), .WTA_en(ctrlsig[9]), .wta_N(0) , .wta_M(0) , .wta_P(0) , .wta_R1(0) , .wta_ROW(ROWout), .wta_COL(COLout), 
             .wta_CURR(CURRout) , .wta_SUM(SUMout) ,.wta_STA(0), .wta_STB(0) , .wta_STC(0) , .wta_A(0) , .wta_B(0) ,
             .wta_R(Rout) , .dataout(mux_out));
BUS    A_bus(.WTA(mux_out), .PC(PCbufout), .IR(0), .AR(0), .DR(0), .AC(ACbufout), .IRAM(memout), .datain(datain), .BUS_OUT(bus));

//internal registers			 
reg_type1_16bit  reg_CoreID(.clk(clk), .write_en(0) , .datain(bus) , .dataout(CoreIDout));
reg_type1_16bit  reg_IR(.clk(clk), .write_en(0) , .datain(bus) , .dataout(IRout));
reg_type2_16bit  reg_AR(.clk(clk), .write_en(0) , .datain(bus) ,.inc(0), .dataout(ARout));
reg_type3_16bit  reg_PC(.clk(clk), .write_en(ctrlsig[4]),.datain(bus),.inc(0), .reset(0),.dataout(PCout));
reg_type1_16bit  reg_DR(.clk(clk), .write_en(ctrlsig[3]) , .datain(bus) , .dataout(DRout));
reg_ac           reg_AC( .clk(clk), .write_en(ctrlsig[10]), .datain(bus), .alu_write_en(ctrlsig[11]), .alu_out(ALU_out), .dataout(ACout));

//configurable registers
reg_type1_16bit  reg_N(.clk(clk), .write_en(0) , .datain(bus) , .dataout(Nout));
reg_type1_16bit  reg_M(.clk(clk), .write_en(0) , .datain(bus) , .dataout(Mout));
reg_type1_16bit  reg_P(.clk(clk), .write_en(0) , .datain(bus) , .dataout(Pout));
reg_type2_16bit  reg_R1(.clk(clk), .write_en(0) , .datain(bus) , .inc(0), .dataout(R1out));
reg_type3_16bit  reg_ROW(.clk(clk), .write_en(wrt_row),.datain(bus), .inc(row_INC), .reset(row_RST), .dataout(ROWout));
reg_type3_16bit  reg_COL(.clk(clk), .write_en(wrt_col),.datain(bus), .inc(col_INC), .reset(col_RST), .dataout(COLout));
reg_type3_16bit  reg_CURR(.clk(clk), .write_en(wrt_curr),.datain(bus), .inc(curr_INC), .reset(curr_RST), .dataout(CURRout));
reg_SUM          SUM(.clk(clk),.write_en(0),.datain(bus),.reset(0),.dataout(SUMout));
reg_type2_16bit  reg_STA(.clk(clk), .write_en(0) , .datain(bus) ,.inc(0), .dataout(STAout));
reg_type2_16bit  reg_STB(.clk(clk), .write_en(0) , .datain(bus) ,.inc(0), .dataout(STBout));
reg_type2_16bit  reg_STC(.clk(clk), .write_en(0) , .datain(bus) ,.inc(0), .dataout(STCout));
reg_type1_16bit  reg_R(.clk(clk), .write_en(wrt_r), .datain(bus), .dataout(Rout));

//read buffers
read_buffer_16bit readCoreID(.read_en(0),.datain(CoreIDout),.dataout(CoreIDbufout));
read_buffer_16bit readPC(.read_en(0),.datain(PCout),.dataout(PCbufout));
read_buffer_16bit readAC(.read_en(0),.datain(ACout),.dataout(ACbufout));

endmodule
