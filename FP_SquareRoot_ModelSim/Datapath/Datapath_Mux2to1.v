module Datapath_Mux2to1(data_o, data_0, data_1, sel_i);
    
    parameter DATA_WITDH = 32;

    // Declare port type
    input [DATA_WITDH - 1:0] data_0, data_1;
    input sel_i;
    output [DATA_WITDH - 1:0] data_o;

    assign data_o = (sel_i == 1'b0) ? data_0 : data_1;

endmodule