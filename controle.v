module controle (input wire [5:0] inst, output wire regD, output wire oriALU, output wire memReg, output wire escReg, 
		 output wire lMem, output wire escMem, output wire br, output wire [1:0] ALUo);

	reg [5:0] opcode;
	reg rD;
	reg oA;
	reg mR;
	reg eR;
	reg lM;
	reg eM;
	reg b;
	reg [1:0] aO;

	always @ (inst)
	begin
	
		opcode = inst;

		case(opcode)
			6'b000000: // tipo R
			begin
				rD <= 1'b1;
				oA <= 1'b0;
				mR <= 1'b0;
				eR <= 1'b1;
				lM <= 1'b0;
				eM <= 1'b0;
				b <= 1'b0;
				aO <= 2'b10;
			end
			6'b100011: // lw
			begin
				rD <= 1'b0;
				oA <= 1'b1;
				mR <= 1'b1;
				eR <= 1'b1;
				lM <= 1'b1;
				eM <= 1'b0;
				b <= 1'b0;
				aO <= 2'b00;
			end
			6'b101011: // sw
			begin
				rD <= 1'bx;
				oA <= 1'b1;
				mR <= 1'bx;
				eR <= 1'b0;
				lM <= 1'b0;
				eM <= 1'b1;
				b <= 1'b0;
				aO <= 2'b00;
			end
			6'b000100: // beq
			begin
				rD <= 1'bx;
				oA <= 1'b0;
				mR <= 1'bx;
				eR <= 1'b0;
				lM <= 1'b0;
				eM <= 1'b0;
				b <= 1'b1;
				aO <= 2'b01;
			end
		endcase

	end

	assign regD = rD;
	assign oriALU = oA;
	assign memReg = mR;
	assign escReg = eR;
	assign lMem = lM;
	assign escMem = eM;
	assign br = b;
	assign ALUo = aO;

endmodule

// módulo que identifica qual instrução foi lida e retorna os sinais de controle

