module YhMinusYl(data_i, data_o);
	input [22:0] data_i;
	output reg [22:0] data_o;
	
	reg [23:0] Yh, Yl, YhSubYl;
	
	always @ (data_i) begin
		Yh = {1'd1, data_i[22:11], 11'd0};
		Yl = {13'd0, data_i[10:0]};
		YhSubYl = Yh - Yl;
		data_o = YhSubYl[22:0];
	end
endmodule