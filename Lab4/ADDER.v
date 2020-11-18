module ADDER(dataA_i, dataB_i, data_o);
	input [15:0] dataA_i, dataB_i;
	output [15:0] data_o;
	
	wire [15:0] dataA_i, dataB_i;
	wire [15:0] data_o;
	
	assign data_o = dataA_i + dataB_i;
endmodule