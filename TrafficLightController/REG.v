module REG(d, q, clk, rst);
	input [5:0] d;
	input clk, rst;
	output reg [5:0] q;
	
	always @ (posedge clk) begin
		q <= ~rst ? d : 1'b0;
	end
endmodule