module outputmux_simulation(
				input [23:0]c1_bus_out,
				input [24:0]c1_ctrlsig_out,
				input c1_endp,
				input c1_Zout,
				input [23:0]c2_bus_out,
				input [24:0]c2_ctrlsig_out,
				input c2_endp,
				input c2_Zout,
				input [23:0]c3_bus_out,
				input [24:0]c3_ctrlsig_out,
				input c3_endp,
				input c3_Zout,
				input [23:0]c4_bus_out,
				input [24:0]c4_ctrlsig_out,
				input c4_endp,
				input c4_Zout,
				
				output [23:0]bus_out,
				output [24:0]ctrlsig_out,
				output endp,
				output Zout,
				input [2:0]select_core);
	

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

	
	