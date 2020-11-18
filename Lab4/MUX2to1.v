module MUX2to1(data0_i, data1_i, data_o, sel_i);
	input [15:0] data0_i, data1_i;
	input sel_i;
	output [15:0] data_o;
	
	wire [15:0] data0_i, data1_i, data_o;
	wire sel_i;
	
	assign data_o = (sel_i == 1'b0) ? data0_i : data1_i;
endmodule