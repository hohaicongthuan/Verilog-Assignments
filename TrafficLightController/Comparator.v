module Comparator(i_A, i_B, Out);
	parameter DATA_WIDTH = 6;

	input [DATA_WIDTH - 1:0] i_A, i_B;
	output Out;
	
	assign Out = (i_B >= i_A) ? 1'b1 : 1'b0;
endmodule