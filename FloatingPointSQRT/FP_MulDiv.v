module FP_MulDiv(data_iA, data_iB, data_o);
	input [31:0] data_iA, data_iB;
	output reg [31:0] data_o;
	
	reg SignProduct;
	reg [7:0] ExpA, ExpB, ExpProduct;
	reg [22:0] MantA, MantB;
	reg [22:0] MantProduct;
	reg [31:0] Product;
	
	always @ (data_iA, data_iB) begin
		// Separate all components (exponents, mantissas)
		ExpA = data_iA[30:23]; ExpB = data_iB[30:23];
		MantA = data_iA[22:0];
		MantB = data_iB[22:0];
		
		// Sub the two exponents
		ExpProduct = (ExpA - ExpB) - 8'd127;
		
		// Div the two Mantissas
		MantProduct = MantA / MantB;
		
		// Calculate result sign
		SignProduct = data_iA[31] ^ data_iB[31];
		
		// Output
		data_o = {SignProduct, ExpProduct[7:0], MantProduct[22:0]};
	end
	
	/*
	always @ (*) begin
		MantProduct_temp = MantProduct;
		if (MantProduct_temp[23] != 1'b1) begin
			MantProduct = MantProduct_temp << 1;
			MantProduct_temp = MantProduct;
		end
		else begin
			MantProduct = MantProduct_temp;
		end
	end
	*/
	
endmodule