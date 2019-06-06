module muxEndereco (input wire [31:0] proxEnd, input wire [31:0] result, input wire saiAND, output wire [31:0] endEnt);

	reg [31:0] endereco;
	
	always @ (saiAND or proxEnd or result)
	begin
		case (saiAND)
			0: endereco <= proxEnd;
			1: endereco <= result;
			default: endereco <= 0;
		endcase
	end
	
	assign endEnt = endereco;
	
endmodule

//modulo q define qual o proximo endereco a ser lido