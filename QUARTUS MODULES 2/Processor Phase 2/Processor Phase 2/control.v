module control(input clk,
				//output [2:0] present_out,
				//output [2:0] next_out,
			   output reg [14:0] ctrlsig);

reg [5:0] present = 6'd0;
reg [5:0] next = 6'd1;
//reg [9:0] ctrlsig;
 
parameter
add1 = 6'd0,
add2 = 6'd1,
add3 = 6'd2,
add4 = 6'd3,
add5 = 6'd4,
add6 = 6'd5,
add7 = 6'd6,
add8 = 6'd7;


//assign present_out = present;
//assign next_out = next;
//assign ctrlsig_out = ctrlsig;

always @(posedge clk)
	present <= next;

//always @(posedge clock)
//begin
//	if (present == endop)
//		end_process <= 1'd1;
//	else
//		end_process <= 1'd0;
//end

always @(present)
case(present)
	add1: begin
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 0;	//WTR_dec_en
		ctrlsig[3]  <= 0;	//DR_write_en
		ctrlsig[4]  <= 1;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 0;	//OPR_demux
		ctrlsig[7]  <= 0;	//OPR_demux
		ctrlsig[8]  <= 0;	//mem_read
		ctrlsig[9]  <= 0;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 0;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 0; //ALU_op
		//ctrlsig <= 10'b0000010000 ;
		next <= add2 ;
	end
	add2: begin
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 0;	//WTR_dec_en
		ctrlsig[3]  <= 1;	//DR_write_en
		ctrlsig[4]  <= 0;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 0;	//OPR_demux
		ctrlsig[7]  <= 0;	//OPR_demux
		ctrlsig[8]  <= 1;	//mem_read
		ctrlsig[9]  <= 0;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 0;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 0; //ALU_op
		//ctrlsig <= 10'b0000010000 ;
		next <= add3 ;
	end
	add3: begin
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 1;	//WTR_dec_en
		ctrlsig[3]  <= 0;	//DR_write_en
		ctrlsig[4]  <= 0;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 1;	//OPR_demux
		ctrlsig[7]  <= 1;	//OPR_demux
		ctrlsig[8]  <= 0;	//mem_read
		ctrlsig[9]  <= 0;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 0;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 0; //ALU_op
		//ctrlsig <= 10'b0100001000 ;
		next <= add4 ;
	end
	add4: begin
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 0;	//WTR_dec_en
		ctrlsig[3]  <= 0;	//DR_write_en
		ctrlsig[4]  <= 1;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 0;	//OPR_demux
		ctrlsig[7]  <= 0;	//OPR_demux
		ctrlsig[8]  <= 0;	//mem_read
		ctrlsig[9]  <= 0;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 0;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 0; //ALU_op
		//ctrlsig <= 10'b0010000100 ;
		next <= add5 ;
	end
	add5: begin
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 0;	//WTR_dec_en
		ctrlsig[3]  <= 1;	//DR_write_en
		ctrlsig[4]  <= 0;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 0;	//OPR_demux
		ctrlsig[7]  <= 0;	//OPR_demux
		ctrlsig[8]  <= 1;	//mem_read
		ctrlsig[9]  <= 0;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 0;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 0; //ALU_op
		//ctrlsig <= 10'b0000000000 ;
		next <= add6 ;
	end
	add6: begin
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 0;	//WTR_dec_en
		ctrlsig[3]  <= 0;	//DR_write_en
		ctrlsig[4]  <= 0;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 1;	//OPR_demux
		ctrlsig[7]  <= 0;	//OPR_demux
		ctrlsig[8]  <= 0;	//mem_read
		ctrlsig[9]  <= 1;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 0;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 1; //ALU_op
		// ctrlsig <= 10'b00000000000 ;
		next <= add7 ;
	end
	add7: begin
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 0;	//WTR_dec_en
		ctrlsig[3]  <= 0;	//DR_write_en
		ctrlsig[4]  <= 0;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 1;	//OPR_demux
		ctrlsig[7]  <= 0;	//OPR_demux
		ctrlsig[8]  <= 0;	//mem_read
		ctrlsig[9]  <= 1;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 1;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 0; //ALU_op
		// ctrlsig <= 10'b00000000000 ;
		next <= add8 ;
	end
	add8: begin
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 0;	//WTR_dec_en
		ctrlsig[3]  <= 0;	//DR_write_en
		ctrlsig[4]  <= 0;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 0;	//OPR_demux
		ctrlsig[7]  <= 0;	//OPR_demux
		ctrlsig[8]  <= 0;	//mem_read
		ctrlsig[9]  <= 0;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 0;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 0; //ALU_op
		// ctrlsig <= 10'b0000000000 ;
		next <= 6'b000000 ;
	end
	default: begin 
		ctrlsig[0]  <= 0;	//INC_dec_en
		ctrlsig[1]  <= 0;	//RST_dec_en
		ctrlsig[2]  <= 0;	//WTR_dec_en
		ctrlsig[3]  <= 0;	//DR_write_en
		ctrlsig[4]  <= 0;	//PC_write_en
		ctrlsig[5]  <= 0;	//OPR_demux
		ctrlsig[6]  <= 0;	//OPR_demux
		ctrlsig[7]  <= 0;	//OPR_demux
		ctrlsig[8]  <= 0;	//mem_read
		ctrlsig[9]  <= 0;	//WTA_en
		ctrlsig[10] <= 0;	//AC_write_en
		ctrlsig[11] <= 0;	//AC_ALU_write_en
		ctrlsig[12] <= 0;	//ALU_op
		ctrlsig[13] <= 0;	//ALU_op
		ctrlsig[14] <= 0; //ALU_op
		// ctrlsig <= 10'b0000000000 ;
		next = 3'b001;
	end
endcase

endmodule
