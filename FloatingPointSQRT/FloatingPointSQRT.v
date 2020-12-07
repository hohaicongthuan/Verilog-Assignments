module FloatingPointSQRT(data_i, data_o);
	input [31:0] data_i;
	output [31:0] data_o;
	
	assign data_o = $sqrt(32'd9);
endmodule