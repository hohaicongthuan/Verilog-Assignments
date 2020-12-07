module FloatComparator(data_iA, data_iB, BigFloat, SmallFloat);
	input [31:0] data_iA, data_iB;
	output [31:0] BigFloat, SmallFloat;
	
	wire [7:0] ExpA, ExpB;
	
	assign ExpA = data_iA[30:23] - 8'd127;
	assign ExpB = data_iB[30:23] - 8'd127;
	assign BigFloat = (ExpA > ExpB) ? data_iA : data_iB;
	assign SmallFloat = (ExpA < ExpB) ? data_iA : data_iB;
endmodule