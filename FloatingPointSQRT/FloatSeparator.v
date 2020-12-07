module FloatSeparator(data_iA, data_iB, SignA, ExpA, MantA, SignB, ExpB, MantB);
	input [31:0] data_iA, data_iB;
	output SignA, SignB;
	output [7:0] ExpA,ExpB;
	output [22:0] MantA, MantB;
	
	assign SignA = data_iA[31];
	assign SignB = data_iB[31];
	
	assign ExpA = data_iA[30:23];
	assign ExpB = data_iB[30:23];
	
	assign MantA = data_iA[22:0];
	assign MantB = data_iB[22:0];
endmodule