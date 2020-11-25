module FSM_OUTPUT(CurrentState_i, HY, HG, HR, FY, FG, FR);
	parameter 	S0 = 2'b00,
					S1 = 2'b01,
					S2 = 2'b10,
					S3 = 2'b11;
					
	input [1:0] CurrentState_i;
	output reg HY, HG, HR, FY, FG, FR;
	
	always @ (CurrentState_i) begin
		case (CurrentState_i)
		S0: {HR, HY, HG, FR, FY, FG} = 6'b001100;
		S1: {HR, HY, HG, FR, FY, FG} = 6'b010100;
		S2: {HR, HY, HG, FR, FY, FG} = 6'b100001;
		S3: {HR, HY, HG, FR, FY, FG} = 6'b100010;
		default: {HR, HY, HG, FR, FY, FG} = 6'b000000;
		endcase
	end
endmodule