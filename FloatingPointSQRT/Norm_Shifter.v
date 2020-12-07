// This module is part of the Normalisation module

module Norm_Shifter(data_i, data_o, ShL, ShR, clk);
	input [45:0] data_i;
	input clk, ShL, ShR;
	output reg [45:0] data_o;
	
	always @ (posedge clk) begin
		if (ShL) data_o <= data_i << 1;
		else if (ShR) data_o <= data_i >> 1;
		else data_o <= data_i;
	end
endmodule