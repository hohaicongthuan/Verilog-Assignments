module RegisterFile(addr_rda_i, addr_rdb_i, data_i, addr_wr_i, WE_i, clk, RDA_o, RDB_o);
	input [2:0] addr_rda_i, addr_rdb_i, addr_wr_i;
	input [31:0] data_i;
	input WE_i, clk;
	output reg[31:0] RDA_o, RDB_o;
	
	// 8 registers, each with 32-bit width
	reg [31:0] registers [7:0];

	always @ (posedge clk) begin
		registers[addr_wr_i] <= (WE_i) ? data_i : registers[addr_wr_i];
	end

	always @ (addr_rda_i, addr_rdb_i) begin
		case (addr_rda_i)
			3'd0: RDA_o = 32'd0;
			3'd5: RDA_o = 32'b01000000000000000000000000000000;
			3'd6: RDA_o = 32'b00111100001000111101011100001010;
			default: RDA_o = registers[addr_rda_i];
		endcase
		
		case (addr_rdb_i)
			3'd0: RDB_o = 32'd0;
			3'd5: RDB_o = 32'b01000000000000000000000000000000;
			3'd6: RDB_o = 32'b00111100001000111101011100001010;
			default: RDB_o = registers[addr_rdb_i];
		endcase
	end
	
endmodule 
