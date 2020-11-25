module FSM(TS, TL, clk, HY, HG, HR, FY, FG, FR);
	input TS, TL, clk;
	output HY, HG, HR, FY, FG, FR;
	
	wire [1:0] CurrentState, NextState;
	
	FSM_NEXTSTATE NextState_Inst(
		.CurrentState_i(CurrentState),
		.TS(TS),
		.TL(TL),
		.NextState_o(NextState)
	);
	FSM_REG REG_Inst(
		.d(NextState),
		.q(CurrentState),
		.clk(clk)
	);
	FSM_OUTPUT Output_Inst(
		.CurrentState_i(CurrentState),
		.HY(HY),
		.HG(HG),
		.HR(HR),
		.FY(FY),
		.FG(FG),
		.FR(FR)
	);
endmodule