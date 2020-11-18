module NEXTSTATE(data_i, NextState_o, CurrentState_i);
	parameter	S0 = 3'b000,
					S1 = 3'b001,
					S2 = 3'b010,
					S3 = 3'b011,
					S4 = 3'b100;
	
	input [3:0] data_i;
	input [2:0] CurrentState_i;
	output [2:0] NextState_o;
	
	wire [3:0] data_i;
	wire [2:0] CurrentState_i;
	reg [2:0] NextState_o;
	
	always @ (data_i, CurrentState_i) begin
		case (data_i)
			4'd1: NextState_o = S1;
			4'd4: if (CurrentState_i == S1) NextState_o = S2; else NextState_o = S0;
			4'd6: if (CurrentState_i == S2) NextState_o = S3; else NextState_o = S0;
			4'd9: if (CurrentState_i == S3) NextState_o = S4; else NextState_o = S0;
			default: NextState_o = S0;
		endcase
	end
endmodule