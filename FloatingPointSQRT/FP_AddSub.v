module FP_AddSub(data_iA, data_iB, data_o, AddSub_Sel);
	input [31:0] data_iA, data_iB;
	input AddSub_Sel;
	output reg [31:0] data_o;
	
	reg SignProduct;
	reg [31:0] BigFloat;
	reg [7:0] ExpA, ExpB, ExpDiff, ExpFinal;
	reg [24:0] MantA, MantB, shiftedMant, Product, MantFinal;
	
	always @ (data_iA, data_iB, AddSub_Sel) begin
			// Separate all components (sign, exponent, mantissa)
			ExpA = data_iA[30:23];
			ExpB = data_iB[30:23];
			MantA = { 2'b01, data_iA[22:0] };
			MantB = { 2'b01, data_iB[22:0] };
			
			// Find out which number has the bigger exponent
			if (data_iA[30:23] - 8'd127 > data_iB[30:23] - 8'd127) begin
				BigFloat = data_iA;
			end else begin
				BigFloat = data_iB;
			end
			
			if (data_iA == BigFloat)
				begin
					// Find exponents difference
					ExpDiff = ExpA - ExpB;
			
					// Shift Right the smaller Exponent to make the two equal
					shiftedMant = MantB >> ExpDiff;
					
					ExpFinal = ExpA;
				end
			else begin
					// Find exponents difference
					ExpDiff = ExpB - ExpA;
			
					// Shift Right the smaller Exponent to make the two equal
					shiftedMant = MantA >> ExpDiff;
					
					ExpFinal = ExpB;
			end
			
			
			// Add/Sub two Mantissas
			if (data_iB[31] ^ AddSub_Sel == 0)
				begin
					Product = MantA + shiftedMant;
					
					// Normalise the mantissa and adjust the exponent
					MantFinal = Product >> 1;
					ExpFinal = ExpFinal + 8'd1;
				end
			else 
				begin
					Product = MantA - shiftedMant;
					
					// Normalise the mantissa and adjust the exponent
					if (Product & 25'b0010000000000000000000000 != 1'b0)
						begin
							MantFinal = Product << 1;
							ExpFinal = ExpFinal - 8'd1;
						end
					else if (Product & 25'b0001000000000000000000000 != 1'b0)
						begin
							MantFinal = Product << 2;
							ExpFinal = ExpFinal - 8'd2;
						end
					else if (Product & 25'b0000100000000000000000000 != 1'b0)
						begin
							MantFinal = Product << 3;
							ExpFinal = ExpFinal - 8'd3;
						end
					else if (Product & 25'b0000010000000000000000000 != 1'b0)
						begin
							MantFinal = Product << 4;
							ExpFinal = ExpFinal - 8'd4;
						end
					else if (Product & 25'b0000001000000000000000000 != 1'b0)
						begin
							MantFinal = Product << 5;
							ExpFinal = ExpFinal - 8'd5;
						end
					else if (Product & 25'b0000000100000000000000000 != 1'b0)
						begin
							MantFinal = Product << 6;
							ExpFinal = ExpFinal - 8'd6;
						end
					else if (Product & 25'b0000000010000000000000000 != 1'b0)
						begin
							MantFinal = Product << 7;
							ExpFinal = ExpFinal - 8'd7;
						end
					else if (Product & 25'b0000000001000000000000000 != 1'b0)
						begin
							MantFinal = Product << 8;
							ExpFinal = ExpFinal - 8'd8;
						end
					else if (Product & 25'b0000000000100000000000000 != 1'b0)
						begin
							MantFinal = Product << 9;
							ExpFinal = ExpFinal - 8'd9;
						end
					else if (Product & 25'b0000000000010000000000000 != 1'b0)
						begin
							MantFinal = Product << 10;
							ExpFinal = ExpFinal - 8'd10;
						end
					else if (Product & 25'b0000000000001000000000000 != 1'b0)
						begin
							MantFinal = Product << 11;
							ExpFinal = ExpFinal - 8'd11;
						end
					else if (Product & 25'b0000000000000100000000000 != 1'b0)
						begin
							MantFinal = Product << 12;
							ExpFinal = ExpFinal - 8'd12;
						end
					else if (Product & 25'b0000000000000010000000000 != 1'b0)
						begin
							MantFinal = Product << 13;
							ExpFinal = ExpFinal - 8'd13;
						end
					else if (Product & 25'b0000000000000001000000000 != 1'b0)
						begin
							MantFinal = Product << 14;
							ExpFinal = ExpFinal - 8'd14;
						end
					else if (Product & 25'b0000000000000000100000000 != 1'b0)
						begin
							MantFinal = Product << 15;
							ExpFinal = ExpFinal - 8'd15;
						end
					else if (Product & 25'b0000000000000000010000000 != 1'b0)
						begin
							MantFinal = Product << 16;
							ExpFinal = ExpFinal - 8'd16;
						end
					else if (Product & 25'b0000000000000000001000000 != 1'b0)
						begin
							MantFinal = Product << 17;
							ExpFinal = ExpFinal - 8'd17;
						end
					else if (Product & 25'b0000000000000000000100000 != 1'b0)
						begin
							MantFinal = Product << 18;
							ExpFinal = ExpFinal - 8'd18;
						end
					else if (Product & 25'b0000000000000000000010000 != 1'b0)
						begin
							MantFinal = Product << 19;
							ExpFinal = ExpFinal - 8'd19;
						end
					else if (Product & 25'b0000000000000000000001000 != 1'b0)
						begin
							MantFinal = Product << 20;
							ExpFinal = ExpFinal - 8'd20;
					end
					else if (Product & 25'b0000000000000000000000100 != 1'b0)
						begin
							MantFinal = Product << 21;
							ExpFinal = ExpFinal - 8'd21;
						end
					else if (Product & 25'b0000000000000000000000010 != 1'b0)
						begin
							MantFinal = Product << 22;
							ExpFinal = ExpFinal - 8'd22;
						end
					else if (Product & 25'b0000000000000000000000001 != 1'b0)
						begin
							MantFinal = Product << 23;
							ExpFinal = ExpFinal - 8'd23;
						end
					else
						begin
							MantFinal = 25'd0;
							ExpFinal = 8'd0;
						end
				end
			
			// Calculate result sign
			if (data_iA == BigFloat)
				begin
					SignProduct = (~data_iA[31]) ? 1'b0 : 1'b1;
				end
			else SignProduct = data_iB[31] ^ AddSub_Sel;
			
			// Output
			data_o = { SignProduct, ExpFinal[7:0], MantFinal[22:0] };
	end
endmodule