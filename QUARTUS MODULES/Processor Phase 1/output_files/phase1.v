module phase1 (input [15:0]datain,
					input clk,
					input [28:0]ctrlsig,
					
					output reg [15:0]dataout);
					

wire [15:0]R_out;
wire [15:0]mux_out;
wire [15:0]bus;
wire [15:0]ALU_out;
wire z;

reg_type1_16bit reg_R(.clk(clk), .write_en(1), .datain(datain), .dataout(R_out));

WTA_mux mux1(.WTA_sel(4'd14), .WTA_en(ctrlsig[1]), .wta_N(0) , .wta_M(0) , .wta_P(0) , .wta_R1(0) , .wta_ROW(0), .wta_COL(0), 
             .wta_CURR(0) , .wta_SUM(0) ,.wta_STA(0), .wta_STB(0) , .wta_STC(0) , .wta_A(0) , .wta_B(0) ,
             .wta_R(R_out) , .dataout(mux_out));
				 
BUS A_bus(.WTA(mux_out), .PC(0), .IR(0), .AR(0), .DR(0), .TR(0), .BUS_OUT(bus));

reg_ac AC( .clk(clk), .write_en(ctrlsig[2]), .datain(bus), .alu_write_en(ctrlsig[3]), .alu_out(ALU_out), .dataout(dataout));

alu( .clk(clk), .in1(dataout), .in2(bus), .alu_op(ctrlsig[6:4]), .alu_out(ALU_out), .z(z) );

endmodule


					 
  