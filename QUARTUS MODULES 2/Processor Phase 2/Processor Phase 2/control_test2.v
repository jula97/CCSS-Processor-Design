module control_test2(input clk2,
					output reg [3:0] dataout,
					output clk3);

reg [5:0] present = 6'd0;
reg [5:0] next = 6'd1;
reg [12:0]ctrlsig;

parameter
add1 = 6'd1,
add2 = 6'd2,
add3 = 6'd3,
add4 = 6'd4,
add5 = 6'd5,
add6 = 6'd6,
add7 = 6'd7,
add8 = 6'd8;

abaclock clock(.inclk(clk2),.ena(1),.clk(clk1));

assign clk3 = clk1;

always @(posedge clk1)
begin	
	present <= next;
	dataout <= ctrlsig[6:0];
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

endmodule
