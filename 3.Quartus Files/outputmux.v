module outputmux(input c1_segmentA, c1_segmentB, c1_segmentC, c1_segmentD, c1_segmentE, c1_segmentF, c1_segmentG,
				input c1_segmentA1, c1_segmentB1, c1_segmentC1, c1_segmentD1, c1_segmentE1, c1_segmentF1, c1_segmentG1,
				input c1_segmentA2, c1_segmentB2, c1_segmentC2, c1_segmentD2, c1_segmentE2, c1_segmentF2, c1_segmentG2,
				input c1_segmentA3, c1_segmentB3, c1_segmentC3, c1_segmentD3, c1_segmentE3, c1_segmentF3, c1_segmentG3,
				input c1_segmentA4, c1_segmentB4, c1_segmentC4, c1_segmentD4, c1_segmentE4, c1_segmentF4, c1_segmentG4,
				input c1_segmentA5, c1_segmentB5, c1_segmentC5, c1_segmentD5, c1_segmentE5, c1_segmentF5, c1_segmentG5,
				input c1_segmentA6, c1_segmentB6, c1_segmentC6, c1_segmentD6, c1_segmentE6, c1_segmentF6, c1_segmentG6,
				input c1_segmentA7, c1_segmentB7, c1_segmentC7, c1_segmentD7, c1_segmentE7, c1_segmentF7, c1_segmentG7,
				input [23:0]c1_bus_out,
				input [24:0]c1_ctrlsig_out,
				input c1_endp,
				input c1_Zout,
				
				input c2_segmentA, c2_segmentB, c2_segmentC, c2_segmentD, c2_segmentE, c2_segmentF, c2_segmentG,
				input c2_segmentA1, c2_segmentB1, c2_segmentC1, c2_segmentD1, c2_segmentE1, c2_segmentF1, c2_segmentG1,
				input c2_segmentA2, c2_segmentB2, c2_segmentC2, c2_segmentD2, c2_segmentE2, c2_segmentF2, c2_segmentG2,
				input c2_segmentA3, c2_segmentB3, c2_segmentC3, c2_segmentD3, c2_segmentE3, c2_segmentF3, c2_segmentG3,
				input c2_segmentA4, c2_segmentB4, c2_segmentC4, c2_segmentD4, c2_segmentE4, c2_segmentF4, c2_segmentG4,
				input c2_segmentA5, c2_segmentB5, c2_segmentC5, c2_segmentD5, c2_segmentE5, c2_segmentF5, c2_segmentG5,
				input c2_segmentA6, c2_segmentB6, c2_segmentC6, c2_segmentD6, c2_segmentE6, c2_segmentF6, c2_segmentG6,
				input c2_segmentA7, c2_segmentB7, c2_segmentC7, c2_segmentD7, c2_segmentE7, c2_segmentF7, c2_segmentG7,
				input [23:0]c2_bus_out,
				input [24:0]c2_ctrlsig_out,
				input c2_endp,
				input c2_Zout,
				
				input c3_segmentA, c3_segmentB, c3_segmentC, c3_segmentD, c3_segmentE, c3_segmentF, c3_segmentG,
				input c3_segmentA1, c3_segmentB1, c3_segmentC1, c3_segmentD1, c3_segmentE1, c3_segmentF1, c3_segmentG1,
				input c3_segmentA2, c3_segmentB2, c3_segmentC2, c3_segmentD2, c3_segmentE2, c3_segmentF2, c3_segmentG2,
				input c3_segmentA3, c3_segmentB3, c3_segmentC3, c3_segmentD3, c3_segmentE3, c3_segmentF3, c3_segmentG3,
				input c3_segmentA4, c3_segmentB4, c3_segmentC4, c3_segmentD4, c3_segmentE4, c3_segmentF4, c3_segmentG4,
				input c3_segmentA5, c3_segmentB5, c3_segmentC5, c3_segmentD5, c3_segmentE5, c3_segmentF5, c3_segmentG5,
				input c3_segmentA6, c3_segmentB6, c3_segmentC6, c3_segmentD6, c3_segmentE6, c3_segmentF6, c3_segmentG6,
				input c3_segmentA7, c3_segmentB7, c3_segmentC7, c3_segmentD7, c3_segmentE7, c3_segmentF7, c3_segmentG7,
				input [23:0]c3_bus_out,
				input [24:0]c3_ctrlsig_out,
				input c3_endp,
				input c3_Zout,
				
				input c4_segmentA, c4_segmentB, c4_segmentC, c4_segmentD, c4_segmentE, c4_segmentF, c4_segmentG,
				input c4_segmentA1, c4_segmentB1, c4_segmentC1, c4_segmentD1, c4_segmentE1, c4_segmentF1, c4_segmentG1,
				input c4_segmentA2, c4_segmentB2, c4_segmentC2, c4_segmentD2, c4_segmentE2, c4_segmentF2, c4_segmentG2,
				input c4_segmentA3, c4_segmentB3, c4_segmentC3, c4_segmentD3, c4_segmentE3, c4_segmentF3, c4_segmentG3,
				input c4_segmentA4, c4_segmentB4, c4_segmentC4, c4_segmentD4, c4_segmentE4, c4_segmentF4, c4_segmentG4,
				input c4_segmentA5, c4_segmentB5, c4_segmentC5, c4_segmentD5, c4_segmentE5, c4_segmentF5, c4_segmentG5,
				input c4_segmentA6, c4_segmentB6, c4_segmentC6, c4_segmentD6, c4_segmentE6, c4_segmentF6, c4_segmentG6,
				input c4_segmentA7, c4_segmentB7, c4_segmentC7, c4_segmentD7, c4_segmentE7, c4_segmentF7, c4_segmentG7,
				input [23:0]c4_bus_out,
				input [24:0]c4_ctrlsig_out,
				input c4_endp,
				input c4_Zout,
				
				output segmentA, segmentB, segmentC, segmentD, segmentE, segmentF, segmentG,
				output segmentA1, segmentB1, segmentC1, segmentD1, segmentE1, segmentF1, segmentG1,
				output segmentA2, segmentB2, segmentC2, segmentD2, segmentE2, segmentF2, segmentG2,
				output segmentA3, segmentB3, segmentC3, segmentD3, segmentE3, segmentF3, segmentG3,
				output segmentA4, segmentB4, segmentC4, segmentD4, segmentE4, segmentF4, segmentG4,
				output segmentA5, segmentB5, segmentC5, segmentD5, segmentE5, segmentF5, segmentG5,
				output segmentA6, segmentB6, segmentC6, segmentD6, segmentE6, segmentF6, segmentG6,
				output segmentA7, segmentB7, segmentC7, segmentD7, segmentE7, segmentF7, segmentG7,
				output [23:0]bus_out,
				output [24:0]ctrlsig_out,
				output endp,
				output Zout,
				input [2:0]select_core);

