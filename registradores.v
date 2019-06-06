module registradores (input wire [4:0] regLe1, input wire [4:0] regLe2, input wire [4:0] regEsc, input wire [31:0] dadosEsc,
					  input wire escReg, output wire [31:0] dadosLe1, output wire [31:0] dadosLe2);
	
	reg [31:0] registrador [0:31];
	reg [31:0] regL1;
	reg [31:0] regL2;
	
	initial $readmemb("registradores.bin", (registrador));
	
	always @ (regLe1 or regLe2)
	begin
		regL1 <= registrador[regLe1];
		regL2 <= registrador[regLe2];
	end
	
	initial registrador[regEsc] <= dadosEsc;
	
	assign dadosLe1 = regL1;
	assign dadosLe2 = regL2;
	
endmodule

//modulo q retorna o conteudo dos registradores