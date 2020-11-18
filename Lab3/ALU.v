module ALU(A_i, B_i, data_o, ALU_OpCode_i);
	input [15:0] A_i, B_i;
	input [1:0] ALU_OpCode_i;
	output [15:0] data_o;
	
	wire [15:0] A_i, B_i;
	wire [1:0] ALU_OpCode_i;
	reg [15:0] data_o;
	
	always @ (ALU_OpCode_i, A_i, B_i) begin
		case (ALU_OpCode_i)
			2'b00: data_o = A_i + B_i;
			2'b10: data_o = A_i - B_i;
			2'b01: data_o = A_i & B_i;
			default: data_o = 15'd0;
		endcase
	end
endmodule