module FSM_REG(d, q, clk);
	input [1:0] d;
	input clk;
	output reg [1:0] q;
	
	always @ (posedge clk) begin
		q <= d;
	end
endmodule