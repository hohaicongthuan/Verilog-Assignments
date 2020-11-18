module CONTROLBLOCK	(	clk, InputEn_o, WriteEn_o,
								WriteAddr_o, ReadAddr_A_o, ReadAddr_B_o, ALUOpcode_o,
								SHAMT_o, OutputEn_o
							);
	input clk;
	output InputEn_o, WriteEn_o, OutputEn_o;
	output [2:0] WriteAddr_o, ReadAddr_A_o, ReadAddr_B_o;
	output [1:0] ALUOpcode_o, SHAMT_o;
	
	wire clk;
	wire InputEn_o, WriteEn_o, OutputEn_o;
	wire [2:0] WriteAddr_o, ReadAddr_A_o, ReadAddr_B_o;
	wire [1:0] ALUOpcode_o, SHAMT_o;
				
	wire [3:0] CurrentState;
	wire [3:0] NextState;
	
	NEXTSTATE NextState_Inst(
		.NextState_o(NextState),
		.CurrentState_i(CurrentState)
	);
	
	CTRLBLOCK_REG Reg_Inst(
		.data_o(CurrentState),
		.data_i(NextState),
		.clk(clk)
	);
	
	OUTPUT Output_Inst(
		.InputEn_o(InputEn_o),
		.WriteEn_o(WriteEn_o),
		.WriteAddr_o(WriteAddr_o),
		.ReadAddr_A_o(ReadAddr_A_o),
		.ReadAddr_B_o(ReadAddr_B_o),
		.ALUOpcode_o(ALUOpcode_o),
		.SHAMT_o(SHAMT_o),
		.OutputEn_o(OutputEn_o),
		.CurrentState_i(CurrentState)
	);
endmodule