module Controller(start, control_signal, negative, clk);
    input   start, negative, clk;
    output  [13:0] control_signal;

    wire [5:0] CurrentState, NextState;

    Controller_NextState NextState_Inst0(
        .CurrentState(CurrentState),
        .NextState(NextState),
        .start(start)
    );
    Controller_Reg REG_Inst0(
        .NextState(NextState),
        .CurrentState(CurrentState),
        .clk(clk)
    );
    Controller_Outputs Outputs_Inst0(
        .CurrentState(CurrentState),
        .data_o(control_signal)
    );
endmodule