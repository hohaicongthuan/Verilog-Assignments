module LeftShiftOneBit(data_i, data_o);
	input [15:0] data_i;
	output [15:0] data_o;
	
	wire [15:0] data_i, data_o;
	
	assign data_o = data_i << 1;
endmodule