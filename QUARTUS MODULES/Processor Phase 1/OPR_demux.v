module OPR_demux(input [7:0]operand,
					  input [2:0]OPR_sel,
					  
					  output reg [7:0]WTR_operand,
					  output reg [7:0]INC_operand,
					  output reg [7:0]RESET_operand,
					  output reg [7:0]WTA_operand);
					  

    always @(OPR_sel)
    begin
        case (OPR_sel)
            3'b000 : begin
								WTR_operand   = 8'd0 ;
					         INC_operand   = 8'd0 ;
								RESET_operand = 8'd0 ;
								WTA_operand   = 8'd0 ;
                      end
            3'b001 : begin
								WTR_operand   = 8'd0 ;  
					         INC_operand   = 8'd0 ;
								RESET_operand = operand ;
 								WTA_operand   = 8'd0 ;
                      end
            3'b010 : begin
								WTR_operand   = 8'd0 ;
					         INC_operand   = 8'd0 ;
								RESET_operand = 8'd0 ;
								WTA_operand   = operand ;
                      end
            3'b011 : begin
								WTR_operand   = operand ;  
					         INC_operand   = 8'd0 ;
								RESET_operand = 8'd0 ;
								WTA_operand   = 8'd0 ;
                      end
            3'b100 : begin
								WTR_operand   = 8'd0 ;  
					         INC_operand   = operand ;
								RESET_operand = 8'd0 ;
								WTA_operand   = 8'd0 ;
                      end
        endcase
    end
    
endmodule