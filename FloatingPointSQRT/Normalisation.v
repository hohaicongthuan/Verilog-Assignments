module Normalisation(data_iMant, data_iExp, data_oMant, data_oExp, clk);
	input clk;
	input [45:0] data_iMant;
	input [7:0] data_iExp;
	output reg [22:0] data_oMant;
	output reg [7:0] data_oExp;
	
	reg [45:0] Mantissa;
	reg [7:0] Exponent;
	/*
	Norm_Shifter Norm_Shifter_Inst();
	Norm_AddSub Norm_AddSub_Inst();
	Norm_Comparator Norm_Comparator_Inst();
	Norm_REG Norm_REG_Inst();
	*/
endmodule