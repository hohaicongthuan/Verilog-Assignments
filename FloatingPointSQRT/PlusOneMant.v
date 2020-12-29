module PlusOneMant(data_i, data_o);
	parameter BUS_WIDTH = 32;
	
	input [BUS_WIDTH - 1:0] data_i;
	output reg [BUS_WIDTH - 1:0] data_o;
	
	always @ (data_i) begin
		data_o = { data_i[31:23], data_i[22:0] + 23'd1 };
	end
endmodule