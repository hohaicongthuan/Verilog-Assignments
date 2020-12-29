// This module is a part of FP_Div.v (floating-point divider)

// This module will check and generate appropriate
// outputs for each special case in division

module OutputGenerator(data_o_i, data_iA, data_iB, data_o);
	parameter BUS_WIDTH = 32;
	
	input [BUS_WIDTH - 1:0] data_o_i, data_iA, data_iB;
	output reg [BUS_WIDTH - 1:0] data_o;
	
	reg [7:0] ExpA, ExpB, ExpFinal;
	
	always @ (data_o_i, data_iA, data_iB) begin
		ExpA = data_iA[30:23] - 8'd127;
		ExpB = data_iB[30:23] - 8'd127;
		ExpFinal = (ExpA - ExpB) + 8'd127;
		
		if (data_iA[30:0] == 31'd0)
			begin
				if (data_iB[30:0] == 31'd0) 
					begin
						data_o = 32'b11111111111111111111111111111111;
					end
				else if (data_iB[30:0] == 31'b1111111111111111111111111111111)
					begin
						data_o = 32'b11111111111111111111111111111111;
					end
				else begin data_o = { data_o_i[31], 31'd0 }; end
			end
		else if (data_iA[30:0] == 31'b1111111111111111111111111111111)
				begin
					data_o = 32'b11111111111111111111111111111111;
				end
		else if (data_iA[30:0] == 31'b1111111100000000000000000000000)
					begin
						if (data_iB[30:0] == 31'b1111111100000000000000000000000)
							begin
								data_o = 32'b11111111111111111111111111111111;
							end
						else if (data_iB[30:0] == 31'b1111111111111111111111111111111)
							begin
								data_o = 32'b11111111111111111111111111111111;
							end
						else data_o = { data_o_i[31], 31'b1111111100000000000000000000000 };
					end
		else if (data_iB[30:0] == 31'd0)
				begin
					data_o = 32'b11111111111111111111111111111111;
				end
		else if (data_iB[30:0] == 31'b1111111100000000000000000000000)
				begin
					data_o = { data_o_i[31], 31'd0 };
				end
		else if (data_iB[30:0] == 31'b0111111100000000000000000000000)
				begin
					data_o = data_iA;
				end
		else if (data_iB[30:0] == 31'b1111111111111111111111111111111)
				begin
					data_o = 32'b11111111111111111111111111111111;
				end
		else if (data_iB[22:0] == 23'd0 && data_iB[30:23] != 8'b11111111)
				begin
					data_o = { data_o_i[31], ExpFinal, data_iA[22:0] };
				end
		else if (data_iA[22:0] == data_iB[22:0])
				begin
					data_o = { data_o_i[31], ExpFinal, 23'd0 };
				end
		else data_o = data_o_i;
	end
endmodule