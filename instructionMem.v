module instructionMem (input wire [31:0] endereco, output wire [31:0] instrucaoOut);

	reg [31:0] instrucao [0:25];

	initial $readmemb("instrucoes.bin", (instrucao));

	assign instrucaoOut = instrucao[endereco/4];

endmodule

//modulo q ira ler a instrucao do endereco indicado pelo contador de programa (PC)
