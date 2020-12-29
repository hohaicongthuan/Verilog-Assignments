module register_OE(clk, data_i, data_o, OE_i);
    parameter DATA_WITDH = 32;

    // Declare port type
    input clk, OE_i;
    input [DATA_WITDH - 1:0] data_i;
    output reg [DATA_WITDH - 1:0] data_o;

    always @ (posedge clk) 
    begin   
        data_o <= (OE_i == 1'b1) ? data_i : data_o;
    end
endmodule