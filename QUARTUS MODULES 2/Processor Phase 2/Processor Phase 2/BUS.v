module BUS(    
    input [15:0] WTA, 
    input [15:0] PC,
    input [15:0] IR,
    input [15:0] AR,
    input [15:0] DR,
    input [7:0] TR,
	 input [15:0] IRAM,
	 input [7:0] datain,

    output [15:0] BUS_OUT);
    
   
assign BUS_OUT = WTA | PC | IR | AR | DR | IRAM | datain | (TR << 8) ;

endmodule 