module LOADER(data_o, load_i, value_i, data_i);
	input		[5:0] value_i;
	input		[5:0] data_i;
	input 	load_i;
	output 	[5:0] data_o;
	
	wire		[5:0] value_i;
	wire		[5:0] data_i;
	wire	 	load_i;
	reg 		[5:0] data_o;
	
	always @ (data_i, load_i, value_i) begin
		if (load_i == 1'b0) data_o <= data_i;
		else data_o <= value_i;
	end
endmodule