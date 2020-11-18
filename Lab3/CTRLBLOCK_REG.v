module CTRLBLOCK_REG(data_o, data_i ,clk);
	input clk;
	input		[3:0]	data_i;
	output	[3:0]	data_o;
	
	// Declare ports' data type
	wire		clk;
	wire 		[3:0]	data_i;
	reg 		[3:0]	data_o;
	
	//Function description
	always @ (posedge clk) begin
		// Block of codes need to be executed
		// Use "<=" in sequential circuits
		// Use "=" in combinational circuits
		data_o <= data_i;
	end
endmodule