// This module is a part of the Normalisation module

module Norm_Comparator(data_i, equal, greater, less);
	// Compare data_i with 1
	
	input [22:0] data_i;
	output equal, greater, less;
	
	assign equal = (data_i == 23'd1) ? 1'b1 : 1'b0;
	assign greater = (data_i > 23'd1) ? 1'b1 : 1'b0;
	assign less = (data_i == 23'd0) ? 1'b1 : 1'b0;
endmodule