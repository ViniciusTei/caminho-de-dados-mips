module muxData (input wire [31:0] leDados, input wire [31:0] aluOut, input wire memtoReg, output wire [31:0] dadosEsc);
	
	reg [31:0] dE;
	
	always @(memtoReg or leDados or aluOut)
	begin
		case(memtoReg)
			0: dE <= leDados;
			1: dE <= aluOut;
			default: dE <= 0;
		endcase
	end
	
	assign dadosEsc = dE;

endmodule

//modulo q define qual valor é passado para o banco de registradores