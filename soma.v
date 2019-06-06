module soma (input wire [31:0] endSai, output wire [31:0] proxEnd);

	assign proxEnd = endSai + 4'b0100;
	
endmodule

//modulo q soma 4