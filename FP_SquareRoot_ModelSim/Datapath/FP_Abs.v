module FP_Abs(data_i, data_o);
    parameter DATA_WIDTH = 32;

    input [DATA_WIDTH - 1:0] data_i;
    output [DATA_WIDTH - 1:0] data_o;

    assign data_o = { 1'b0, data_i[30:0] };
endmodule