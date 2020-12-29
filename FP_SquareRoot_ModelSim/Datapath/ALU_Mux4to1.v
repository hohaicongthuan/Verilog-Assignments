module ALU_Mux4to1(data_00, data_01, data_10, data_11, data_o, sel);
    parameter DATA_WIDTH = 32;
    
    input [DATA_WIDTH - 1:0] data_00, data_01, data_10, data_11;
    input [1:0] sel;
    output reg [DATA_WIDTH - 1:0] data_o;

    always @ (data_00, data_01, data_10, data_11, sel) begin
        case (sel)
            2'b00: data_o = data_00;
            2'b01: data_o = data_01;
            2'b10: data_o = data_10;
            2'b11: data_o = data_11;
            default: data_o = data_00;
        endcase
    end
endmodule