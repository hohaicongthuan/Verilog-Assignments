module COUNTER(count_o, load_i, value_i, clk);
	input 	clk, load_i;
	input		[3:0] value_i;
	output 	[3:0] count_o;
	
	wire 	clk, load_i;
	wire	[3:0] count_o;
	wire	[3:0] value_i;
	
	// Internal wires
	wire	[2:0] adder_o;
	wire	[2:0] reg_o, loader_o;           
	
	REG			register_inst0(
											.clk(clk),
											.data_i(loader_o),
											.data_o(reg_o)
										);
	LOADER		loader_inst0(
										.data_o(loader_o),
										.load_i(load_i),
										.value_i(value_i),
										.data_i(adder_o)
									);
	ADDER			adder_inst0(
										.data_i(reg_o),
										.data_o(adder_o)
									);
	CONVERTER	converter_inst0(
											.data_i(reg_o),
											.data_o(count_o)
										);
endmodule