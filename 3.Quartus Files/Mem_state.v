module Mem_state(input clk,
				   input [1:0]memory_state,
					input [15:0]NoCin,
			      output reg [12:0] mem_ctrl);

					
reg [5:0] present = 6'd0;
reg [5:0] next = 6'd1;
wire [15:0]NoC;

assign NoC = NoCin;

parameter
fetch1     = 6'd0,
comm1       = 6'd2,
comm2       = 6'd3,
comm3       = 6'd4,
comm4       = 6'd5,
diff1       = 6'd6,
diff2       = 6'd7,
diff3       = 6'd8,
diff4       = 6'd9,
diff5       = 6'd10,
diff6       = 6'd11,
diff7       = 6'd12,
diff8       = 6'd13,
diff9       = 6'd14,
diff10      = 6'd15,
diff11      = 6'd16,
diff12      = 6'd17,
store1      = 6'd18,
store2      = 6'd19,
store3      = 6'd20,
store4      = 6'd21,
store5      = 6'd22,
store6      = 6'd23,
store7      = 6'd24,
store8      = 6'd25,
store9      = 6'd26,
store10     = 6'd27,
store11     = 6'd28,
store12     = 6'd29;

 always @(posedge clk)
begin 
	present <= next;
end



always @(present)
case(present)
	fetch1: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		 if      (memory_state == 2'd01)   next <= comm1;
       else if (memory_state == 2'd02)   next <= diff1;
		 else if (memory_state == 2'd03)   next <= store1; 
       else    next <= fetch1;		
end
///////////////////////////////////////////////////////////////////////
	comm1: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 1;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= comm2 ;
	end
	comm2: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 1;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= comm3;
	end
	comm3: begin
		mem_ctrl[0]    <= 1;	  //DR1_wrt_en
		mem_ctrl[1]    <= 1;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 1;	  //DR3_wrt_en
		mem_ctrl[3]    <= 1;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 1;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= fetch1 ;
	end
///////////////////////////////////////////////////////
	diff1: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 1;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= diff2 ;
	end
	diff2: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 1;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= diff3 ;
	end
	diff3: begin
		mem_ctrl[0]    <= 1;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 1;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write	
		if (NoC==15'd1)      next <= fetch1;  
		else 						next <= diff4;		
	end
	diff4: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 1;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= diff5 ;
	end
	diff5: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 1;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= diff6 ;
	end
	diff6: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 1;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 1;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write	
		if (NoC==15'd2)      next <= fetch1;  
		else 						next <= diff7;				
	end
	diff7: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 1;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= diff8 ;
	end
	diff8: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 1;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= diff9 ;
	end
	diff9: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 1;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 1;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write		
		if (NoC==15'd3)      next <= fetch1;  
		else 						next <= diff10;			
	end
	diff10: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 1;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= diff11 ;
	end
	diff11: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 1;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= diff12 ;
	end
	diff12: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 1;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 1;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 0;	  //Dmem_write			
		next <= fetch1 ;
	end
/////////////////////////////////////////////////////////////////
	store1: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 1;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 1;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 1;	  //Dmem_write'
		if (NoC==15'd1)      next <= fetch1;  
		else 						next <= store2;
	end
	store2: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 1;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 1;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 1;	  //Dmem_write		
		if (NoC==15'd2)      next <= fetch1;  
		else 						next <= store3;	
	end
	store3: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 1;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 1;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en	
      mem_ctrl[12]   <= 1;	  //Dmem_write		
		if (NoC==15'd3)      next <= fetch1;  
		else 						next <= store4;	
	end
	store4: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 1;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 1;	  //D4_read_en	
      mem_ctrl[12]   <= 1;	  //Dmem_write			
		next <= fetch1 ;
	end

/////////////////////////////////////////////////////////////////	
	default: begin
		mem_ctrl[0]    <= 0;	  //DR1_wrt_en
		mem_ctrl[1]    <= 0;	  //DR2_wrt_en	
		mem_ctrl[2]    <= 0;	  //DR3_wrt_en
		mem_ctrl[3]    <= 0;	  //DR4_wrt_en	
		mem_ctrl[4]    <= 0;	  //AR1_read_en	
		mem_ctrl[5]    <= 0;	  //AR2_read_en
		mem_ctrl[6]    <= 0;	  //AR3_read_en
	   mem_ctrl[7]    <= 0;   //AR4_read_en
		mem_ctrl[8]    <= 0;	  //D1_read_en
		mem_ctrl[9]    <= 0;	  //D2_read_en	
		mem_ctrl[10]   <= 0;	  //D3_read_en
		mem_ctrl[11]   <= 0;	  //D4_read_en			
		next <= fetch1 ;
	end	
endcase
		
endmodule
	