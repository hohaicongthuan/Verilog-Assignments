module Controller_Reg(NextState, CurrentState, clk);    
    input   clk;
    input   	[5:0] NextState;
    output reg	[5:0] CurrentState;

    always @ (posedge clk) begin
        CurrentState <= NextState;
    end
endmodule