module control(input clk2,
					//output clk3,
					output reg [9:0] ctrlsig);

reg [5:0] present = 6'd1;
reg [5:0] next = 6'd1;
//reg [9:0] ctrlsig;
 
 
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

//assign ctrlsig_out = ctrlsig;
//assign clk3 = clk1;

always @(posedge clk1)
	present <= next;

always @(present)
case(present)
3'b001: begin
ctrlsig <= 10'b0000010000 ;
next <= 3'b010 ;
end

3'b010: begin
ctrlsig <= 10'b0000010000 ;
next <= 3'b011 ;
end

add3: begin
ctrlsig <= 10'b0100001000 ;
next <= add4 ;
end

add4: begin
ctrlsig <= 10'b0001100100 ;
next <= add5 ;
end

add5: begin
ctrlsig <= 10'b0000000000 ;
next <= add6 ;
end

add6: begin
ctrlsig <= 10'b00000000000 ;
next <= add7 ;
end

add7: begin
ctrlsig <= 10'b00000000000 ;
next <= add8 ;
end

add8: begin
ctrlsig <= 10'b0000000000 ;
next <= 6'b111111 ;
end

default: begin 
ctrlsig <= 10'b0000000000 ;
next = 3'b001;
end

endcase

endmodule
