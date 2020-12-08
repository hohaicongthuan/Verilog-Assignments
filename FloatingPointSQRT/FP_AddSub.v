module FP_AddSub(data_iA, data_iB, data_o, AddSub_Sel);
	input [31:0] data_iA, data_iB;
	input AddSub_Sel;
	output reg [31:0] data_o;
	
	reg SignProduct;
	reg [31:0] BigFloat, SmallFloat;
	reg [7:0] ExpA, ExpB, ExpDiff;
	reg [23:0] MantA, MantB, shiftedMant, Product;
	
	always @ (data_iA, data_iB, AddSub_Sel) begin
			// Find out which number has the bigger exponent
			if (data_iA[30:23] > data_iB[30:23]) begin
				BigFloat = data_iA;
				SmallFloat = data_iB;
			end else begin
				BigFloat = data_iB;
				SmallFloat = data_iA;
			end
			
			// Separate all components (exponent, mantissa)
			ExpA = BigFloat[30:23]; ExpB = SmallFloat[30:23];
			MantA = { 1'b1, BigFloat[22:0] };
			MantB = { 1'b1, SmallFloat[22:0] };
			
			// Find exponents difference
			ExpDiff = ExpA - ExpB;
			
			// Shift Right the smaller Exponent to make the two equal
			shiftedMant = MantB >> ExpDiff;
			
			// Add/Sub two Mantissas
			Product = (~AddSub_Sel) ? MantA + shiftedMant : MantA - shiftedMant;
			
			// Calculate result sign
			// by listing all of the situations where the product could be negative
			if ((BigFloat == data_iB) && AddSub_Sel)
				SignProduct = 1'b1;
			else
				if ((BigFloat == data_iB) && ~AddSub_Sel && BigFloat[31])
						SignProduct = 1'b1;
			else SignProduct = 1'b0;
			
			// Output
			data_o = { SignProduct, ExpA[7:0],Product[22:0] };
	end
endmodule