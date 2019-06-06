module deslocamentEsq (input wire [31:0] sinalExt, output wire [31:0] desl);

	reg [31:0] d;
	
	always @ (sinalExt)
		d <= sinalExt << 2;
		
	assign desl = d;
	
endmodule

//modulo q desloca 2 bits a esquerda da entrada