// This module will find a correct exponent for the LUT mantissa
// to make an accurate value of 1/(Yh^2)

module LUT_Exponent(data_i, data_o);
	input [7:0] data_i;
	output reg [7:0] data_o;
	
	always @ (data_i) begin
		data_o = (8'd0 - (data_i - 8'd127) - 8'd1) + 8'd127;
	end
endmodule