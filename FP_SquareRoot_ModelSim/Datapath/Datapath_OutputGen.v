// This module is a part of the datapath of the floating-point square root
// This module checks the input of the floating-point square root and return
// NaN when the input is a negative number
module Datapath_OutputGen(data_i, data_o, data_o_i);
    input [31:0] data_i, data_o_i;
    output reg [31:0] data_o;

    always @ (data_i, data_o_i) begin
        if (data_i[31]) data_o = 32'b11111111111111111111111111111111;
        else data_o = data_o_i;
    end
endmodule