module DATABLOCK
(
	PCSrc_i,
	RegScr_i,
	RegEn_i,
	ALUSrc_i,
	ALUOp_i,
	DMEMWr_i,
	WrSrc_i,
	Inst_o,
	Clk
);
	input PCSrc_i, RegScr_i, RegEn_i, ALUSrc_i, DMEMWr_i, WrSrc_i, Clk;
	input [3:0] ALUOp_i;
	output [4:0] Inst_o;
	
	wire PCSrc_i, RegScr_i, RegEn_i, ALUSrc_i, DMEMWr_i, WrSrc_i, Clk;
	wire [3:0] ALUOp_i;
	wire [4:0] Inst_o;

	REG PC(
		.data_o(),
		.data_i(),
		.clk(),
		.WEn_i()
	);
	MUX2to1 PCSrc_Sel(
		.data0_i(),
		.data1_i(),
		.data_o(),
		.sel_i()
	);
	ADDER Add_Two(
		.dataA_i(),
		.dataB_i(),
		.data_o()
	);
	ADDER Add_ShiftLeft_One(
		.dataA_i(),
		.dataB_i(),
		.data_o()
	);
	IMEM IMEM_Inst(
		.addr(),
		.q()
	);
	MUX2to1 RegSrc_Sel(
		.data0_i(),
		.data1_i(),
		.data_o(),
		.sel_i()
	);
	REGFile REGFile_Inst(
		.AddrA_i(),
		.AddrB_i(),
		.data_i(),
		.AddrWr_i(),
		.WEn(),
		.Clk(),
		.dataA_o(),
		.dataB_o()
	);
	MUX2to1 ALUSrc_Sel(
		.data0_i(),
		.data1_i(),
		.data_o(),
		.sel_i()
	);
	ALU ALU_Inst(
		.A_i(),
		.B_i(),
		.data_o(),
		.ALU_OpCode_i()
	);
	DMEM DMEM_Inst(
		.Addr_i(),
		.data_i(),
		.WEn_i(),
		.data_o(),
		.clk()
	);
	MUX2to1 WrSrc_Sel(
		.data0_i(),
		.data1_i(),
		.data_o(),
		.sel_i()
	);
	SignExtend SignExtend_Inst(
		.data_i(),
		.data_o()
	);
	LeftShiftOneBit LSOB_Inst(
		.data_i(),
		.data_o()
	);
endmodule