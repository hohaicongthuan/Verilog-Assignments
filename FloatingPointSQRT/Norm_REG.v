// This module is a part of the Normalisation module

module Norm_REG(data_i, data_o, clk);
	input [7:0] data_i;
	input clk;
	output reg [7:0] data_o;
	
	always @ (posedge clk) begin
		data_o <= data_i;
	end
endmodule