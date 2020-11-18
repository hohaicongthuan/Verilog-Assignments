module ASIC_Lab3(data_i, data_o, clk);
	input [15:0] data_i;
	input clk;
	output [15:0] data_o;
	
	wire [15:0] data_i, data_o;
	wire clk;
	
	// Internal wires
	wire InputEn_o, WriteEn_o, OutputEn_o, clk_N;
	wire [2:0] WriteAddr_o, ReadAddr_A_o, ReadAddr_B_o;
	wire [1:0] ALUOpcode_o, SHAMT_o;
	
	not(clk_N, clk);
	
	DATABLOCK DataBlock_Inst(
		.data_i(data_i),
		.InEn_i(InputEn_o),
		.AddrA_i(ReadAddr_A_o),
		.AddrB_i(ReadAddr_B_o),
		.AddrWr_i(WriteAddr_o),
		.WEn_i(WriteEn_o),
		.data_o(data_o),
		.Clk_i(clk_N),
		.ALU_OpCode_i(ALUOpcode_o),
		.SHAMT_i(SHAMT_o),
		.OutEn_i(OutputEn_o)
	);
	
	CONTROLBLOCK ControlBlock_Inst(
		.clk(clk),
		.InputEn_o(InputEn_o),
		.WriteEn_o(WriteEn_o),
		.WriteAddr_o(WriteAddr_o),
		.ReadAddr_A_o(ReadAddr_A_o),
		.ReadAddr_B_o(ReadAddr_B_o),
		.ALUOpcode_o(ALUOpcode_o),
		.SHAMT_o(SHAMT_o),
		.OutputEn_o(OutputEn_o)
	);
endmodule