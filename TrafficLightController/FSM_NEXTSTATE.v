module FSM_NEXTSTATE(CurrentState_i, TS, TL, NextState_o);
	parameter	S0 = 2'b00,
					S1 = 2'b01,
					S2 = 2'b10,
					S3 = 2'b11;
	input [1:0] CurrentState_i;
	input TS, TL;
	output reg [1:0] NextState_o;
	
	always @ (CurrentState_i, TS, TL) begin
		case (CurrentState_i)
			S0: if (TL) NextState_o = S1; else NextState_o = S0;
			S1: if (TS) NextState_o = S2; else NextState_o = S1;
			S2: if (TL) NextState_o = S3; else NextState_o = S2;
			S3: if (TS) NextState_o = S0; else NextState_o = S3;
		default: NextState_o = S0;
		endcase
	end
endmodule