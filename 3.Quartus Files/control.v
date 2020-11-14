module control(input clk,
					input z,
					input [5:0]instruction_opcode,
					input rst,
					input [15:0]NoC,
			      output reg [24:0] ctrlsig,
					output reg end_process);

reg [6:0] present = 7'd0;
reg [6:0] next = 7'd1;

 
parameter
fetch1     = 7'd0,
fetch2     = 7'd1,
fetch3     = 7'd2,
fetch4     = 7'd3,

add1       = 7'd5,
add2       = 7'd6,

xor1       = 7'd8,
xor2       = 7'd9,

mul1       = 7'd11,
mul2       = 7'd12,

ldac1      = 7'd14,
ldac2      = 7'd15,
ldac3      = 7'd16,
ldac4      = 7'd17,
ldac5      = 7'd18,
ldac6      = 7'd19,
ldac7      = 7'd20,

moveac1    = 7'd21,

movetoac1  = 7'd22,

div1       = 7'd24,
div2       = 7'd25,

mod1       = 7'd27,
mod2       = 7'd28,

inc1       = 7'd32,

reset1     = 7'd34,

stac1      = 7'd36,
stac2      = 7'd37,
stac3      = 7'd38,

jump1      = 7'd40,

jumpzy1    = 7'd42,

jumpzn1    = 7'd44,
clac1      = 7'd45,
nop1       = 7'd46,
ldacreg1   = 7'd47,
ldacreg2   = 7'd48,
ldacreg3   = 7'd49,
ldacreg4   = 7'd50,
ldacreg5   = 7'd51,
ldacreg6   = 7'd52,
ldacreg7   = 7'd53,

stacreg1   = 7'd54,
stacreg2   = 7'd55,
stacreg3   = 7'd56,
stacreg4   = 7'd57,
stacreg5   = 7'd58,
stacreg6   = 7'd59,
stacreg7   = 7'd76,
stacreg8   = 7'd77,
stacreg9   = 7'd78,
stacreg10  = 7'd79,
stacreg11  = 7'd80,
stacreg12  = 7'd81,
stacreg13  = 7'd82,
stacreg14  = 7'd83,
stacreg15  = 7'd84,

ldacmulti1 = 7'd60,
ldacmulti2 = 7'd61,
ldacmulti3 = 7'd62,
ldacmulti4 = 7'd63,
ldacmulti5 = 7'd64,
ldacmulti6 = 7'd65,
ldacmulti7 = 7'd66,
ldacmulti8 = 7'd67,
ldacmulti9 = 7'd68,
ldacmulti10= 7'd69,
ldacmulti11= 7'd70,
ldacmulti12= 7'd71,
ldacmulti13= 7'd72,
ldacmulti14= 7'd73,
ldacmulti15= 7'd74,
ldacmulti16= 7'd75,

endop      = 7'd85;




always @(posedge clk or posedge rst)
begin 
	if (rst == 1)
	present <= fetch1;
	else
	present <= next;
end

always @(posedge clk)
begin
	if (present == endop)
	end_process <= 1'd1;
	else
	end_process <= 1'd0;
end



