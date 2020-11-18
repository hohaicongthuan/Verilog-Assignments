module MooreFSM(clk, data_i, data_o);
	input clk;
	input [3:0] data_i;
	output data_o;
	
	parameter 	S0 = 3'b000,
					S1 = 3'b001,
					S2 = 3'b010,
					S3 = 3'b011,
					S4 = 3'b100;
				
	wire clk;
	wire [3:0] data_i;
	wire data_o;
				
	wire [2:0] CurrentState;
	wire [2:0] NextState;
	
	NEXTSTATE NextState_Inst(
		.data_i(data_i),
		.NextState_o(NextState),
		.CurrentState_i(CurrentState)
	);
	
	REG Reg_Inst(
		.data_o(CurrentState),
		.data_i(NextState),
		.clk(clk)
	);
	
	OUTPUT Output_Inst(
		.data_o(data_o),
		.CurrentState_i(CurrentState)
	);
endmodule