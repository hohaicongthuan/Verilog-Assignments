`timescale 1ns/1ps
module Testbench();
	reg clk;
	reg [5:0] ShortTime_i, LongTime_i;
	wire HR, HY, HG, FR, FY, FG;

	integer i;

	initial begin
		clk = 1'b0;
		ShortTime_i = 6'd3;
		LongTime_i = 6'd5;
		for (i = 0; i < 100; i = i + 1) begin
			#10;
			clk = ~clk;
		end
		#2000 $finish;
	end

TrafficLightController TrafficLightController_inst0(
	.clk(clk),
	.ShortTime_i(ShortTime_i),
	.LongTime_i(LongTime_i),
	.HG(HG),
	.HY(HY),
	.HR(HR),
	.FG(FG),
	.FY(FY),
	.FR(FR)
);

endmodule