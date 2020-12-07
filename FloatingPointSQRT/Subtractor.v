module Subtractor(data_iA, data_iB, data_o);
	input [7:0] data_iA, data_iB;
	output [7:0] data_o;
	
	assign data_o = data_iA - data_iB;
endmodule