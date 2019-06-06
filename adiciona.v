module adiciona (input wire [31:0] proxEnd, input wire [31:0] desl, output wire [31:0] result);
	
	reg [31:0] res;
	
	always @ (proxEnd or desl)
		res <= proxEnd + desl;
		
	assign result = res;
	
endmodule

//modulo q soma a proxima instrucao com o resultado do deslocamento