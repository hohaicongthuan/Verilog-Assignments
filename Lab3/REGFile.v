module REGFile(AddrA_i, AddrB_i, data_i, AddrWr_i, WEn, Clk, dataA_o, dataB_o);
	input [2:0] AddrA_i, AddrB_i, AddrWr_i;
	input [15:0] data_i;
	input WEn, Clk;
	output [15:0] dataA_o, dataB_o;
	
	wire [2:0] AddrA_i, AddrB_i, AddrWr_i;
	wire [15:0] data_i;
	wire WEn, Clk;
	wire [15:0] dataA_o, dataB_o;
	
	// 8 registers, each with 16-bit width
	reg [15:0] registers [7:0];
	
	//reg [15:0] out_valueA, out_valueB;
	
	always @ (posedge Clk) begin
		
		registers[AddrWr_i] <= (WEn) ? data_i : registers[AddrWr_i];
		/*
		if (WEn) begin
				registers[AddrWr_i] <= data_i;
			end
		else begin
			dataA_o <= registers[AddrA_i];
			dataB_o <= registers[AddrB_i];
		end
		*/
	end
	
	assign dataA_o = registers[AddrA_i];
	assign dataB_o = registers[AddrB_i];
	
	/*
	assign dataA_o = WEn ? 16'dz : out_valueA;
	assign dataB_o = WEn ? 16'dz : out_valueB;
	*/
endmodule 