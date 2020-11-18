module DATABLOCK(	data_i, InEn_i, AddrA_i, AddrB_i,
						AddrWr_i, WEn_i, data_o, Clk_i, 
						ALU_OpCode_i, SHAMT_i, OutEn_i
						);
						
	input InEn_i, WEn_i, Clk_i, OutEn_i;
	input [2:0] AddrA_i, AddrB_i, AddrWr_i;
	input [1:0] ALU_OpCode_i, SHAMT_i;
	input [15:0] data_i;
	output [15:0] data_o;
	
	wire InEn_i, WEn_i, Clk_i, OutEn_i;
	wire [2:0] AddrA_i, AddrB_i, AddrWr_i;
	wire [1:0] ALU_OpCode_i, SHAMT_i;
	wire [15:0] data_i;
	wire [15:0] data_o;
	
	// Internal wires
	wire [15:0] InSel_Out, ReadA_Out, ReadB_Out, ALU_Out, Shifter_Out;
	
	MUX2to1 InputSelector_Inst(
		.data0_i(Shifter_Out),
		.data1_i(data_i),
		.data_o(InSel_Out),
		.sel_i(InEn_i)
	);
	
	REGFile RegisterFile_Inst(
		.AddrA_i(AddrA_i),
		.AddrB_i(AddrB_i),
		.data_i(InSel_Out),
		.AddrWr_i(AddrWr_i),
		.WEn(WEn_i),
		.Clk(Clk_i),
		.dataA_o(ReadA_Out),
		.dataB_o(ReadB_Out)
	);
	
	ALU ALU_Inst(
		.A_i(ReadA_Out),
		.B_i(ReadB_Out),
		.data_o(ALU_Out),
		.ALU_OpCode_i(ALU_OpCode_i)
	);
	
	LeftShifter LeftShifter_Inst(
		.data_i(ALU_Out),
		.SHAMT_i(SHAMT_i),
		.data_o(Shifter_Out)
	);
	
	REG Register_Inst(
		.data_o(data_o),
		.data_i(Shifter_Out),
		.clk(Clk_i),
		.WEn_i(OutEn_i)
	);
endmodule