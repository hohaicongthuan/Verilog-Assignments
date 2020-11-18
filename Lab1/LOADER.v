module LOADER(data_o, load_i, value_i, data_i);
	input		[3:0] value_i;
	input		[2:0] data_i;
	input 	load_i;
	output 	[2:0] data_o;
	
	wire		[3:0] value_i;
	wire		[2:0] data_i;
	wire	 	load_i;
	reg 		[2:0] data_o;
	
	always @ (data_i, load_i, value_i) begin
		if (load_i == 1'b0) data_o = data_i;
		else
		begin
			case (value_i)
				4'd1: data_o = 3'd0;
				4'd8: data_o = 3'd1;
				4'd5: data_o = 3'd2;
				4'd2: data_o = 3'd3;
				4'd4: data_o = 3'd5;
				4'd6: data_o = 3'd6;
				4'd9: data_o = 3'd7;
				default: data_o = 3'd0;
			endcase
		end
	end
endmodule