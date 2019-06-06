module dataMem (input wire clock, input wire lMem, input wire escMem, input wire [31:0] aluOut, input wire [31:0] dadosLe2, output wire [31:0] leDados);
	
	reg [31:0] dados [0:31];
	reg [31:0] lD;

	always @(posedge clock)
	begin
		if (escMem == 1'b1)
			dados[aluOut] <= dadosLe2;
		else if (lMem == 1'b1)
			lD = dados[aluOut];
	end
	
	assign leDados = lD;
	
endmodule

//modulo q tem como saida os dados da operacao realizada