assign segmentA = (select_core==3'd1) ? c1_segmentA:
						(select_core==3'd2) ? c2_segmentA:
						(select_core==3'd3) ? c3_segmentA:
						(select_core==3'd4) ? c4_segmentA:
						0;
assign segmentA1 = (select_core==3'd1) ? c1_segmentA1:
						(select_core==3'd2) ? c2_segmentA1:
						(select_core==3'd3) ? c3_segmentA1:
						(select_core==3'd4) ? c4_segmentA1:
						0;
assign segmentA2 = (select_core==3'd1) ? c1_segmentA2:
						(select_core==3'd2) ? c2_segmentA2:
						(select_core==3'd3) ? c3_segmentA2:
						(select_core==3'd4) ? c4_segmentA2:
						0;
assign segmentA3 = (select_core==3'd1) ? c1_segmentA3:
						(select_core==3'd2) ? c2_segmentA3:
						(select_core==3'd3) ? c3_segmentA3:
						(select_core==3'd4) ? c4_segmentA3:
						0;
assign segmentA4 = (select_core==3'd1) ? c1_segmentA4:
						(select_core==3'd2) ? c2_segmentA4:
						(select_core==3'd3) ? c3_segmentA4:
						(select_core==3'd4) ? c4_segmentA4:
						0;
assign segmentA5 = (select_core==3'd1) ? c1_segmentA5:
						(select_core==3'd2) ? c2_segmentA5:
						(select_core==3'd3) ? c3_segmentA5:
						(select_core==3'd4) ? c4_segmentA5:
						0;
assign segmentA6 = (select_core==3'd1) ? c1_segmentA6:
						(select_core==3'd2) ? c2_segmentA6:
						(select_core==3'd3) ? c3_segmentA6:
						(select_core==3'd4) ? c4_segmentA6:
						0;
assign segmentA7 = (select_core==3'd1) ? c1_segmentA7:
						(select_core==3'd2) ? c2_segmentA7:
						(select_core==3'd3) ? c3_segmentA7:
						(select_core==3'd4) ? c4_segmentA7:
						0;	
						
assign segmentB = (select_core==3'd1) ? c1_segmentB:
						(select_core==3'd2) ? c2_segmentB:
						(select_core==3'd3) ? c3_segmentB:
						(select_core==3'd4) ? c4_segmentB:
						0;
assign segmentB1 = (select_core==3'd1) ? c1_segmentB1:
						(select_core==3'd2) ? c2_segmentB1:
						(select_core==3'd3) ? c3_segmentB1:
						(select_core==3'd4) ? c4_segmentB1:
						0;
assign segmentB2 = (select_core==3'd1) ? c1_segmentB2:
						(select_core==3'd2) ? c2_segmentB2:
						(select_core==3'd3) ? c3_segmentB2:
						(select_core==3'd4) ? c4_segmentB2:
						0;
assign segmentB3 = (select_core==3'd1) ? c1_segmentB3:
						(select_core==3'd2) ? c2_segmentB3:
						(select_core==3'd3) ? c3_segmentB3:
						(select_core==3'd4) ? c4_segmentB3:
						0;
assign segmentB4 = (select_core==3'd1) ? c1_segmentB4:
						(select_core==3'd2) ? c2_segmentB4:
						(select_core==3'd3) ? c3_segmentB4:
						(select_core==3'd4) ? c4_segmentB4:
						0;
assign segmentB5 = (select_core==3'd1) ? c1_segmentB5:
						(select_core==3'd2) ? c2_segmentB5:
						(select_core==3'd3) ? c3_segmentB5:
						(select_core==3'd4) ? c4_segmentB5:
						0;
assign segmentB6 = (select_core==3'd1) ? c1_segmentB6:
						(select_core==3'd2) ? c2_segmentB6:
						(select_core==3'd3) ? c3_segmentB6:
						(select_core==3'd4) ? c4_segmentB6:
						0;
assign segmentB7 = (select_core==3'd1) ? c1_segmentB7:
						(select_core==3'd2) ? c2_segmentB7:
						(select_core==3'd3) ? c3_segmentB7:
						(select_core==3'd4) ? c4_segmentB7:
						0;		
						
assign segmentC = (select_core==3'd1) ? c1_segmentC:
						(select_core==3'd2) ? c2_segmentC:
						(select_core==3'd3) ? c3_segmentC:
						(select_core==3'd4) ? c4_segmentC:
						0;
assign segmentC1 = (select_core==3'd1) ? c1_segmentC1:
						(select_core==3'd2) ? c2_segmentC1:
						(select_core==3'd3) ? c3_segmentC1:
						(select_core==3'd4) ? c4_segmentC1:
						0;
assign segmentC2 = (select_core==3'd1) ? c1_segmentC2:
						(select_core==3'd2) ? c2_segmentC2:
						(select_core==3'd3) ? c3_segmentC2:
						(select_core==3'd4) ? c4_segmentC2:
						0;
assign segmentC3 = (select_core==3'd1) ? c1_segmentC3:
						(select_core==3'd2) ? c2_segmentC3:
						(select_core==3'd3) ? c3_segmentC3:
						(select_core==3'd4) ? c4_segmentC3:
						0;
assign segmentC4 = (select_core==3'd1) ? c1_segmentC4:
						(select_core==3'd2) ? c2_segmentC4:
						(select_core==3'd3) ? c3_segmentC4:
						(select_core==3'd4) ? c4_segmentC4:
						0;
assign segmentC5 = (select_core==3'd1) ? c1_segmentC5:
						(select_core==3'd2) ? c2_segmentC5:
						(select_core==3'd3) ? c3_segmentC5:
						(select_core==3'd4) ? c4_segmentC5:
						0;
assign segmentC6 = (select_core==3'd1) ? c1_segmentC6:
						(select_core==3'd2) ? c2_segmentC6:
						(select_core==3'd3) ? c3_segmentC6:
						(select_core==3'd4) ? c4_segmentC6:
						0;
assign segmentC7 = (select_core==3'd1) ? c1_segmentC7:
						(select_core==3'd2) ? c2_segmentC7:
						(select_core==3'd3) ? c3_segmentC7:
						(select_core==3'd4) ? c4_segmentC7:
						0;		
						
assign segmentD = (select_core==3'd1) ? c1_segmentD:
						(select_core==3'd2) ? c2_segmentD:
						(select_core==3'd3) ? c3_segmentD:
						(select_core==3'd4) ? c4_segmentD:
						0;
assign segmentD1 = (select_core==3'd1) ? c1_segmentD1:
						(select_core==3'd2) ? c2_segmentD1:
						(select_core==3'd3) ? c3_segmentD1:
						(select_core==3'd4) ? c4_segmentD1:
						0;
assign segmentD2 = (select_core==3'd1) ? c1_segmentD2:
						(select_core==3'd2) ? c2_segmentD2:
						(select_core==3'd3) ? c3_segmentD2:
						(select_core==3'd4) ? c4_segmentD2:
						0;
assign segmentD3 = (select_core==3'd1) ? c1_segmentD3:
						(select_core==3'd2) ? c2_segmentD3:
						(select_core==3'd3) ? c3_segmentD3:
						(select_core==3'd4) ? c4_segmentD3:
						0;
assign segmentD4 = (select_core==3'd1) ? c1_segmentD4:
						(select_core==3'd2) ? c2_segmentD4:
						(select_core==3'd3) ? c3_segmentD4:
						(select_core==3'd4) ? c4_segmentD4:
						0;
assign segmentD5 = (select_core==3'd1) ? c1_segmentD5:
						(select_core==3'd2) ? c2_segmentD5:
						(select_core==3'd3) ? c3_segmentD5:
						(select_core==3'd4) ? c4_segmentD5:
						0;
assign segmentD6 = (select_core==3'd1) ? c1_segmentD6:
						(select_core==3'd2) ? c2_segmentD6:
						(select_core==3'd3) ? c3_segmentD6:
						(select_core==3'd4) ? c4_segmentD6:
						0;
assign segmentD7 = (select_core==3'd1) ? c1_segmentD7:
						(select_core==3'd2) ? c2_segmentD7:
						(select_core==3'd3) ? c3_segmentD7:
						(select_core==3'd4) ? c4_segmentD7:
						0;		
						
assign segmentE = (select_core==3'd1) ? c1_segmentE:
						(select_core==3'd2) ? c2_segmentE:
						(select_core==3'd3) ? c3_segmentE:
						(select_core==3'd4) ? c4_segmentE:
						0;
assign segmentE1 = (select_core==3'd1) ? c1_segmentE1:
						(select_core==3'd2) ? c2_segmentE1:
						(select_core==3'd3) ? c3_segmentE1:
						(select_core==3'd4) ? c4_segmentE1:
						0;
assign segmentE2 = (select_core==3'd1) ? c1_segmentE2:
						(select_core==3'd2) ? c2_segmentE2:
						(select_core==3'd3) ? c3_segmentE2:
						(select_core==3'd4) ? c4_segmentE2:
						0;
assign segmentE3 = (select_core==3'd1) ? c1_segmentE3:
						(select_core==3'd2) ? c2_segmentE3:
						(select_core==3'd3) ? c3_segmentE3:
						(select_core==3'd4) ? c4_segmentE3:
						0;
assign segmentE4 = (select_core==3'd1) ? c1_segmentE4:
						(select_core==3'd2) ? c2_segmentE4:
						(select_core==3'd3) ? c3_segmentE4:
						(select_core==3'd4) ? c4_segmentE4:
						0;
assign segmentE5 = (select_core==3'd1) ? c1_segmentE5:
						(select_core==3'd2) ? c2_segmentE5:
						(select_core==3'd3) ? c3_segmentE5:
						(select_core==3'd4) ? c4_segmentE5:
						0;
assign segmentE6 = (select_core==3'd1) ? c1_segmentE6:
						(select_core==3'd2) ? c2_segmentE6:
						(select_core==3'd3) ? c3_segmentE6:
						(select_core==3'd4) ? c4_segmentE6:
						0;
assign segmentE7 = (select_core==3'd1) ? c1_segmentE7:
						(select_core==3'd2) ? c2_segmentE7:
						(select_core==3'd3) ? c3_segmentE7:
						(select_core==3'd4) ? c4_segmentE7:
						0;		
						
assign segmentF = (select_core==3'd1) ? c1_segmentF:
						(select_core==3'd2) ? c2_segmentF:
						(select_core==3'd3) ? c3_segmentF:
						(select_core==3'd4) ? c4_segmentF:
						0;
assign segmentF1 = (select_core==3'd1) ? c1_segmentF1:
						(select_core==3'd2) ? c2_segmentF1:
						(select_core==3'd3) ? c3_segmentF1:
						(select_core==3'd4) ? c4_segmentF1:
						0;
assign segmentF2 = (select_core==3'd1) ? c1_segmentF2:
						(select_core==3'd2) ? c2_segmentF2:
						(select_core==3'd3) ? c3_segmentF2:
						(select_core==3'd4) ? c4_segmentF2:
						0;
assign segmentF3 = (select_core==3'd1) ? c1_segmentF3:
						(select_core==3'd2) ? c2_segmentF3:
						(select_core==3'd3) ? c3_segmentF3:
						(select_core==3'd4) ? c4_segmentF3:
						0;
assign segmentF4 = (select_core==3'd1) ? c1_segmentF4:
						(select_core==3'd2) ? c2_segmentF4:
						(select_core==3'd3) ? c3_segmentF4:
						(select_core==3'd4) ? c4_segmentF4:
						0;
assign segmentF5 = (select_core==3'd1) ? c1_segmentF5:
						(select_core==3'd2) ? c2_segmentF5:
						(select_core==3'd3) ? c3_segmentF5:
						(select_core==3'd4) ? c4_segmentF5:
						0;
assign segmentF6 = (select_core==3'd1) ? c1_segmentF6:
						(select_core==3'd2) ? c2_segmentF6:
						(select_core==3'd3) ? c3_segmentF6:
						(select_core==3'd4) ? c4_segmentF6:
						0;
assign segmentF7 = (select_core==3'd1) ? c1_segmentF7:
						(select_core==3'd2) ? c2_segmentF7:
						(select_core==3'd3) ? c3_segmentF7:
						(select_core==3'd4) ? c4_segmentF7:
						0;		
						
assign segmentG = (select_core==3'd1) ? c1_segmentG:
						(select_core==3'd2) ? c2_segmentG:
						(select_core==3'd3) ? c3_segmentG:
						(select_core==3'd4) ? c4_segmentG:
						0;
assign segmentG1 = (select_core==3'd1) ? c1_segmentG1:
						(select_core==3'd2) ? c2_segmentG1:
						(select_core==3'd3) ? c3_segmentG1:
						(select_core==3'd4) ? c4_segmentG1:
						0;
assign segmentG2 = (select_core==3'd1) ? c1_segmentG2:
						(select_core==3'd2) ? c2_segmentG2:
						(select_core==3'd3) ? c3_segmentG2:
						(select_core==3'd4) ? c4_segmentG2:
						0;
assign segmentG3 = (select_core==3'd1) ? c1_segmentG3:
						(select_core==3'd2) ? c2_segmentG3:
						(select_core==3'd3) ? c3_segmentG3:
						(select_core==3'd4) ? c4_segmentG3:
						0;
assign segmentG4 = (select_core==3'd1) ? c1_segmentG4:
						(select_core==3'd2) ? c2_segmentG4:
						(select_core==3'd3) ? c3_segmentG4:
						(select_core==3'd4) ? c4_segmentG4:
						0;
assign segmentG5 = (select_core==3'd1) ? c1_segmentG5:
						(select_core==3'd2) ? c2_segmentG5:
						(select_core==3'd3) ? c3_segmentG5:
						(select_core==3'd4) ? c4_segmentG5:
						0;
assign segmentG6 = (select_core==3'd1) ? c1_segmentG6:
						(select_core==3'd2) ? c2_segmentG6:
						(select_core==3'd3) ? c3_segmentG6:
						(select_core==3'd4) ? c4_segmentG6:
						0;
assign segmentG7 = (select_core==3'd1) ? c1_segmentG7:
						(select_core==3'd2) ? c2_segmentG7:
						(select_core==3'd3) ? c3_segmentG7:
						(select_core==3'd4) ? c4_segmentG7:
						0;		

assign bus_out   = (select_core==3'd1) ? c1_bus_out:
						(select_core==3'd2) ? c2_bus_out:
						(select_core==3'd3) ? c3_bus_out:
						(select_core==3'd4) ? c4_bus_out:
						0;
						
assign ctrlsig_out   = (select_core==3'd1) ? c1_ctrlsig_out:
						(select_core==3'd2) ? c2_ctrlsig_out:
						(select_core==3'd3) ? c3_ctrlsig_out:
						(select_core==3'd4) ? c4_ctrlsig_out:
						0;
		
assign endp   = (select_core==3'd1) ? c1_endp:
						(select_core==3'd2) ? c2_endp:
						(select_core==3'd3) ? c3_endp:
						(select_core==3'd4) ? c4_endp:
						0;
		
assign Zout   = (select_core==3'd1) ? c1_Zout:
						(select_core==3'd2) ? c2_Zout:
						(select_core==3'd3) ? c3_Zout:
						(select_core==3'd4) ? c4_Zout:
						0;

endmodule

	
	