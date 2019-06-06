//inclui os módulos do caminho de dados

`include "contadorPrograma.v"
`include "instructionMem.v"
`include "muxReg.v"
`include "registradores.v"
`include "controle.v"
`include "soma.v"
`include "aluControl.v"
`include "extensorSinal.v"
`include "muxALU.v"
`include "ALU.v"
`include "dataMem.v"
`include "muxData.v"
`include "deslocamentEsq.v"
`include "adiciona.v"
`include "and.v"
`include "muxEndereco.v"

// função que realiza as simulações

module mips ();

	parameter w=31;

	// declaração de registrador


	// declaração de fios

	reg clk;
	wire regDst;
	wire origALU;
	wire memparaReg;
	wire escreveReg;
	wire leMem;
	wire escreveMem;
	wire branch;
	wire zero;
	wire saidaAND;

	// declaração de barramentos

	wire [1:0] ALUop;
	wire [3:0] controle;
	wire [4:0] regEscrita;
	wire [w:0] endEntrada;
	wire [w:0] endSaida;
	wire [w:0] mALU;
	wire [w:0] endALU;
	wire [w:0] proxEndereco;
	wire [w:0] instrucao;
	wire [w:0] deslocamento;
	wire [w:0] resultadoSoma;
	wire [w:0] leituraDados;
	wire [w:0] dadosEscrita;
	wire [w:0] dadosLeitura1;
	wire [w:0] dadosLeitura2;
	wire [w:0] extSinal;

	// declaração de funções

	contadorPrograma pc (
		.clock(clk),
		.endIn(endEntrada[w:0]),
		.endOut(endSaida[w:0])
	);

	soma soma(
		.endSai(endSaida[w:0]),
		.proxEnd(proxEndereco[w:0])
	);

	instructionMem instructionMen (
		.endereco(endSaida[w:0]),
		.instrucaoOut(instrucao[w:0])
	);

	controle control (
		.inst(instrucao[w:26]),
		.regD(regDst),
		.oriALU(origALU),
		.memReg(memparaReg),
		.escReg(escreveReg),
		.lMem(leMem),
		.escMem(escreveMem),
		.br(branch),
		.ALUo(ALUop[1:0])
	);

	muxReg muxRegistrador (
		.inst1(instrucao[20:16]),
		.inst2(instrucao[15:11]),
		.regD(regDst),
		.regEsc(regEscrita[4:0])
	);

	aluControl controleALU (
		.inst(instrucao[5:0]),
		.ALUO(ALUop[1:0]),
		.controlOut(controle[3:0])
	);

	registradores registradores (
		.regLe1(instrucao[25:21]),
		.regLe2(instrucao[20:16]),
		.regEsc(regEscrita[4:0]),
		.dadosEsc(dadosEscrita[w:0]),
		.escReg(escreveReg),
		.dadosLe1(dadosLeitura1[w:0]),
		.dadosLe2(dadosLeitura2[w:0])
	);

	extensorSinal extensaoSinal (
		.inst(instrucao[15:0]),
		.sinalExt(extSinal[w:0])
	);

	muxALU muxALU (
		.dadosLe2(dadosLeitura2[w:0]),
		.sinalExt(extSinal[w:0]),
		.ALUScr(origALU),
		.muxOut(mALU[w:0])
	);

	ALU ALU (
		.dadosLe1(dadosLeitura1[w:0]),
		.muxOut(mALU[w:0]),
		.controlOut(controle[3:0]),
		.aluOut(endALU[w:0]),
		.zr(zero)
	);

	dataMem memoriaDados (
		.clock(clk),
		.lMem(leMem),
		.escMem(escreveMem),
		.aluOut(endALU[w:0]),
		.dadosLe2(dadosLeitura2[w:0]),
		.leDados(leituraDados[w:0])
	);

	muxData muxDados (
		.leDados(leituraDados[w:0]),
		.aluOut(endALU[w:0]),
		.memtoReg(memparaReg),
		.dadosEsc(dadosEscrita[w:0])
	);

	deslocamentEsq deslocaEsquerda (
		.sinalExt(extSinal[w:0]),
		.desl(deslocamento[w:0])
	);

	adiciona adiciona (
		.proxEnd(proxEndereco[w:0]),
		.desl(deslocamento[w:0]),
		.result(resultadoSoma[w:0])
	);

	/*AND AND(
		.branch(branch),
		.zero(zero),
		.saiAND(saidaAND)
	);*/

	assign saidaAND = branch & zero;

	muxEndereco muxEndereco (
		.proxEnd(proxEndereco[w:0]),
		.result(resultadoSoma[w:0]),
		.saiAND(saidaAND),
		.endEnt(endEntrada[w:0])
	);

	// simulação

	always #1 clk <= ~clk;

	initial begin

		$monitor("Instrucao: %b\nSaida PC: %b \nSaida ALU: %b \n", instrucao, endSaida, endALU);
		//$monitor("Saida PC: %b \n", endSaida);
		//$monitor("Saida ALU2: %b \n", endALU);

		$dumpfile("mips.vcd");
		$dumpvars;

		clk = 1'b0;

		#16 $finish;
	end

endmodule
