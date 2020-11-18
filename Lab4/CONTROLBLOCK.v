module CONTROLBLOCK(Inst_i, data_o);
	parameter 	ADD	= 5'b00010,
					SUB	= 5'b00011,
					AND	= 5'b00100,
					OR		= 5'b00101,
					XOR	= 5'b00110,
					SR		= 5'b01000,
					SRA	= 5'b01001,
					SL		= 5'b01010,
					ADDI	= 5'b10010,
					ANDI	= 5'b10100,
					ORI	= 5'b10101,
					XORI	= 5'b10110,
					LW		= 5'b11100,
					SW		= 5'b11101,
					BEQ	= 5'b11110,
					BNE	= 5'b11111;

	input [4:0] Inst_i;
	output [9:0] data_o;
	//Inst_i, PCSrc_o, RegSrc_o, RegEn_o, ALUSrc_o, ALUOp_o, DMEMWr_o, WrSrc_o
	always @ (Inst_i) begin
		case (Inst_i)
			ADD: 10'b0110000101;
			SUB: 10'b;
			AND: 10'b;
			OR: 10'b;
			XOR: 10'b;
			SR: 10'b;
			SRA: 10'b;
			SL: 10'b;
			ADDI: 10'b;
			ANDI: 10'b;
			ORI: 10'b;
			XORI: 10'b;
			LW: 10'b;
			SW: 10'b;
			BEQ: 10'b;
			BNE: 10'b;
		endcase
	end
endmodule