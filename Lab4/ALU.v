module ALU(A_i, B_i, data_o, ALU_OpCode_i);
	input [15:0] A_i, B_i;
	input [4:0] ALU_OpCode_i;
	output [15:0] data_o;
	
	wire [15:0] A_i, B_i;
	wire [4:0] ALU_OpCode_i;
	reg [15:0] data_o;
	
	always @ (ALU_OpCode_i, A_i, B_i) begin
		case (ALU_OpCode_i)
			4'b0001: data_o = A_i + B_i;
			4'b0010: data_o = A_i - B_i;
			4'b0011: data_o = A_i & B_i;
			4'b0100: data_o = A_i | B_i;
			4'b0101: data_o = A_i ^ B_i;
			4'b0110: data_o = A_i >> B_i;
			4'b0111: data_o = A_i >>> B_i;
			4'b1000: data_o = A_i << B_i;
			default: data_o = 15'd0;
		endcase
	end
endmodule