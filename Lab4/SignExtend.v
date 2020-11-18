module SignExtend(data_i, data_o);
	input [4:0] data_i;
	output [15:0] data_o;
	
	wire [4:0] data_i;
	wire [15:0] data_o;
	
	assign data_o = (data_i[4] == 1'b1) ? {{11{1'b1}}, data_i} : {{11{1'b0}}, data_i};
endmodule