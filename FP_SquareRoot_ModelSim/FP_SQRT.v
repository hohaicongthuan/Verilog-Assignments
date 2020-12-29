module FP_SQRT(start, data_i, data_o, clk);
    input   start, clk;
    input   [31:0] data_i;
    output  [31:0] data_o;

    wire [13:0] control_signal;

    Controller Controller_Inst0(
        .start(start),
        .control_signal(control_signal),
        .clk(clk)
    );
    Datapath Datapath_Inst0(
        .data_i(data_i),
        .data_o(data_o),
        .control_signal(control_signal),
        .clk(~clk),
        .flg_negative()
    );
endmodule