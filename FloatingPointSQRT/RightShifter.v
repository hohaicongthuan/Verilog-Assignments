module RightShifter(data_i, data_o, SHAMT);
	input [22:0] data_i;
	input [7:0] SHAMT;
	output [22:0] data_o;
	
	assign data_o = data_i >> SHAMT;
endmodule