module OUTPUTMEALYFSM(data_o, data_i, CurrentState_i);
	parameter	S0 = 2'b00,
					S1 = 2'b01,
					S2 = 2'b10,
					S3 = 2'b11;
					
	input [1:0] CurrentState_i;
	input [3:0] data_i;
	output data_o;
	
	wire [1:0] CurrentState_i;
	wire [3:0] data_i;
	reg data_o;
	
	always @ (CurrentState_i, data_i) begin
		case (data_i)
			4'd9: if (CurrentState_i == S3) data_o = 1'b1; else data_o = 1'b0;
			default: data_o = 1'b0;
		endcase
	end
endmodule