module multicore1(input clock_en,		
				input clk2,
				input controlRST,
				output Clock_LED,
				output segmentA, segmentB, segmentC, segmentD, segmentE, segmentF, segmentG,
				output segmentA1, segmentB1, segmentC1, segmentD1, segmentE1, segmentF1, segmentG1,
				output segmentA2, segmentB2, segmentC2, segmentD2, segmentE2, segmentF2, segmentG2,
				output segmentA3, segmentB3, segmentC3, segmentD3, segmentE3, segmentF3, segmentG3,
				output segmentA4, segmentB4, segmentC4, segmentD4, segmentE4, segmentF4, segmentG4,
				output segmentA5, segmentB5, segmentC5, segmentD5, segmentE5, segmentF5, segmentG5,
				output segmentA6, segmentB6, segmentC6, segmentD6, segmentE6, segmentF6, segmentG6,
				output segmentA7, segmentB7, segmentC7, segmentD7, segmentE7, segmentF7, segmentG7,
				output [7:0]bus_out,
				output [24:0]ctrlsig_out,
				output endp,
				output Zout);

reg [2:0]select_core = 3'd1;
reg [15:0] countCLK;
reg [15:0] storecount;
wire c1_endop;

wire [15:0]PCout;
wire [23:0]memout;

wire [15:0]ar1out;
wire [15:0]ar2out;
wire [15:0]ar3out;
wire [15:0]ar4out;
wire [12:0]mem_sig;
				
wire LED1;
wire LED2;
wire LED3;	
wire LED4;
wire [15:0]c1_PCout;
reg [23:0]c1_memout;
wire [15:0]c2_PCout;
reg [23:0]c2_memout;
wire [15:0]c3_PCout;
reg [23:0]c3_memout;
wire [15:0]c4_PCout;
reg [23:0]c4_memout;
wire [15:0]c1_ARout;
wire [15:0]c1_Dmemout;
wire [15:0]c2_ARout;
wire [15:0]c2_Dmemout;
wire [15:0]c3_ARout;
wire [15:0]c3_Dmemout;
wire [15:0]c4_ARout;
wire [15:0]c4_Dmemout;
wire [15:0]c1_DRout;
wire [15:0]c2_DRout;
wire [15:0]c3_DRout;
wire [15:0]c4_DRout;
wire [24:0]c1_ctrlsig_out;
wire [24:0]c2_ctrlsig_out;
wire [24:0]c3_ctrlsig_out;
wire [24:0]c4_ctrlsig_out;
wire [15:0]c1_Rout;
wire [15:0]c2_Rout;
wire [15:0]c3_Rout;
wire [15:0]c4_Rout;

wire c1_A,c1_B,c1_C,c1_D,c1_E,c1_F,c1_G;
wire c1_A1,c1_B1,c1_C1,c1_D1,c1_E1,c1_F1,c1_G1;
wire c1_A2,c1_B2,c1_C2,c1_D2,c1_E2,c1_F2,c1_G2;
wire c1_A3,c1_B3,c1_C3,c1_D3,c1_E3,c1_F3,c1_G3;
wire c1_A4,c1_B4,c1_C4,c1_D4,c1_E4,c1_F4,c1_G4;
wire c1_A5,c1_B5,c1_C5,c1_D5,c1_E5,c1_F5,c1_G5;
wire c1_A6,c1_B6,c1_C6,c1_D6,c1_E6,c1_F6,c1_G6;
wire c1_A7,c1_B7,c1_C7,c1_D7,c1_E7,c1_F7,c1_G7;

