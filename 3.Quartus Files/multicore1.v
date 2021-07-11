module multicore1(input clock_en,		
				input clk2,
				input controlRST,
				output [23:0]bus_out,
				output [24:0]ctrlsig_out,
				output endp,
				output Zout
				);

reg [2:0]select_core = 3'd1;
reg [23:0] countCLK;
reg [23:0] storecount;
wire c1_endop;

wire [15:0]PCout;
wire [23:0]memout;

wire [15:0]ar1out;
wire [15:0]ar2out;
wire [15:0]ar3out;
wire [15:0]ar4out;
wire [12:0]mem_sig;

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

wire [23:0]c1_bus_out;
wire [23:0]c2_bus_out;
wire [23:0]c3_bus_out;
wire [23:0]c4_bus_out;


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


////IRAM and DRAM
////////////////////////////////////////////////////////////////////////////
instruction_memory    IRAM(.clock(clk), .address(PCout), .data(storecount), .wren(c1_endop), .q(memout));

////////////////////////////////////////////////////////////////////////////						  
mem_control MEMCU(.clk(clk),.c1_AR(c1_ARout),.c2_AR(c2_ARout),.c3_AR(c3_ARout),.c4_AR(c4_ARout),.mem_ctrl(mem_sig),
						.DR1out(c1_Dmemout),.DR2out(c2_Dmemout),.DR3out(c3_Dmemout),.DR4out(c4_Dmemout),.Ar1out(ar1out),
						.Ar2out(ar2out),.Ar3out(ar3out),.Ar4out(ar4out),.data1(c1_DRout), .data2(c2_DRout), .data3(c3_DRout),
						.data4(c4_DRout),
						.address1(address1),
						.data_in1(data_in1),
						.mem_bus1(mem_bus1));
						
////////////////////////////////////////////////////////////////////////////
Mem_state CU(.clk(clk), .memory_state(c1_ctrlsig_out[24:23]), .NoCin(c1_Rout), .mem_ctrl(mem_sig));

////////////////////////////////////////////////////////////////////////////

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

outputmux_simulation selectcore(
				. c1_bus_out(c1_bus_out),
				. c1_ctrlsig_out(c1_ctrlsig_out),
				. c1_endp(c1_endop),
				. c1_Zout(c1_Zout),
				. c2_bus_out(c2_bus_out),
				. c2_ctrlsig_out(c2_ctrlsig_out),
				. c2_endp(c2_endop),
				. c2_Zout(c2_Zout),			
				. c3_bus_out(c3_bus_out),
				. c3_ctrlsig_out(c3_ctrlsig_out),
				. c3_endp(c3_endop),
				. c3_Zout(c3_Zout),				
				. c4_bus_out(c4_bus_out),
				. c4_ctrlsig_out(c4_ctrlsig_out),
				. c4_endp(c4_endop),
				. c4_Zout(c4_Zout),
				
				. bus_out(bus_out),
				. ctrlsig_out(ctrlsig_out),
				. endp(endp),
				. Zout(Zout),
				. select_core(select_core));
				

//instantiation of the four cores				
phase_6 core1(. coreID(16'd0),.clock_en(clock_en),		
				 .clk2(clk2),
				 .controlRST(controlRST),			
				 .bus_out(c1_bus_out),
				 .ctrlsig_out(c1_ctrlsig_out),
				 .endp(c1_endop),
				 .Zout(c1_Zout),
				 .PCout1(c1_PCout),
				 .memout1(c1_memout),
				 .ARout1(c1_ARout),
				 .Dmemout1(c1_Dmemout),
				 .DRout1(c1_DRout),
				 .Rout1(c1_Rout)
				);
				 
phase_6 core2(. coreID(16'd1),.clock_en(clock_en),		
				 .clk2(clk2),
				 .controlRST(controlRST),
				 .bus_out(c2_bus_out),
				 .ctrlsig_out(c2_ctrlsig_out),
				 .endp(c2_endop),
				 .Zout(c2_Zout),
				 .PCout1(c2_PCout),
				 .memout1(c2_memout),
				 .ARout1(c2_ARout),
				 .Dmemout1(c2_Dmemout),
				 .DRout1(c2_DRout),
				 .Rout1(c2_Rout)
				);
				 
phase_6 core3(. coreID(16'd2),.clock_en(clock_en),		
				 .clk2(clk2),
				 .controlRST(controlRST),
				 .bus_out(c3_bus_out),
				 .ctrlsig_out(c3_ctrlsig_out),
				 .endp(c3_endop),
				 .Zout(c3_Zout),
				 .PCout1(c3_PCout),
				 .memout1(c3_memout),
				 .ARout1(c3_ARout),
				 .Dmemout1(c3_Dmemout),
				 .DRout1(c3_DRout),
				 .Rout1(c3_Rout)

				);

phase_6 core4(. coreID(16'd3),.clock_en(clock_en),		
				 .clk2(clk2),
				 .controlRST(controlRST),
				 .bus_out(c4_bus_out),
				 .ctrlsig_out(c4_ctrlsig_out),
				 .endp(c4_endop),
				 .Zout(c4_Zout),
				 .PCout1(c4_PCout),
				 .memout1(c4_memout),
				 .ARout1(c4_ARout),
				 .Dmemout1(c4_Dmemout),
				 .DRout1(c4_DRout),
				 .Rout1(c4_Rout)
				);
	 
endmodule
				 