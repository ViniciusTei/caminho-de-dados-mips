module contadorPrograma (input wire clock, input wire [31:0] endIn, output wire [31:0] endOut);
	reg [31:0] endereco = 31'b0;
	
	always @(posedge clock)
		endereco = endIn;
		
	assign endOut = endereco;
	
endmodule

// modulo que recebe o endereco da instrucao atual no final de cada ciclo de clock 
