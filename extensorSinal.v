module extensorSinal (input wire [15:0] inst, output wire[31:0] sinalExt);
	
	reg [31:0] e;
	
	always @ (inst)
	begin
		if (inst[15] == 0)
			e = inst;
		else
			e = {16'b1111111111111111, inst};
	end
	
	assign sinalExt = e;

endmodule

//modulo q possui uma entrada de 16 bits e gera uma saida de 32