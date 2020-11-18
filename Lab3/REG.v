module REG(data_o, data_i ,clk, WEn_i);
	input clk, WEn_i;
	input		[15:0]	data_i;
	output	[15:0]	data_o;
	
	// Declare ports' data type
	wire		clk, WEn_i;
	wire 		[15:0]	data_i;
	reg 		[15:0]	data_o;
	
	//Function description
	always @ (posedge clk) begin
		// Block of codes need to be executed
		// Use "<=" in sequential circuits
		// Use "=" in combinational circuits
		data_o <= (WEn_i) ? data_i : data_o;
		// if (WEn_i) data_o <= data_i;
		// else data_o <= 15'd0;
	end
endmodule