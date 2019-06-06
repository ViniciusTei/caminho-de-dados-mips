module muxReg (input wire [4:0] inst1,
			   input wire [4:0] inst2,
				input wire regD,
				output wire [4:0] regEsc);
				
	reg [4:0] escrita;
	
	always @(regD or inst1 or inst2)
	begin
		case(regD)
			0: escrita <= inst1;
			1: escrita <= inst2;
			default: escrita <= 0;
		endcase
	end
	
	assign regEsc = escrita;
	
endmodule

//modulo q define se o terceiro registrador vai para o banco de registradores