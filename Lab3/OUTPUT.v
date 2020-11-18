module OUTPUT(	CurrentState_i, InputEn_o, WriteEn_o,
					WriteAddr_o, ReadAddr_A_o, ReadAddr_B_o, ALUOpcode_o,
					SHAMT_o, OutputEn_o);
	parameter 	S0 = 4'b0000,
					S1 = 4'b0001,
					S2 = 4'b0010,
					S3 = 4'b0011,
					S4 = 4'b0100,
					S5 = 4'b0101,
					S6 = 4'b0110,
					S7 = 4'b0111,
					S8 = 4'b1000,
					S9 = 4'b1001,
					S10 = 4'b1010,
					S11 = 4'b1011,
					S12 = 4'b1100,
					S13 = 4'b1101,
					S14 = 4'b1110;
					
	input [3:0] CurrentState_i;
	output InputEn_o, WriteEn_o, OutputEn_o;
	output [2:0] WriteAddr_o, ReadAddr_A_o, ReadAddr_B_o;
	output [1:0] ALUOpcode_o, SHAMT_o;
	
	wire [3:0] CurrentState_i;
	reg InputEn_o, WriteEn_o, OutputEn_o;
	reg [2:0] WriteAddr_o, ReadAddr_A_o, ReadAddr_B_o;
	reg [1:0] ALUOpcode_o, SHAMT_o;
	
	always @ (CurrentState_i) begin
		case (CurrentState_i)
			S0: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b0;
						WriteAddr_o = 3'b000;
						ReadAddr_A_o = 3'b000;
						ReadAddr_B_o = 3'b000;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S1: 	begin
						InputEn_o = 1'b1;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b001;
						ReadAddr_A_o = 3'b000;
						ReadAddr_B_o = 3'b000;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S2: 	begin
						InputEn_o = 1'b1;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b010;
						ReadAddr_A_o = 3'b000;
						ReadAddr_B_o = 3'b000;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S3: 	begin
						InputEn_o = 1'b1;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b011;
						ReadAddr_A_o = 3'b000;
						ReadAddr_B_o = 3'b000;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S4: 	begin
						InputEn_o = 1'b1;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b100;
						ReadAddr_A_o = 3'b000;
						ReadAddr_B_o = 3'b000;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S5: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b101;
						ReadAddr_A_o = 3'b001;
						ReadAddr_B_o = 3'b001;
						ALUOpcode_o = 2'b01;
						SHAMT_o = 2'b11;
						OutputEn_o = 1'b0;
					end
			S6: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b001;
						ReadAddr_A_o = 3'b101;
						ReadAddr_B_o = 3'b001;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S7: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b101;
						ReadAddr_A_o = 3'b010;
						ReadAddr_B_o = 3'b010;
						ALUOpcode_o = 2'b01;
						SHAMT_o = 2'b10;
						OutputEn_o = 1'b0;
					end
			S8: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b101;
						ReadAddr_A_o = 3'b101;
						ReadAddr_B_o = 3'b010;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S9: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b010;
						ReadAddr_A_o = 3'b101;
						ReadAddr_B_o = 3'b010;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S10: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b011;
						ReadAddr_A_o = 3'b011;
						ReadAddr_B_o = 3'b011;
						ALUOpcode_o = 2'b01;
						SHAMT_o = 2'b10;
						OutputEn_o = 1'b0;
					end
			S11: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b111;
						ReadAddr_A_o = 3'b100;
						ReadAddr_B_o = 3'b011;
						ALUOpcode_o = 2'b10;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S12: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b111;
						ReadAddr_A_o = 3'b111;
						ReadAddr_B_o = 3'b010;
						ALUOpcode_o = 2'b00;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S13: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b1;
						WriteAddr_o = 3'b111;
						ReadAddr_A_o = 3'b111;
						ReadAddr_B_o = 3'b001;
						ALUOpcode_o = 2'b10;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b0;
					end
			S14: 	begin
						InputEn_o = 1'b0;
						WriteEn_o = 1'b0;
						WriteAddr_o = 3'b000;
						ReadAddr_A_o = 3'b111;
						ReadAddr_B_o = 3'b111;
						ALUOpcode_o = 2'b01;
						SHAMT_o = 2'b00;
						OutputEn_o = 1'b1;
					end
			default:  	begin
								InputEn_o = 1'b0;
								WriteEn_o = 1'b0;
								WriteAddr_o = 3'b000;
								ReadAddr_A_o = 3'b000;
								ReadAddr_B_o = 3'b000;
								ALUOpcode_o = 2'b00;
								SHAMT_o = 2'b00;
								OutputEn_o = 1'b0;
							end
		endcase
	end
endmodule