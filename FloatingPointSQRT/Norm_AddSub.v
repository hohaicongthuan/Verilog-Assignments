// This module is a part of the Normalisation module

module Norm_AddSub(data_iA, data_iB, Sel, data_o);
	input [7:0] data_iA, data_iB;
	input Sel;
	output [7:0] data_o;
	
	assign data_o = (~Sel) ? data_iA + data_iB : data_iA - data_iB;
endmodule