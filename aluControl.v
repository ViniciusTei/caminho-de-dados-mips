module aluControl (input wire [5:0] inst, input wire [1:0] ALUO, output wire [3:0] controlOut);
	reg [3:0] c;
	
	always @ (ALUO or inst)
	begin
		if(ALUO == 0)
			c <= 4'b0010;
		else if (ALUO == 1)
			c <= 4'b0110;
		else if (inst == 6'b100000 && ALUO == 2)
			c <= 4'b0010;
		else if (inst == 6'b100010 && ALUO == 2)
			c <= 4'b0110;
		else if (inst == 6'b100100 && ALUO == 2)
			c <= 4'b0000;
		else if (inst == 6'b100101 && ALUO == 2)
			c <= 4'b0001;
		else if (inst == 6'b101010 && ALUO == 2)
			c <= 4'b0111;
	end
	
	assign controlOut = c;

endmodule

//modulo q define qual instrucao a alu ira realizar