wire c2_A,c2_B,c2_C,c2_D,c2_E,c2_F,c2_G;
wire c2_A1,c2_B1,c2_c2,c2_D1,c2_E1,c2_F1,c2_G1;
wire c2_A2,c2_B2,c2_C2,c2_D2,c2_E2,c2_F2,c2_G2;
wire c2_A3,c2_B3,c2_C3,c2_D3,c2_E3,c2_F3,c2_G3;
wire c2_A4,c2_B4,c2_C4,c2_D4,c2_E4,c2_F4,c2_G4;
wire c2_A5,c2_B5,c2_C5,c2_D5,c2_E5,c2_F5,c2_G5;
wire c2_A6,c2_B6,c2_C6,c2_D6,c2_E6,c2_F6,c2_G6;
wire c2_A7,c2_B7,c2_C7,c2_D7,c2_E7,c2_F7,c2_G7;

wire c3_A,c3_B,c3_C,c3_D,c3_E,c3_F,c3_G;
wire c3_A1,c3_B1,c3_c3,c3_D1,c3_E1,c3_F1,c3_G1;
wire c3_A2,c3_B2,c3_C2,c3_D2,c3_E2,c3_F2,c3_G2;
wire c3_A3,c3_B3,c3_C3,c3_D3,c3_E3,c3_F3,c3_G3;
wire c3_A4,c3_B4,c3_C4,c3_D4,c3_E4,c3_F4,c3_G4;
wire c3_A5,c3_B5,c3_C5,c3_D5,c3_E5,c3_F5,c3_G5;
wire c3_A6,c3_B6,c3_C6,c3_D6,c3_E6,c3_F6,c3_G6;
wire c3_A7,c3_B7,c3_C7,c3_D7,c3_E7,c3_F7,c3_G7;

wire c4_A,c4_B,c4_C,c4_D,c4_E,c4_F,c4_G;
wire c4_A1,c4_B1,c4_c4,c4_D1,c4_E1,c4_F1,c4_G1;
wire c4_A2,c4_B2,c4_C2,c4_D2,c4_E2,c4_F2,c4_G2;
wire c4_A3,c4_B3,c4_C3,c4_D3,c4_E3,c4_F3,c4_G3;
wire c4_A4,c4_B4,c4_C4,c4_D4,c4_E4,c4_F4,c4_G4;
wire c4_A5,c4_B5,c4_C5,c4_D5,c4_E5,c4_F5,c4_G5;
wire c4_A6,c4_B6,c4_C6,c4_D6,c4_E6,c4_F6,c4_G6;
wire c4_A7,c4_B7,c4_C7,c4_D7,c4_E7,c4_F7,c4_G7;

scaledclock clock(.inclk(clk2),.ena(clock_en),.clk(clk));

initial countCLK = 0; 

always @ (posedge clk) 
begin
	countCLK <= countCLK + 1'b1;
	//if (c1_endop==1)    storecount <= countCLK;
end

always @ (posedge c1_endop)
begin
	storecount <= countCLK;
end

instruction_memory    IRAM(.clock(clk), .address(PCout), .data(storecount), .wren(c1_endop), .q(memout));
//data_memory     DRAM( .address(c1_ARout), .clock(clk), .data(c1_DRout), .wren(c1_ctrlsig15), .q(c1_Dmemout));
//data_memory1     RAM1( .address(c2_ARout), .clock(clk), .data(c2_DRout), .wren(c2_ctrlsig15), .q(c2_Dmemout));
//data_memory2     RAM2( .address(c3_ARout), .clock(clk), .data(c3_DRout), .wren(c3_ctrlsig15), .q(c3_Dmemout));
//data_memory3     RAM3( .address(c4_ARout), .clock(clk), .data(c4_DRout), .wren(c4_ctrlsig15), .q(c4_Dmemout));

////////////////////////////////////////////////////////////////////////////						  
mem_control MEMCU(.clk(clk),.c1_AR(c1_ARout),.c2_AR(c2_ARout),.c3_AR(c3_ARout),.c4_AR(c4_ARout),.mem_ctrl(mem_sig),
						.DR1out(c1_Dmemout),.DR2out(c2_Dmemout),.DR3out(c3_Dmemout),.DR4out(c4_Dmemout),.Ar1out(ar1out),
						.Ar2out(ar2out),.Ar3out(ar3out),.Ar4out(ar4out),.data1(c1_DRout), .data2(c2_DRout), .data3(c3_DRout),
						   .data4(c4_DRout));