always @(present)
case(present)
	fetch1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
	   ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state		
		next <= fetch2 ;
	end
	fetch2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
	   ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en	
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch3;
	end
	fetch3: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 1;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 1;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 1;		//IR_write_en
		ctrlsig[19]   <= 1;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state
      next <= fetch4;		
	end
	fetch4: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en		
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state
		 if      (instruction_opcode == 5'd01)   next <= clac1;
       else if (instruction_opcode == 5'd02)   next <= ldac1;
       else if (instruction_opcode == 5'd03)   next <= stac1;
       else if (instruction_opcode == 5'd04)   next <= jump1;
       else if (instruction_opcode == 5'd05)   next <= moveac1;
       else if (instruction_opcode == 5'd06)   next <= movetoac1;
       else if (instruction_opcode == 5'd07)   next <= add1;
       else if (instruction_opcode == 5'd08)   next <= xor1;
       else if (instruction_opcode == 5'd09)   next <= mul1;
       else if (instruction_opcode == 5'd10)   next <= div1;
       else if (instruction_opcode == 5'd11)   next <= mod1;
       else if (instruction_opcode == 5'd13)   next <= inc1;
       else if (instruction_opcode == 5'd14)   next <= reset1;
       else if (instruction_opcode == 5'd15)   next <= nop1;	 
       else if ((instruction_opcode == 5'd16)&(z==1)) next <= jumpzy1;
       else if ((instruction_opcode == 5'd16)&(z==0)) next <= jumpzn1;
		 else if (instruction_opcode == 5'd17)   next <= ldacreg1;
       else if (instruction_opcode == 5'd18)   next <= stacreg1;
		 else if (instruction_opcode == 5'd19)   next <= ldacmulti1;
       else    next <= endop;		

	end
////////////////////////////////////////////////////////////////////
	add1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b001;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= add2 ;
	end
	add2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 1;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
//////////////////////////////////////////////////////////////////////	
	xor1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b010;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= xor2 ;
	end
	xor2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 1;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
/////////////////////////////////////////////////////////////////////
	mul1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b011;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= mul2 ;
	end
	mul2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 1;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
/////////////////////////////////////////////////////////////////////	
	ldac1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 1;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 1;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldac2 ;
	end
	ldac2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldac3 ;
	end
	ldac3: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldac4 ;
	end	
	ldac4: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldac5 ;
	end	
	ldac5: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldac6 ;
	end
	ldac6: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 1;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 1;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldac7 ;
	end
	ldac7: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 1;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 1;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
///////////////////////////////////////////////////////////////////////	
	moveac1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 1;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b011;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 1;		//AC_read_en
		ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1;
	end
/////////////////////////////////////////////////////////////////////
	movetoac1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 1;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
		ctrlsig[21]   <= 0;		//DR_read_en
		ctrlsig[22]   <= 0;		//AC_reset
		ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state		
 		next <= fetch1;
	end
////////////////////////////////////////////////////////////////////
	div1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b100;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= div2 ;
	end
	div2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 1;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
/////////////////////////////////////////////////////////////////////
	mod1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b101;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state		
		next <= mod2 ;
	end
	mod2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 1;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
/////////////////////////////////////////////////////////////////////
	inc1: begin
		ctrlsig[0]    <= 1;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b100;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
/////////////////////////////////////////////////////////////////////	
	reset1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 1;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b001;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
/////////////////////////////////////////////////////////////////////
	stac1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 1;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 1;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= stac2 ;
	end
	stac2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 1;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 1;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 1;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= stac3 ;
	end
	stac3: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 1;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end	
/////////////////////////////////////////////////////////////////////
	nop1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
/////////////////////////////////////////////////////////////////////
	clac1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 1;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1;
	end
////////////////////////////////////////////////////////////////////
	jump1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 1;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 1;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1;
	end	
///////////////////////////////////////////////////////////////////		
	jumpzy1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 1;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 1;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1;
	end
///////////////////////////////////////////////////////////////////	
	jumpzn1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1;
	end
/////////////////////////////////////////////////////////////	
	ldacreg1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 1;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
		ctrlsig[21]   <= 0;		//DR_read_en
		ctrlsig[22]   <= 0;		//AC_reset
		ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state		
 		next <= ldacreg2;
	end
	ldacreg2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldacreg3 ;
	end
	ldacreg3: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldacreg4 ;
	end
	ldacreg4: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldacreg5 ;
	end
	ldacreg5: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldacreg6 ;
	end	
	ldacreg6: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 1;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 1;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldacreg7 ;
	end
	ldacreg7: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 1;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 1;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
//////////////////////////////////////////////////////////////	
	stacreg1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 1;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
		ctrlsig[21]   <= 0;		//DR_read_en
		ctrlsig[22]   <= 0;		//AC_reset
		ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state		
 		next <= stacreg2;
	end
	stacreg2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 1;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 1;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= stacreg3 ;
	end
	stacreg3: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state	
		next <= stacreg4;			
	end
	stacreg4: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state	
		if      (NoC == 15'd1)  next <= fetch1;		
		else    next <= stacreg5;
	end
	stacreg5: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state	
		if      (NoC == 15'd2)  next <= fetch1;		
		else    next <= stacreg6;	
	end	
	stacreg6: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state		
		if      (NoC == 15'd2)  next <= fetch1;		
		else    next <= stacreg7 ;
	end
	stacreg7: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en			
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 1;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= fetch1 ;
	end		

/////////////////////////////////////////////////////////////////////	
/////////////////////////////////////////////////////////////////////	
	ldacmulti1: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b010;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 1;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 1;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldacmulti2 ;
	end
	ldacmulti2: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti3 ;
	end
	ldacmulti3: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti4 ;
	end
	ldacmulti4: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti5 ;
	end
	ldacmulti5: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state	
		if (NoC == 15'd01 )   next <= ldacmulti15;
		else	next <= ldacmulti6 ;
	end
	ldacmulti6: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti7 ;
	end
	ldacmulti7: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti8 ;
	end
	ldacmulti8: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state	
		if (NoC == 15'd02 )   next <= ldacmulti15;
		else	next <= ldacmulti9 ;
	end
	ldacmulti9: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti10 ;
	end
	ldacmulti10: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti11 ;
	end
	ldacmulti11: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state
		if (NoC == 15'd03 )   next <= ldacmulti15;
		else	next <= ldacmulti12 ;
	end
	ldacmulti12: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti13 ;
	end
	ldacmulti13: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti14 ;
	end
	ldacmulti14: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 1;		//mem_state			
		next <= ldacmulti15 ;
	end
	ldacmulti15: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 1;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 1;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc	
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= ldacmulti16 ;
	end
	ldacmulti16: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 1;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 1;		//DR_read_en
      ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next <= fetch1 ;
	end
///////////////////////////////////////////////////////////////////////	
	endop: begin
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
	   ctrlsig[21]   <= 0;		//DR_read_en		
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state		
		next <= endop;
	end
	default: begin 
		ctrlsig[0]    <= 0;		//INC_dec_en
		ctrlsig[1]    <= 0;		//RST_dec_en
		ctrlsig[2]    <= 0;		//WTR_dec_en
		ctrlsig[3]    <= 0;		//DR_write_en
		ctrlsig[4]    <= 0;		//PC_write_en
		ctrlsig[7:5]  <= 3'b000;//OPR_demux
		ctrlsig[8]    <= 0;		//mem_read
		ctrlsig[9]    <= 0;		//WTA_en
		ctrlsig[10]   <= 0;		//AC_write_en
		ctrlsig[11]   <= 0;		//AC_ALU_write_en
		ctrlsig[14:12]<= 3'b000;//ALU_op
		ctrlsig[15]   <= 0;		//Dmem_write_en
		ctrlsig[16]   <= 0;		//Dmem_read_en
		ctrlsig[17]   <= 0;		//AR_write_en
		ctrlsig[18]   <= 0;		//IR_write_en
		ctrlsig[19]   <= 0;		//PC_Inc
		ctrlsig[20]   <= 0;		//AC_read_en
		ctrlsig[21]   <= 0;		//DR_read_en		
		ctrlsig[22]   <= 0;		//AC_reset
	   ctrlsig[23]   <= 0;		//mem_state
	   ctrlsig[24]   <= 0;		//mem_state			
		next = endop;
	end
endcase

endmodule
