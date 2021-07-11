//file name : BUS.v
//used to instantiate the data bus A 

module BUS(    
    input [15:0] WTA, 
    input [15:0] DR,
	 input [15:0] AC,
	 input [23:0] IRAM,
	 input [15:0] DRAM,

    output [23:0] BUS_OUT);
    
   
assign BUS_OUT = WTA | DR | AC | IRAM | DRAM;

endmodule 