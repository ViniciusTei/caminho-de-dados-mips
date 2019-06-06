module ALU (input wire[31:0] dadosLe1, input wire [31:0] muxOut, input wire [3:0] controlOut, output wire [31:0] aluOut, output wire zr);
	
	reg [31:0] eA;
	
	always @ (controlOut)
	begin
		case (controlOut)
			0: eA <= dadosLe1 & muxOut;
			1: eA <= dadosLe1 | muxOut;
			2: eA <= dadosLe1 + muxOut;
			6: eA <= dadosLe1 - muxOut;
			7: eA <= dadosLe1 < muxOut ? 1: 0;
			12: eA <= ~(dadosLe1 | muxOut);
			default: eA <= 0;
		endcase
	end
	
	assign aluOut = eA;
	assign zr = (eA == 0);
	
endmodule

//modulo q realiza as operacoes q foram passadas