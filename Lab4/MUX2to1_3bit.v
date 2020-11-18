module MUX2to1_3bit(data0_i, data1_i, data_o, sel_i);
	input [2:0] data0_i, data1_i;
	input sel_i;
	output [2:0] data_o;
	
	wire [2:0] data0_i, data1_i, data_o;
	wire sel_i;
	
	assign data_o = (sel_i == 1'b0) ? data0_i : data1_i;
endmodule