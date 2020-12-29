module Datapath(data_i, data_o, control_signal, clk, flg_negative);
    input   clk;
    input   [31:0] data_i;
    input   [13:0] control_signal;
    output  flg_negative;
    output  [31:0] data_o;

    wire [31:0] ALU_Out, In_En_Out, RF_A_Out, RF_B_Out, Reg_Out_Out;

    Datapath_Mux2to1 In_En_Inst0(
        .data_o(In_En_Out),
        .data_0(ALU_Out),
        .data_1(data_i),
        .sel_i(control_signal[13])
    );
    RegisterFile RegFile_Inst0(
        .addr_rda_i(control_signal[8:6]),
        .addr_rdb_i(control_signal[5:3]),
        .data_i(In_En_Out),
        .addr_wr_i(control_signal[11:9]),
        .WE_i(control_signal[12]),
        .clk(clk),
        .RDA_o(RF_A_Out),
        .RDB_o(RF_B_Out)
    );
    ALU ALU_Inst0(
        .data_iA(RF_A_Out),
        .data_iB(RF_B_Out),
        .data_o(ALU_Out),
        .flg_negative(flg_negative),
        .flg_zero(),
        .ALU_Op(control_signal[2:1])
    );
    register_OE Reg_Output_Inst0(
        .clk(clk),
        .data_i(ALU_Out),
        .data_o(Reg_Out_Out),
        .OE_i(control_signal[0])
    );

    Datapath_OutputGen OutGen_Inst0(
        .data_i(data_i),
        .data_o(data_o),
        .data_o_i(Reg_Out_Out)
    );
endmodule