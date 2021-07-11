module mem_control(input clk,
						input [15:0]c1_AR,
						input [15:0]c2_AR,
						input [15:0]c3_AR,
						input [15:0]c4_AR,
						input [12:0]mem_ctrl,
						output [15:0]DR1out,
						output [15:0]DR2out,
						output [15:0]DR3out,
						output [15:0]DR4out,
						output [15:0]Ar1out,
						output [15:0]Ar2out,
						output [15:0]Ar3out,
						output [15:0]Ar4out,
						input [15:0]data1,
						input [15:0]data2,
						input [15:0]data3,
						input [15:0]data4,
						output [15:0]address1,
						output [15:0]data_in1,
						output [15:0]mem_bus1
						);

wire [15:0]mem_bus;
wire [15:0]AR1out;
wire [15:0]AR2out;
wire [15:0]AR3out;
wire [15:0]AR4out;
wire [15:0]AR1bufout;
wire [15:0]AR2bufout;
wire [15:0]AR3bufout;
wire [15:0]AR4bufout;
wire [15:0]data1bufout;
wire [15:0]data2bufout;
wire [15:0]data3bufout;
wire [15:0]data4bufout;
wire [15:0]address;
wire [15:0]data_in;

assign address1 = address;
assign data_in1 = data_in;
assign mem_bus1 = mem_bus;

assign Ar1out = AR1out;
assign Ar2out = AR2out;
assign Ar3out = AR3out;
assign Ar4out = AR4out;

reg_type1_16bit  AR1(.clk(clk), .write_en(1) , .datain(c1_AR) , .dataout(AR1out));
reg_type1_16bit  AR2(.clk(clk), .write_en(1) , .datain(c2_AR) , .dataout(AR2out));
reg_type1_16bit  AR3(.clk(clk), .write_en(1) , .datain(c3_AR) , .dataout(AR3out));
reg_type1_16bit  AR4(.clk(clk), .write_en(1) , .datain(c4_AR) , .dataout(AR4out));
reg_type1_16bit  DR1(.clk(clk), .write_en(mem_ctrl[0]) , .datain(mem_bus) , .dataout(DR1out));
reg_type1_16bit  DR2(.clk(clk), .write_en(mem_ctrl[1]) , .datain(mem_bus) , .dataout(DR2out));
reg_type1_16bit  DR3(.clk(clk), .write_en(mem_ctrl[2]) , .datain(mem_bus) , .dataout(DR3out));
reg_type1_16bit  DR4(.clk(clk), .write_en(mem_ctrl[3]) , .datain(mem_bus) , .dataout(DR4out));

read_buffer_16bit readAR1(.read_en(mem_ctrl[4]),.datain(AR1out),.dataout(AR1bufout));
read_buffer_16bit readAR2(.read_en(mem_ctrl[5]),.datain(AR2out),.dataout(AR2bufout));
read_buffer_16bit readAR3(.read_en(mem_ctrl[6]),.datain(AR3out),.dataout(AR3bufout));
read_buffer_16bit readAR4(.read_en(mem_ctrl[7]),.datain(AR4out),.dataout(AR4bufout));

read_buffer_16bit readDATA1(.read_en(mem_ctrl[8]),.datain(data1),.dataout(data1bufout));
read_buffer_16bit readDATA2(.read_en(mem_ctrl[9]),.datain(data2),.dataout(data2bufout));
read_buffer_16bit readDATA3(.read_en(mem_ctrl[10]),.datain(data3),.dataout(data3bufout));
read_buffer_16bit readDATA4(.read_en(mem_ctrl[11]),.datain(data4),.dataout(data4bufout));

assign address = AR1bufout | AR2bufout | AR3bufout | AR4bufout;
assign data_in  = data1bufout | data2bufout | data3bufout | data4bufout;

data_memory     DRAM( .address(address), .clock(clk), .data(data_in), .wren(mem_ctrl[12]), .q(mem_bus));

endmodule
