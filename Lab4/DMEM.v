module DMEM(Addr_i, data_i, WEn_i, data_o, clk);
	input [15:0] data_i;
	input [4:0] Addr_i;
	input WEn_i, clk;
	output [15:0] data_o;
	
	wire [15:0] data_i;
	wire [4:0] Addr_i;
	wire WEn_i, clk;
	wire [15:0] data_o;
	
	reg [15:0] dmem[31:0];
	
	initial begin
		$readmemb("init_mem.txt", dmem);
	end

	always @ (negedge clk) begin
		if (WEn_i) dmem[Addr_i] <= data_i;
	end

	assign data_o = dmem[Addr_i];
endmodule