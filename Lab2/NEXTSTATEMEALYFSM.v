module NEXTSTATEMEALYFSM(data_i, NextState_o, CurrentState_i);
	parameter	S0 = 2'b00,
					S1 = 2'b01,
					S2 = 2'b10,
					S3 = 2'b11;
	
	input [3:0] data_i;
	input [1:0] CurrentState_i;
	output [1:0] NextState_o;
	
	wire [3:0] data_i;
	wire [1:0] CurrentState_i;
	reg [1:0] NextState_o;
	
	always @ (data_i, CurrentState_i) begin
		case (data_i)
			4'd1: NextState_o = S1;
			4'd4: if (CurrentState_i == S1) NextState_o = S2; else NextState_o = S0;
			4'd6: if (CurrentState_i == S2) NextState_o = S3; else NextState_o = S0;
			4'd9: NextState_o = S0;
			default: NextState_o = S0;
		endcase
	end
endmodule