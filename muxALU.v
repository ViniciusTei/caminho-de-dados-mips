module muxALU (input wire[31:0] dadosLe2, input wire [31:0] sinalExt, input wire ALUScr, output wire [31:0] muxOut);
	reg [31:0] x;
	
	always @(ALUScr or dadosLe2 or sinalExt)
	begin
		case(ALUScr)
			0: x <= dadosLe2;
			1: x <= sinalExt;
			default: x <= 0;
		endcase
	end
	
	assign muxOut = x;

endmodule

//modulo q define qual das duas entradas a ALU ira receber