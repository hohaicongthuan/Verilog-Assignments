module OUTPUT(data_o, CurrentState_i);
	parameter	S0 = 3'b000,
					S1 = 3'b001,
					S2 = 3'b010,
					S3 = 3'b011,
					S4 = 3'b100;
					
	input [2:0] CurrentState_i;
	output data_o;
	
	wire [2:0] CurrentState_i;
	reg data_o;
	
	always @ (CurrentState_i) begin
		case (CurrentState_i)
			S4: data_o = 1'b1;
			default: data_o = 1'b0;
		endcase
	end
endmodule