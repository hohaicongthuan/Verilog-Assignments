module AddSub(data_iA, data_iB, data_o, Sel);
	input [22:0] data_iA, data_iB;
	input Sel;
	output [22:0] data_o;
	
	assign data_o = (~Sel) ? (data_iA + data_iB) : (data_iA - data_iB);
endmodule