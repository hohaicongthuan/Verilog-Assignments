module CONVERTER(data_o, data_i);
	input 	[2:0]	data_i;
	output	[3:0] data_o;
	
	wire		[2:0] data_i;
	reg 		[3:0] data_o;
	
	always @ (data_i) begin
		case (data_i)
			3'd0: data_o = 4'd1;
			3'd1: data_o = 4'd8;
			3'd2: data_o = 4'd5;
			3'd3: data_o = 4'd2;
			3'd4: data_o = 4'd1;
			3'd5: data_o = 4'd4;
			3'd6: data_o = 4'd6;
			3'd7: data_o = 4'd9;
			default: data_o = 4'd0;
		endcase
	end
endmodule