module DATABLOCK
(
	PCSrc_i,
	RegSrc_i,
	RegEn_i,
	ALUSrc_i,
	ALUOp_i,
	DMEMWr_i,
	WrSrc_i,
	Inst_o,
	Clk
);
	input PCSrc_i, RegSrc_i, RegEn_i, ALUSrc_i, DMEMWr_i, WrSrc_i, Clk;
	input [3:0] ALUOp_i;
	output [4:0] Inst_o;
	
	wire PCSrc_i, RegScr_i, RegEn_i, ALUSrc_i, DMEMWr_i, WrSrc_i, Clk;
	wire [3:0] ALUOp_i;
	wire [4:0] Inst_o;

	// Internal wires declaration
	wire [15:0] PC_Out, PCSrc_Out, AddTwo_Out, AddShiftOne_Out,
					ShiftOne_Out, IMEM_Out, WrSrc_Out,
					A_Out, B_Out, ALUSrc_Out, SignExtend_Out, ALU_Out,
					DMEM_Out;
	wire [2:0] RegSrc_Out;
	
	assign Inst_o = IMEM_Out[15:11];
	
	REG PC(
		.data_o(PC_Out),
		.data_i(PCSrc_Out),
		.clk(Clk),
		.WEn_i(1'b1)
	);
	MUX2to1 PCSrc_Sel(
		.data0_i(AddTwo_Out),
		.data1_i(AddShiftOne_Out),
		.data_o(PCSrc_Out),
		.sel_i(PCSrc_i)
	);
	ADDER Add_Two(
		.dataA_i(PC_Out),
		.dataB_i(2'd2),
		.data_o(AddTwo_Out)
	);
	ADDER Add_ShiftLeft_One(
		.dataA_i(ShiftOne_Out),
		.dataB_i(PC_Out),
		.data_o(AddShiftOne_Out)
	);
	IMEM IMEM_Inst(
		.addr(PC_Out[5:1]),
		.q(IMEM_Out)
	);
	MUX2to1_3bit RegSrc_Sel(
		.data0_i(IMEM_Out[10:8]),
		.data1_i(IMEM_Out[4:2]),
		.data_o(RegSrc_Out),
		.sel_i(RegSrc_i)
	);
	REGFile REGFile_Inst(
		.AddrA_i(IMEM_Out[7:5]),
		.AddrB_i(RegSrc_Out),
		.data_i(WrSrc_Out),
		.AddrWr_i(IMEM_Out[10:8]),
		.WEn(RegEn_i),
		.Clk(Clk),
		.dataA_o(A_Out),
		.dataB_o(B_Out)
	);
	MUX2to1 ALUSrc_Sel(
		.data0_i(B_Out),
		.data1_i(SignExtend_Out),
		.data_o(ALUSrc_Out),
		.sel_i(ALUSrc_i)
	);
	ALU ALU_Inst(
		.A_i(A_Out),
		.B_i(ALUSrc_Out),
		.data_o(ALU_Out),
		.ALU_OpCode_i(ALUOp_i)
	);
	DMEM DMEM_Inst(
		.Addr_i(ALU_Out[4:0]),
		.data_i(B_Out),
		.WEn_i(DMEMWr_i),
		.data_o(DMEM_Out),
		.clk(Clk)
	);
	MUX2to1 WrSrc_Sel(
		.data0_i(DMEM_Out),
		.data1_i(ALU_Out),
		.data_o(WrSrc_Out),
		.sel_i(WrSrc_i)
	);
	SignExtend SignExtend_Inst(
		.data_i(IMEM_Out[4:0]),
		.data_o(SignExtend_Out)
	);
	LeftShiftOneBit LSOB_Inst(
		.data_i(SignExtend_Out),
		.data_o(ShiftOne_Out)
	);
endmodule