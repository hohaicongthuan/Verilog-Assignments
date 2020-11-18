module REG(data_o, data_i ,clk);
	input clk;
	input		[2:0]	data_i;
	output	[2:0]	data_o;
	
	// Declare ports' data type
	wire		clk;
	wire 		[2:0]	data_i;
	reg 		[2:0]	data_o;
	
	//Function description
	always @ (posedge clk) begin
		// Block of codes need to be executed
		// Use "<=" in sequential circuits
		// Use "=" in combinational circuits
		data_o <= data_i;
	end
endmodule