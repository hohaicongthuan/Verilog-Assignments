module ADDER(data_o, data_i);
	input 	[5:0]	data_i;
	output	[5:0] data_o;
	
	wire	[5:0] data_i;
	reg	[5:0] data_o;
	
	always @ (data_i) begin
		data_o = data_i + 6'd1;
	end
	// If "assign" is used, wire data type must be declared
	// If "always" is used, reg data type must be declared
	
endmodule