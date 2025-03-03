module statemachine(input clk,input [1:0]inst,input z,output reg [14:0]control_signal);

localparam div1 = 6'd7;
localparam mul1 = 6'd6;
localparam add3 = 6'd5;
localparam add2 = 6'd4;
localparam add1 = 6'd3;
localparam fetch2 = 6'd2;
localparam fetch1 = 6'd1;
localparam fetch0 = 6'd0;


reg [5:0] present_state, next_state;

always @ (present_state,inst,z)
begin
	case(present_state)
	div1:
	begin
		next_state = fetch0;
		// if (inst==1'b0 && z==1'b1)
		// 	next_state = add1;
		// else if (inst==1'b1 && z == 1'b1)
		// 	next_state = fetch1;
		// else
		// 	next_state = fetch0;
	end
	mul1:
	begin
		next_state = fetch0;
		// if (inst==1'b0 && z==1'b1)
		// 	next_state = add1;
		// else if (inst==1'b1 && z == 1'b1)
		// 	next_state = fetch1;
		// else
		// 	next_state = fetch0;
	end
	add3:
	begin
		next_state = fetch0;
		// if (inst==1'b0 && z==1'b1)
		// 	next_state = add1;
		// else if (inst==1'b1 && z == 1'b1)
		// 	next_state = fetch1;
		// else
		// 	next_state = fetch0;
	end
	add2:
	begin
		next_state = add3;
		// if (inst==1'b0 && z==1'b1)
		// 	next_state = add1;
		// else if (inst==1'b1 && z == 1'b1)
		// 	next_state = fetch1;
		// else
		// 	next_state = fetch0;
	end
	add1:
	begin
		next_state = add2;
		// if (inst==1'b0 && z==1'b1)
		// 	next_state = fetch2;
		// else if (inst==1'b1 && z == 1'b1)
		// 	next_state = add2;
		// else
		// 	next_state = fetch0;
	end
	fetch2:
	begin
		if (inst==2'b00 && z==1'b0)
			next_state = add1;
		else if (inst==2'b00 && z == 1'b1)
			next_state = mul1;
		else
			next_state = div1;
	end
	fetch1:
	begin
		next_state = fetch2;
		// if (inst==1'b0 && z==1'b1)
		// 	next_state = add2;
		// else if (inst==1'b1 && z == 1'b1)
		// 	next_state = fetch2;
		// else
		// 	next_state = fetch0;
	end
	fetch0:
	begin
		next_state = fetch1;
		// if (z==1'b1)
		// 	next_state = fetch1;
		// else
		// 	next_state = fetch0;
	end
	default:
		next_state = fetch0;
	endcase
end
			
always @ (posedge clk)
begin
	if (present_state == add2)
	begin
		control_signal[0]  <= 0;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 0;	//WTR_dec_en
		control_signal[3]  <= 0;	//DR_write_en
		control_signal[4]  <= 1;	//PC_write_en
		control_signal[5]  <= 0;	//OPR_demux
		control_signal[6]  <= 0;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 0;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b1000;
	end
	else if (present_state == add1)
	begin
		control_signal[0]  <= 0;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 0;	//WTR_dec_en
		control_signal[3]  <= 0;	//DR_write_en
		control_signal[4]  <= 0;	//PC_write_en
		control_signal[5]  <= 0;	//OPR_demux
		control_signal[6]  <= 0;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 0;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b0100;
	end
	else if (present_state == fetch2)
	begin
		control_signal[0]  <= 0;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 0;	//WTR_dec_en
		control_signal[3]  <= 0;	//DR_write_en
		control_signal[4]  <= 0;	//PC_write_en
		control_signal[5]  <= 0;	//OPR_demux
		control_signal[6]  <= 0;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 0;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b0010;
	end
	else if (present_state == fetch1)
	begin
		control_signal[0]  <= 0;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 0;	//WTR_dec_en
		control_signal[3]  <= 1;	//DR_write_en
		control_signal[4]  <= 0;	//PC_write_en
		control_signal[5]  <= 0;	//OPR_demux
		control_signal[6]  <= 0;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 1;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b0101;
	end
	else if (present_state == fetch1)
	begin
		control_signal[0]  <= 1;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 0;	//WTR_dec_en
		control_signal[3]  <= 1;	//DR_write_en
		control_signal[4]  <= 1;	//PC_write_en
		control_signal[5]  <= 0;	//OPR_demux
		control_signal[6]  <= 0;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 0;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b0101;
	end
	else if (present_state == fetch1)
	begin
		control_signal[0]  <= 0;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 0;	//WTR_dec_en
		control_signal[3]  <= 1;	//DR_write_en
		control_signal[4]  <= 0;	//PC_write_en
		control_signal[5]  <= 0;	//OPR_demux
		control_signal[6]  <= 0;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 1;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b0101;
	end
	else if (present_state == fetch1)
	begin
		control_signal[0]  <= 0;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 0;	//WTR_dec_en
		control_signal[3]  <= 1;	//DR_write_en
		control_signal[4]  <= 0;	//PC_write_en
		control_signal[5]  <= 0;	//OPR_demux
		control_signal[6]  <= 0;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 1;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b0101;
	end
	else if (present_state == fetch1)
	begin
		control_signal[0]  <= 0;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 0;	//WTR_dec_en
		control_signal[3]  <= 1;	//DR_write_en
		control_signal[4]  <= 0;	//PC_write_en
		control_signal[5]  <= 0;	//OPR_demux
		control_signal[6]  <= 0;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 1;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b0101;
	end	
	else
	begin
		control_signal[0]  <= 0;	//INC_dec_en
		control_signal[1]  <= 0;	//RST_dec_en
		control_signal[2]  <= 1;	//WTR_dec_en
		control_signal[3]  <= 0;	//DR_write_en
		control_signal[4]  <= 0;	//PC_write_en
		control_signal[5]  <= 1;	//OPR_demux
		control_signal[6]  <= 1;	//OPR_demux
		control_signal[7]  <= 0;	//OPR_demux
		control_signal[8]  <= 0;	//mem_read
		control_signal[9]  <= 0;	//WTA_en
		control_signal[10] <= 0;	//AC_write_en
		control_signal[11] <= 0;	//AC_ALU_write_en
		control_signal[12] <= 0;	//ALU_op
		control_signal[13] <= 0;	//ALU_op
		control_signal[14] <= 0; //ALU_op
		// control_signal = 4'b0000;
	end
end

always @ (posedge clk)
begin 
	present_state = next_state;
end


endmodule
