module NEXTSTATE(NextState_o, CurrentState_i);
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
	output [3:0] NextState_o;
	
	wire [3:0] CurrentState_i;
	reg [3:0] NextState_o;
	
	always @ (CurrentState_i) begin
		case (CurrentState_i)
			S0: NextState_o = S1;
			S1: NextState_o = S2;
			S2: NextState_o = S3;
			S3: NextState_o = S4;
			S4: NextState_o = S5;
			S5: NextState_o = S6;
			S6: NextState_o = S7;
			S7: NextState_o = S8;
			S8: NextState_o = S9;
			S9: NextState_o = S10;
			S10: NextState_o = S11;
			S11: NextState_o = S12;
			S12: NextState_o = S13;
			S13: NextState_o = S14;
			S14: NextState_o = S0;
			default: NextState_o = S0;
		endcase
	end
endmodule