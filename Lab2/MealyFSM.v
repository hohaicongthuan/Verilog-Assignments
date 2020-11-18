module MealyFSM(clk, data_i, data_o);
	input clk;
	input [3:0] data_i;
	output data_o;
	
	parameter 	S0 = 2'b00,
					S1 = 2'b01,
					S2 = 2'b10,
					S3 = 2'b11;
				
	wire clk;
	wire [3:0] data_i;
	wire data_o;			
				
	wire [1:0] CurrentState;
	wire [1:0] NextState;
	
	NEXTSTATEMEALYFSM NextState_Inst(
		.data_i(data_i),
		.NextState_o(NextState),
		.CurrentState_i(CurrentState)
	);
	
	REGMEALYFSM Reg_Inst(
		.data_o(CurrentState),
		.data_i(NextState),
		.clk(clk)
	);
	
	OUTPUTMEALYFSM Output_Inst(
		.data_o(data_o),
		.data_i(data_i),
		.CurrentState_i(CurrentState)
	);
endmodule