module memory_control(input clk,
						input [15:0]c1_AR,
						input [15:0]c2_AR,
						output reg [15:0]c1_Dmemout,
						output reg [15:0]c2_Dmemout);

reg [1:0]select;
reg [7:0]in_q1 ;
reg [7:0]in_q2 ;
reg [15:0]out_q1;
reg [15:0]out_q2;
reg [7:0]AR1;
reg [7:0]AR2= 8'd0;
reg [7:0]common_AR= 8'd0;
wire [15:0]k;
wire [15:0]Dmemout;

assign k = c1_AR;
data_memory     DRAM( .address(AR2), .clock(clk), .data(c1_DRout), .wren(0), .q(Dmemout));

always @ (posedge clk)
begin	
	AR1<=k;
	in_q1<=AR1;
	in_q2<=in_q1;
	AR2<=in_q2;
end

always @ (posedge clk)
begin
	if (c1_AR==c2_AR) select <= 2'b01;
	else select <= 2'b11;
//c1_Dmemout <= Dmemout;
end

always @ (posedge clk)
begin
	case (select)
		2'b01 : begin
				common_AR <= c1_AR;
				end
		2'b11 : begin
				AR1 <= c1_AR;
				AR2 <= c2_AR;
				end
	endcase
end

//assign AR = common_AR | AR1;


always @ (posedge clk)
begin	
	c1_Dmemout <= Dmemout;
	out_q1<=c1_Dmemout;
	out_q2<=out_q1; 
	c2_Dmemout<=out_q2;
end

	
endmodule
						
						

