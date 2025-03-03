 module alu( input clk,
				 input [15:0] in1,    //AC operand 
				 input [15:0] in2,    //operand from reg
				 input [2:0] alu_op,
				 
				 output reg [15:0] alu_out,
				 output reg z );

	
	always @(posedge clk)
		begin
			case(alu_op)
				3'd1: alu_out <= in1 + in2;
				3'd2: alu_out <= in1 ^ in2;
			   3'd3: alu_out <= in1 * in2;
				3'd4: alu_out <= in1 / in2;
				3'd5: alu_out <= in1 % in2;
				3'd6: alu_out <= in1 * 3'd2;
				3'd7: alu_out <= in1 - in2;
				default: alu_out <= alu_out;
				
			endcase

			if (alu_out==16'd0)
				z <= 1;
			else
				z <= 0;
			end

endmodule
