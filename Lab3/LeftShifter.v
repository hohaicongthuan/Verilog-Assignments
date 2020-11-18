module LeftShifter(data_i, SHAMT_i, data_o);
	input [15:0] data_i;
	input [1:0] SHAMT_i;	// Shift amount
	output [15:0] data_o;
	
	wire [15:0] data_i;
	wire [1:0] SHAMT_i;
	reg [15:0] data_o;
	
	always @ (SHAMT_i, data_i) begin
		case (SHAMT_i)
			2'b00: data_o = data_i;
			2'b01: data_o = data_i << 2'd1;
			2'b10: data_o = data_i << 2'd2;
			2'b11: data_o = data_i << 2'd3;
		endcase
	end
endmodule