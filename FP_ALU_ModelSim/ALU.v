module ALU(data_iA, data_iB, data_o, flg_negative, flg_zero, ALU_Op);
    parameter   BUS_WIDTH = 32;
    
    input       [BUS_WIDTH - 1: 0] data_iA, data_iB;
    input       [1:0] ALU_Op;
    output      [BUS_WIDTH - 1: 0] data_o;
    output      flg_negative, flg_zero;

    wire [BUS_WIDTH - 1:0] Add_Out, Sub_Out, Div_Out, Abs_Out;

    FP_Add FP_Adder(
        .sum(Add_Out),
        .a_original(data_iA),
        .b_original(data_iB)
    );
    FP_Add FP_Subtractor(
        .sum(Sub_Out),
        .a_original(data_iA),
        .b_original({ ~data_iB[31], data_iB[30:0] })
    );
    FP_Div FP_Divider(
        .data_iA(data_iA),
        .data_iB(data_iB),
        .data_o(Div_Out)
    );
    FP_Abs FP_Absolute(
        .data_i(data_iA),
        .data_o(Abs_Out)
    );

    ALU_Mux4to1 Selector_Inst(
        .data_00(Add_Out),
        .data_01(Sub_Out),
        .data_10(Div_Out),
        .data_11(Abs_Out),
        .data_o(data_o),
        .sel(ALU_Op)
    );

    assign flg_negative = data_o[31] ? 1'b1 : 1'b0;
    assign flg_zero     = (data_o[30:0] == 31'd0) ? 1'b1 : 1'b0;
    
endmodule