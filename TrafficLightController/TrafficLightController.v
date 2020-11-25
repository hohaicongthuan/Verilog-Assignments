module TrafficLightController(
											clk,
											ShortTime_i,
											LongTime_i,
											HR,
											HY,
											HG,
											FR,
											FY,
											FG 
										);

	input clk;
	input [5:0] ShortTime_i, LongTime_i;
	output HR, HY, HG, FR, FY, FG;
	
	wire [5:0] ShortTime_Counter_Out, LongTime_Counter_Out;
	wire ShortTime_Comp_Out, LongTime_Comp_Out;
	
	COUNTER ShortTime_Inst(
		.count_o(ShortTime_Counter_Out),
		.load_i(ShortTime_Comp_Out),
		.value_i(6'd0),
		.clk(clk)
	);
	COUNTER LongTime_Inst(
		.count_o(LongTime_Counter_Out),
		.load_i(LongTime_Comp_Out),
		.value_i(6'd0),
		.clk(clk)
	);
	Comparator ST_Comp_Inst(
		.i_A(ShortTime_i),
		.i_B(ShortTime_Counter_Out),
		.Out(ShortTime_Comp_Out)
	);
	Comparator LT_Comp_Inst(
		.i_A(LongTime_i),
		.i_B(LongTime_Counter_Out),
		.Out(LongTime_Comp_Out)
	);
	FSM FSM_Inst(
		.TS(ShortTime_Comp_Out),
		.TL(LongTime_Comp_Out),
		.clk(clk),
		.HY(HY),
		.HG(HG),
		.HR(HR),
		.FY(FY),
		.FG(FG),
		.FR(FR)
	);
endmodule