////////////////////////////////////////////////////////////////////////////
Mem_state CU(.clk(clk), .memory_state(c1_ctrlsig_out[24:23]), .NoCin(c1_Rout), .mem_ctrl(mem_sig));

assign PCout = c1_PCout;
reg [2:0]sel;

always @ (*) begin
	if ((c1_PCout ^ c2_PCout) != 16'd0) sel<=3'b001;
	else if ((c1_PCout ^ c3_PCout) != 16'd0) sel<=3'b010;
	else if ((c1_PCout ^ c4_PCout) != 16'd0) sel<=3'b100;
	else sel <= 3'b000;
end
	
always @ (*)
begin
case (sel) 
 3'b100:begin
			c1_memout = memout;
			c2_memout = memout;
			c3_memout = memout;
			c4_memout = 0;
		end
 3'b010:begin
		   c1_memout = memout;
		   c2_memout = memout;	
			c3_memout = 0;
			c4_memout = 0; 
		end
 3'b001:begin
		   c1_memout = memout;
		   c2_memout = 0;	
			c3_memout = 0;
			c4_memout = 0; 
		end 
 default:begin
			c1_memout = memout;
			c2_memout = memout;
			c3_memout = memout;
			c4_memout = memout;
		end
endcase
end

outputmux selectcore(. c1_segmentA(c1_A),. c1_segmentB(c1_B),. c1_segmentC(c1_C),. c1_segmentD(c1_D),. c1_segmentE(c1_E),. c1_segmentF(c1_F),. c1_segmentG(c1_G),
				. c1_segmentA1(c1_A1),. c1_segmentB1(c1_B1),. c1_segmentC1(c1_C1),. c1_segmentD1(c1_D1),. c1_segmentE1(c1_E1),. c1_segmentF1(c1_F1),. c1_segmentG1(c1_G1),
				. c1_segmentA2(c1_A2),. c1_segmentB2(c1_B2),. c1_segmentC2(c1_C2),. c1_segmentD2(c1_D2),. c1_segmentE2(c1_E2),. c1_segmentF2(c1_F2),. c1_segmentG2(c1_G2),
				. c1_segmentA3(c1_A3),. c1_segmentB3(c1_B3),. c1_segmentC3(c1_C3),. c1_segmentD3(c1_D3),. c1_segmentE3(c1_E3),. c1_segmentF3(c1_F3),. c1_segmentG3(c1_G3),
				. c1_segmentA4(c1_A4),. c1_segmentB4(c1_B4),. c1_segmentC4(c1_C4),. c1_segmentD4(c1_D4),. c1_segmentE4(c1_E4),. c1_segmentF4(c1_F4),. c1_segmentG4(c1_G4),
				. c1_segmentA5(c1_A5),. c1_segmentB5(c1_B5),. c1_segmentC5(c1_C5),. c1_segmentD5(c1_D5),. c1_segmentE5(c1_E5),. c1_segmentF5(c1_F5),. c1_segmentG5(c1_G5),
				. c1_segmentA6(c1_A6),. c1_segmentB6(c1_B6),. c1_segmentC6(c1_C6),. c1_segmentD6(c1_D6),. c1_segmentE6(c1_E6),. c1_segmentF6(c1_F6),. c1_segmentG6(c1_G6),
				. c1_segmentA7(c1_A7),. c1_segmentB7(c1_B7),. c1_segmentC7(c1_C7),. c1_segmentD7(c1_D7),. c1_segmentE7(c1_E7),. c1_segmentF7(c1_F7),. c1_segmentG7(c1_G7),
				. c1_bus_out(c1_bus_out),
				. c1_ctrlsig_out(c1_ctrlsig_out),
				. c1_endp(c1_endop),
				. c1_Zout(c1_Zout),
				
				. c2_segmentA(c2_A),. c2_segmentB(c2_B),. c2_segmentC(c2_C),. c2_segmentD(c2_D),. c2_segmentE(c2_E),. c2_segmentF(c2_F),. c2_segmentG(c2_G),
				. c2_segmentA1(c2_A1),. c2_segmentB1(c2_B1),. c2_segmentC1(c2_c2),. c2_segmentD1(c2_D1),. c2_segmentE1(c2_E1),. c2_segmentF1(c2_F1),. c2_segmentG1(c2_G1),
				. c2_segmentA2(c2_A2),. c2_segmentB2(c2_B2),. c2_segmentC2(c2_C2),. c2_segmentD2(c2_D2),. c2_segmentE2(c2_E2),. c2_segmentF2(c2_F2),. c2_segmentG2(c2_G2),
				. c2_segmentA3(c2_A3),. c2_segmentB3(c2_B3),. c2_segmentC3(c2_C3),. c2_segmentD3(c2_D3),. c2_segmentE3(c2_E3),. c2_segmentF3(c2_F3),. c2_segmentG3(c2_G3),
				. c2_segmentA4(c2_A4),. c2_segmentB4(c2_B4),. c2_segmentC4(c2_C4),. c2_segmentD4(c2_D4),. c2_segmentE4(c2_E4),. c2_segmentF4(c2_F4),. c2_segmentG4(c2_G4),
				. c2_segmentA5(c2_A5),. c2_segmentB5(c2_B5),. c2_segmentC5(c2_C5),. c2_segmentD5(c2_D5),. c2_segmentE5(c2_E5),. c2_segmentF5(c2_F5),. c2_segmentG5(c2_G5),
				. c2_segmentA6(c2_A6),. c2_segmentB6(c2_B6),. c2_segmentC6(c2_C6),. c2_segmentD6(c2_D6),. c2_segmentE6(c2_E6),. c2_segmentF6(c2_F6),. c2_segmentG6(c2_G6),
				. c2_segmentA7(c2_A7),. c2_segmentB7(c2_B7),. c2_segmentC7(c2_C7),. c2_segmentD7(c2_D7),. c2_segmentE7(c2_E7),. c2_segmentF7(c2_F7),. c2_segmentG7(c2_G7),
				. c2_bus_out(c2_bus_out),
				. c2_ctrlsig_out(c2_ctrlsig_out),
				. c2_endp(c2_endop),
				. c2_Zout(c2_Zout),
				
				. c3_segmentA(c3_A),. c3_segmentB(c3_B),. c3_segmentC(c3_C),. c3_segmentD(c3_D),. c3_segmentE(c3_E),. c3_segmentF(c3_F),. c3_segmentG(c3_G),
				. c3_segmentA1(c3_A1),. c3_segmentB1(c3_B1),. c3_segmentC1(c3_c3),. c3_segmentD1(c3_D1),. c3_segmentE1(c3_E1),. c3_segmentF1(c3_F1),. c3_segmentG1(c3_G1),
				. c3_segmentA2(c3_A2),. c3_segmentB2(c3_B2),. c3_segmentC2(c3_C2),. c3_segmentD2(c3_D2),. c3_segmentE2(c3_E2),. c3_segmentF2(c3_F2),. c3_segmentG2(c3_G2),
				. c3_segmentA3(c3_A3),. c3_segmentB3(c3_B3),. c3_segmentC3(c3_C3),. c3_segmentD3(c3_D3),. c3_segmentE3(c3_E3),. c3_segmentF3(c3_F3),. c3_segmentG3(c3_G3),
				. c3_segmentA4(c3_A4),. c3_segmentB4(c3_B4),. c3_segmentC4(c3_C4),. c3_segmentD4(c3_D4),. c3_segmentE4(c3_E4),. c3_segmentF4(c3_F4),. c3_segmentG4(c3_G4),
				. c3_segmentA5(c3_A5),. c3_segmentB5(c3_B5),. c3_segmentC5(c3_C5),. c3_segmentD5(c3_D5),. c3_segmentE5(c3_E5),. c3_segmentF5(c3_F5),. c3_segmentG5(c3_G5),
				. c3_segmentA6(c3_A6),. c3_segmentB6(c3_B6),. c3_segmentC6(c3_C6),. c3_segmentD6(c3_D6),. c3_segmentE6(c3_E6),. c3_segmentF6(c3_F6),. c3_segmentG6(c3_G6),
				. c3_segmentA7(c3_A7),. c3_segmentB7(c3_B7),. c3_segmentC7(c3_C7),. c3_segmentD7(c3_D7),. c3_segmentE7(c3_E7),. c3_segmentF7(c3_F7),. c3_segmentG7(c3_G7),
				. c3_bus_out(c3_bus_out),
				. c3_ctrlsig_out(c3_ctrlsig_out),
				. c3_endp(c3_endop),
				. c3_Zout(c3_Zout),
				
				. c4_segmentA(c4_A),. c4_segmentB(c4_B),. c4_segmentC(c4_C),. c4_segmentD(c4_D),. c4_segmentE(c4_E),. c4_segmentF(c4_F),. c4_segmentG(c4_G),
				. c4_segmentA1(c4_A1),. c4_segmentB1(c4_B1),. c4_segmentC1(c4_c4),. c4_segmentD1(c4_D1),. c4_segmentE1(c4_E1),. c4_segmentF1(c4_F1),. c4_segmentG1(c4_G1),
				. c4_segmentA2(c4_A2),. c4_segmentB2(c4_B2),. c4_segmentC2(c4_C2),. c4_segmentD2(c4_D2),. c4_segmentE2(c4_E2),. c4_segmentF2(c4_F2),. c4_segmentG2(c4_G2),
				. c4_segmentA3(c4_A3),. c4_segmentB3(c4_B3),. c4_segmentC3(c4_C3),. c4_segmentD3(c4_D3),. c4_segmentE3(c4_E3),. c4_segmentF3(c4_F3),. c4_segmentG3(c4_G3),
				. c4_segmentA4(c4_A4),. c4_segmentB4(c4_B4),. c4_segmentC4(c4_C4),. c4_segmentD4(c4_D4),. c4_segmentE4(c4_E4),. c4_segmentF4(c4_F4),. c4_segmentG4(c4_G4),
				. c4_segmentA5(c4_A5),. c4_segmentB5(c4_B5),. c4_segmentC5(c4_C5),. c4_segmentD5(c4_D5),. c4_segmentE5(c4_E5),. c4_segmentF5(c4_F5),. c4_segmentG5(c4_G5),
				. c4_segmentA6(c4_A6),. c4_segmentB6(c4_B6),. c4_segmentC6(c4_C6),. c4_segmentD6(c4_D6),. c4_segmentE6(c4_E6),. c4_segmentF6(c4_F6),. c4_segmentG6(c4_G6),
				. c4_segmentA7(c4_A7),. c4_segmentB7(c4_B7),. c4_segmentC7(c4_C7),. c4_segmentD7(c4_D7),. c4_segmentE7(c4_E7),. c4_segmentF7(c4_F7),. c4_segmentG7(c4_G7),
				. c4_bus_out(c4_bus_out),
				. c4_ctrlsig_out(c4_ctrlsig_out),
				. c4_endp(c4_endop),
				. c4_Zout(c4_Zout),
				
				. segmentA(segmentA),. segmentB(segmentB),. segmentC(segmentC),. segmentD(segmentD),. segmentE(segmentE),. segmentF(segmentF),. segmentG(segmentG),
				. segmentA1(segmentA1),. segmentB1(segmentB1),. segmentC1(segmentC1),. segmentD1(segmentD1),. segmentE1(segmentE1),. segmentF1(segmentF1),. segmentG1(segmentG1),
				. segmentA2(segmentA2),. segmentB2(segmentB2),. segmentC2(segmentC2),. segmentD2(segmentD2),. segmentE2(segmentE2),. segmentF2(segmentF2),. segmentG2(segmentG2),
				. segmentA3(segmentA3),. segmentB3(segmentB3),. segmentC3(segmentC3),. segmentD3(segmentD3),. segmentE3(segmentE3),. segmentF3(segmentF3),. segmentG3(segmentG3),
				. segmentA4(segmentA4),. segmentB4(segmentB4),. segmentC4(segmentC4),. segmentD4(segmentD4),. segmentE4(segmentE4),. segmentF4(segmentF4),. segmentG4(segmentG4),
				. segmentA5(segmentA5),. segmentB5(segmentB5),. segmentC5(segmentC5),. segmentD5(segmentD5),. segmentE5(segmentE5),. segmentF5(segmentF5),. segmentG5(segmentG5),
				. segmentA6(segmentA6),. segmentB6(segmentB6),. segmentC6(segmentC6),. segmentD6(segmentD6),. segmentE6(segmentE6),. segmentF6(segmentF6),. segmentG6(segmentG6),
				. segmentA7(segmentA7),. segmentB7(segmentB7),. segmentC7(segmentC7),. segmentD7(segmentD7),. segmentE7(segmentE7),. segmentF7(segmentF7),. segmentG7(segmentG7),
				. bus_out(bus_out),
				. ctrlsig_out(ctrlsig_out),
				. endp(endp),
				. Zout(Zout),
				. select_core(select_core));
				
				 
phase_6 core1(. coreID(3'd0),.clock_en(clock_en),		
				 .clk2(clk2),
				 .controlRST(controlRST),
				 .Clock_LED(Clock_LED),
				 .segmentA(c1_A), .segmentB(c1_B), .segmentC(c1_C), .segmentD(c1_D), .segmentE(c1_E), .segmentF(c1_F), .segmentG(c1_G),
				 .segmentA1(c1_A1), .segmentB1(c1_B1), .segmentC1(c1_C1), .segmentD1(c1_D1), .segmentE1(c1_E1), .segmentF1(c1_F1), .segmentG1(c1_G1),				
				 .segmentA2(c1_A2), .segmentB2(c1_B2), .segmentC2(c1_C2), .segmentD2(c1_D2), .segmentE2(c1_E2), .segmentF2(c1_F2), .segmentG2(c1_G2),				
				 .segmentA3(c1_A3), .segmentB3(c1_B3), .segmentC3(c1_C3), .segmentD3(c1_D3), .segmentE3(c1_E3), .segmentF3(c1_F3), .segmentG3(c1_G3),				
				 .segmentA4(c1_A4), .segmentB4(c1_B4), .segmentC4(c1_C4), .segmentD4(c1_D4), .segmentE4(c1_E4), .segmentF4(c1_F4), .segmentG4(c1_G4),				
				 .segmentA5(c1_A5), .segmentB5(c1_B5), .segmentC5(c1_C5), .segmentD5(c1_D5), .segmentE5(c1_E5), .segmentF5(c1_F5), .segmentG5(c1_G5),				
				 .segmentA6(c1_A6), .segmentB6(c1_B6), .segmentC6(c1_C6), .segmentD6(c1_D6), .segmentE6(c1_E6), .segmentF6(c1_F6), .segmentG6(c1_G6),				
				 .segmentA7(c1_A7), .segmentB7(c1_B7), .segmentC7(c1_C7), .segmentD7(c1_D7), .segmentE7(c1_E7), .segmentF7(c1_F7), .segmentG7(c1_G7),				
				 .bus_out(c1_bus_out),
				 .ctrlsig_out(c1_ctrlsig_out),
				 .endp(c1_endop),
				 .Zout(c1_Zout),
				 .PCout1(c1_PCout),
				 .memout1(c1_memout),
				 .ARout1(c1_ARout),
				 .Dmemout1(c1_Dmemout),
				 .DRout1(c1_DRout),
				 .Rout1(c1_Rout));
				 
phase_6 core2(. coreID(3'd1),.clock_en(clock_en),		
				 .clk2(clk2),
				 .controlRST(controlRST),
				 .Clock_LED(LED2),
				 .segmentA(c2_A), .segmentB(c2_B), .segmentC(c2_C), .segmentD(c2_D), .segmentE(c2_E), .segmentF(c2_F), .segmentG(c2_G),
				 .segmentA1(c2_A1), .segmentB1(c2_B1), .segmentC1(c2_C1), .segmentD1(c2_D1), .segmentE1(c2_E1), .segmentF1(c2_F1), .segmentG1(c2_G1),				
				 .segmentA2(c2_A2), .segmentB2(c2_B2), .segmentC2(c2_C2), .segmentD2(c2_D2), .segmentE2(c2_E2), .segmentF2(c2_F2), .segmentG2(c2_G2),				
				 .segmentA3(c2_A3), .segmentB3(c2_B3), .segmentC3(c2_C3), .segmentD3(c2_D3), .segmentE3(c2_E3), .segmentF3(c2_F3), .segmentG3(c2_G3),				
				 .segmentA4(c2_A4), .segmentB4(c2_B4), .segmentC4(c2_C4), .segmentD4(c2_D4), .segmentE4(c2_E4), .segmentF4(c2_F4), .segmentG4(c2_G4),				
				 .segmentA5(c2_A5), .segmentB5(c2_B5), .segmentC5(c2_C5), .segmentD5(c2_D5), .segmentE5(c2_E5), .segmentF5(c2_F5), .segmentG5(c2_G5),				
				 .segmentA6(c2_A6), .segmentB6(c2_B6), .segmentC6(c2_C6), .segmentD6(c2_D6), .segmentE6(c2_E6), .segmentF6(c2_F6), .segmentG6(c2_G6),				
				 .segmentA7(c2_A7), .segmentB7(c2_B7), .segmentC7(c2_C7), .segmentD7(c2_D7), .segmentE7(c2_E7), .segmentF7(c2_F7), .segmentG7(c2_G7),				
				 .bus_out(c2_bus_out),
				 .ctrlsig_out(c2_ctrlsig_out),
				 .endp(c2_endop),
				 .Zout(c2_Zout),
				 .PCout1(c2_PCout),
				 .memout1(c2_memout),
				 .ARout1(c2_ARout),
				 .Dmemout1(c2_Dmemout),
				 .DRout1(c2_DRout),
				 .Rout1(c2_Rout));
				 
phase_6 core3(. coreID(3'd2),.clock_en(clock_en),		
				 .clk2(clk2),
				 .controlRST(controlRST),
				 .Clock_LED(LED3),
				 .segmentA(c3_A), .segmentB(c3_B), .segmentC(c3_C), .segmentD(c3_D), .segmentE(c3_E), .segmentF(c3_F), .segmentG(c3_G),
				 .segmentA1(c3_A1), .segmentB1(c3_B1), .segmentC1(c3_c3), .segmentD1(c3_D1), .segmentE1(c3_E1), .segmentF1(c3_F1), .segmentG1(c3_G1),				
				 .segmentA2(c3_A2), .segmentB2(c3_B2), .segmentC2(c3_C2), .segmentD2(c3_D2), .segmentE2(c3_E2), .segmentF2(c3_F2), .segmentG2(c3_G2),				
				 .segmentA3(c3_A3), .segmentB3(c3_B3), .segmentC3(c3_C3), .segmentD3(c3_D3), .segmentE3(c3_E3), .segmentF3(c3_F3), .segmentG3(c3_G3),				
				 .segmentA4(c3_A4), .segmentB4(c3_B4), .segmentC4(c3_C4), .segmentD4(c3_D4), .segmentE4(c3_E4), .segmentF4(c3_F4), .segmentG4(c3_G4),				
				 .segmentA5(c3_A5), .segmentB5(c3_B5), .segmentC5(c3_C5), .segmentD5(c3_D5), .segmentE5(c3_E5), .segmentF5(c3_F5), .segmentG5(c3_G5),				
				 .segmentA6(c3_A6), .segmentB6(c3_B6), .segmentC6(c3_C6), .segmentD6(c3_D6), .segmentE6(c3_E6), .segmentF6(c3_F6), .segmentG6(c3_G6),				
				 .segmentA7(c3_A7), .segmentB7(c3_B7), .segmentC7(c3_C7), .segmentD7(c3_D7), .segmentE7(c3_E7), .segmentF7(c3_F7), .segmentG7(c3_G7),				
				 .bus_out(c3_bus_out),
				 .ctrlsig_out(c3_ctrlsig_out),
				 .endp(c3_endop),
				 .Zout(c3_Zout),
				 .PCout1(c3_PCout),
				 .memout1(c3_memout),
				 .ARout1(c3_ARout),
				 .Dmemout1(c3_Dmemout),
				 .DRout1(c3_DRout),
				 .Rout1(c3_Rout));

phase_6 core4(. coreID(3'd3),.clock_en(clock_en),		
				 .clk2(clk2),
				 .controlRST(controlRST),
				 .Clock_LED(LED4),
				 .segmentA(c4_A), .segmentB(c4_B), .segmentC(c4_C), .segmentD(c4_D), .segmentE(c4_E), .segmentF(c4_F), .segmentG(c4_G),
				 .segmentA1(c4_A1), .segmentB1(c4_B1), .segmentC1(c4_c4), .segmentD1(c4_D1), .segmentE1(c4_E1), .segmentF1(c4_F1), .segmentG1(c4_G1),				
				 .segmentA2(c4_A2), .segmentB2(c4_B2), .segmentC2(c4_C2), .segmentD2(c4_D2), .segmentE2(c4_E2), .segmentF2(c4_F2), .segmentG2(c4_G2),				
				 .segmentA3(c4_A3), .segmentB3(c4_B3), .segmentC3(c4_C3), .segmentD3(c4_D3), .segmentE3(c4_E3), .segmentF3(c4_F3), .segmentG3(c4_G3),				
				 .segmentA4(c4_A4), .segmentB4(c4_B4), .segmentC4(c4_C4), .segmentD4(c4_D4), .segmentE4(c4_E4), .segmentF4(c4_F4), .segmentG4(c4_G4),				
				 .segmentA5(c4_A5), .segmentB5(c4_B5), .segmentC5(c4_C5), .segmentD5(c4_D5), .segmentE5(c4_E5), .segmentF5(c4_F5), .segmentG5(c4_G5),				
				 .segmentA6(c4_A6), .segmentB6(c4_B6), .segmentC6(c4_C6), .segmentD6(c4_D6), .segmentE6(c4_E6), .segmentF6(c4_F6), .segmentG6(c4_G6),				
				 .segmentA7(c4_A7), .segmentB7(c4_B7), .segmentC7(c4_C7), .segmentD7(c4_D7), .segmentE7(c4_E7), .segmentF7(c4_F7), .segmentG7(c4_G7),				
				 .bus_out(c4_bus_out),
				 .ctrlsig_out(c4_ctrlsig_out),
				 .endp(c4_endop),
				 .Zout(c4_Zout),
				 .PCout1(c4_PCout),
				 .memout1(c4_memout),
				 .ARout1(c4_ARout),
				 .Dmemout1(c4_Dmemout),
				 .DRout1(c4_DRout),
				 .Rout1(c4_Rout));
	 
endmodule
				 