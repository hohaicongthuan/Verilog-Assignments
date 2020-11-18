module IMEM (
	input [4:0] addr,
	output reg [15:0] q
);

	reg [15:0] rom[31:0];

	initial begin
		$readmemb("binary.txt", rom);
	end

	always @ (addr) begin
		q = rom[addr];
	end

endmodule
