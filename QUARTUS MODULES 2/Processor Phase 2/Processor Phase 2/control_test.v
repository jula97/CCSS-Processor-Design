module control_test(input clk2,
					output [6:0]ctrlsig_out,
					output [2:0]R_out,
					output [2:0]DR_out,
					output clk3);

reg [5:0] present=6'd0;
reg [5:0] next=6'd1;
reg [12:0]ctrlsig ;
/*
parameter
add1 = 6'd1,
3'b002 = 6'd2,
3'b011 = 6'd3,
3'b100 = 6'd4,
3'b101 = 6'd5,
3'b110 = 6'd6,
3'b111 = 6'd7;*/

//clock_test_Clock_divider CLOCK(.clock_in(clk2), .clock_out(clk1));

abaclock clock(.inclk(clk2),.ena(1),.clk(clk1));

assign clk3 = clk1; 
assign conn = ctrlsig;
assign R_out = present[2:0];
assign DR_out = next[2:0];

/*always @ (posedge clk1)
begin
		if (clk3 == 1'd0)
			clk3 <= 1'd1;
		else if (clk3 == 1'd1)
			clk3 <= 1'd0;
end*/


always @(posedge clk1)
begin	
	present = next;
	present = present +0;
	present = present *1;
end


always @ (present) 
case(present)
3'b001: begin
ctrlsig = 7'b1111111;
next = 3'b010 ;
end

3'b010: begin
ctrlsig = 7'b1111110 ;
next = 3'b011 ;
end

3'b011: begin
ctrlsig = 7'b1111100 ;
next = 3'b100 ;
end

3'b100: begin
ctrlsig = 7'b1111000 ;
next = 3'b101 ;
end

3'b101: begin
ctrlsig = 7'b1110000 ;
next = 3'b110 ;
end

3'b110: begin
ctrlsig = 7'b1100000 ;
next = 3'b111 ;
end

3'b111: begin
ctrlsig = 7'b1000000 ;
next = 3'b000 ;
end


default: begin 
ctrlsig = 7'b1010101 ;
next = 3'b001;
end
endcase


/*
always @(posedge clk1)
begin	
	conn <= ctrlsig[6:0];
end
*/
	endmodule
