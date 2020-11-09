module memandFSM(input clk2,
					  input clock_en,
					  input [1:0]state,
					  output Clock_LED,
					  output[12:0] ctrlsig_out,
				
				output segmentA, segmentB, segmentC, segmentD, segmentE, segmentF, segmentG,
				output segmentA1, segmentB1, segmentC1, segmentD1, segmentE1, segmentF1, segmentG1,
				output segmentA2, segmentB2, segmentC2, segmentD2, segmentE2, segmentF2, segmentG2,
				output segmentA3, segmentB3, segmentC3, segmentD3, segmentE3, segmentF3, segmentG3,
				output segmentA4, segmentB4, segmentC4, segmentD4, segmentE4, segmentF4, segmentG4,
				output segmentA5, segmentB5, segmentC5, segmentD5, segmentE5, segmentF5, segmentG5,
				output segmentA6, segmentB6, segmentC6, segmentD6, segmentE6, segmentF6, segmentG6,
				output segmentA7, segmentB7, segmentC7, segmentD7, segmentE7, segmentF7, segmentG7);
				
wire [15:0]dr1out;
wire [15:0]dr2out;
wire [15:0]dr3out;
wire [15:0]dr4out;
wire [15:0]ar1out;
wire [15:0]ar2out;
wire [15:0]ar3out;
wire [15:0]ar4out;
wire [12:0]mem_sig;

assign ctrlsig_out  = mem_sig;
assign Clock_LED = clk;

scaledclock clock(.inclk(clk2),.ena(clock_en),.clk(clk));

bin27 AR1(.clk(clk2),.datain(dr1out),.segmentA(segmentA),.segmentB(segmentB),.segmentC(segmentC),.segmentD(segmentD),
                      .segmentE(segmentE), .segmentF(segmentF), .segmentG(segmentG) );
							 
bin27 AR2(.clk(clk2),.datain(dr2out),.segmentA(segmentA1),.segmentB(segmentB1),.segmentC(segmentC1),.segmentD(segmentD1),
                      .segmentE(segmentE1),.segmentF(segmentF1), .segmentG(segmentG1) );

bin27 AR3(.clk(clk2),.datain(dr3out),.segmentA(segmentA2),.segmentB(segmentB2),.segmentC(segmentC2),.segmentD(segmentD2),
                      .segmentE(segmentE2),.segmentF(segmentF2), .segmentG(segmentG2) );
							 
bin27 AR4(.clk(clk2),.datain(dr4out),.segmentA(segmentA3),.segmentB(segmentB3),.segmentC(segmentC3),.segmentD(segmentD3),
                      .segmentE(segmentE3), .segmentF(segmentF3), .segmentG(segmentG3) );	
	
bin27 DR1(.clk(clk2),.datain(ar1out),.segmentA(segmentA4),.segmentB(segmentB4),.segmentC(segmentC4),.segmentD(segmentD4),
                      .segmentE(segmentE4), .segmentF(segmentF4), .segmentG(segmentG4) );	

bin27 DR2(.clk(clk2),.datain(ar2out),.segmentA(segmentA5),.segmentB(segmentB5),.segmentC(segmentC5),.segmentD(segmentD5),
                      .segmentE(segmentE5), .segmentF(segmentF5), .segmentG(segmentG5) );	
	
bin27 DR3(.clk(clk2),.datain(ar3out),.segmentA(segmentA6),.segmentB(segmentB6),.segmentC(segmentC6),.segmentD(segmentD6),
                      .segmentE(segmentE6), .segmentF(segmentF6), .segmentG(segmentG6) );
							 
bin27 DR4(.clk(clk2),.datain(ar4out),.segmentA(segmentA7),.segmentB(segmentB7),.segmentC(segmentC7),.segmentD(segmentD7),
                    .segmentE(segmentE7), .segmentF(segmentF7), .segmentG(segmentG7) );
						  
////////////////////////////////////////////////////////////////////////////						  
mem_control MEMCU(.clk(clk),.c1_AR(8'd1),.c2_AR(8'd2),.c3_AR(8'd3),.c4_AR(8'd4),.mem_ctrl(mem_sig),.DR1out(dr1out),.DR2out(dr2out),.DR3out(dr3out),
							.DR4out(dr4out),.Ar1out(ar1out),.Ar2out(ar2out),.Ar3out(ar3out),.Ar4out(ar4out),	.data1(16'd9), .data2(16'd8), .data3(16'd7),
						   .data4(16'd6));
////////////////////////////////////////////////////////////////////////////
Mem_state CU(.clk(clk), .memory_state(3), .mem_ctrl(mem_sig));

endmodule
