module CONVERTER(data_o, data_i);
	input 	[5:0]	data_i;
	output	[5:0] data_o;
	
	wire		[5:0] data_i;
	reg 		[5:0] data_o;
	
	always @ (data_i) begin
		case (data_i)
			6'd0: data_o = 6'd0;
			6'd1: data_o = 6'd1;
			6'd2: data_o = 6'd2;
			6'd3: data_o = 6'd3;
			6'd4: data_o = 6'd4;
			6'd5: data_o = 6'd5;
			6'd6: data_o = 6'd6;
			6'd7: data_o = 6'd7;
			default: data_o = 6'd0;
		endcase
	end
endmodule