module FloatAdder(data_iA, data_iB, data_o, AddSub_i);
	input AddSub_i;
	input [31:0] data_iA, data_iB;
	output wire [31:0] data_o;
	
	wire [31:0] BigFloat, SmallFloat;
	wire SignA, SignB;
	wire [7:0] ExpA, ExpB, SHAMT;
	wire [22:0] MantA, MantB, RightShift_Out, AddSub_Out;
	
	xor(data_o[31], AddSub_i, BigFloat[31]);
	
	FloatComparator FloatComparator_Inst(
		.data_iA(data_iA),
		.data_iB(data_iB),
		.BigFloat(BigFloat),
		.SmallFloat(SmallFloat)
	);
	FloatSeparator FloatSeparator_Inst(
		.data_iA(BigFloat),
		.data_iB(SmallFloat),
		.SignA(SignA),
		.ExpA(ExpA),
		.MantA(MantA),
		.SignB(SignB),
		.ExpB(ExpB),
		.MantB(MantB)
	);
	Subtractor Sub_Inst(
		.data_iA(ExpA),
		.data_iB(ExpB),
		.data_o(SHAMT)
	);
	RightShifter RightShifter_Inst(
		.data_i(MantB),
		.data_o(RightShift_Out),
		.SHAMT(SHAMT)
	);
	AddSub AddSub_Inst(
		.data_iA(MantA),
		.data_iB(RightShift_Out),
		.data_o(data_o[22:0]),
		.Sel(AddSub_i)
	);
	
	assign data_o[30:23] = ExpA;
endmodule