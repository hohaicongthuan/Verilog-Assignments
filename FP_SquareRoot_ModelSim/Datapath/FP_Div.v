module FP_Div(data_iA, data_iB, data_o);
	input [31:0] data_iA, data_iB;
	output [31:0] data_o;
	
	wire [7:0] LUT_Exp_Output;
	wire [22:0] LUT_Output, YhMinusYl_Output;
	wire [31:0] Mul2_Output, Mul1_Output, Mul0_Output, PlusOneMant_Output;
	
	LUT LUT_Inst(
		.data_i(data_iB[22:11]),
		.data_o(LUT_Output)
	);
	LUT_Exponent LUT_Exp(
		.data_i(Mul0_Output[30:23]),
		.data_o(LUT_Exp_Output)
	);
	YhMinusYl YhMinusYl_Inst(
		.data_i(data_iB[22:0]),
		.data_o(YhMinusYl_Output)
	);
	FP_Mul Mul0_Inst(
		.data_iA(data_iB),
		.data_iB(data_iB),
		.data_o(Mul0_Output)
	);
	FP_Mul Mul1_Inst(
		.data_iA(data_iA),
		.data_iB({data_iB[31:23], YhMinusYl_Output}),
		.data_o(Mul1_Output)
	);
	FP_Mul Mul2_Inst(
		.data_iA(Mul1_Output), 
		.data_iB({data_iB[31], LUT_Exp_Output, LUT_Output}),
		.data_o(Mul2_Output)
	);
	PlusOneMant PlusOneMant_Inst(
		.data_i(Mul2_Output),
		.data_o(PlusOneMant_Output)
	);
	OutputGenerator OutGen_Int(
		.data_o_i(PlusOneMant_Output),
		.data_iA(data_iA),
		.data_iB(data_iB),
		.data_o(data_o)
	);
endmodule