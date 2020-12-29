module FP_Mul(dataA_i, dataB_i, data_o);
    parameter DATA_WIDTH = 32;
    input [DATA_WIDTH - 1:0] dataA_i, dataB_i;
    output reg[DATA_WIDTH - 1:0] data_o;

    reg SignProduct_A, SignProduct_B, SignProduct_Final;
    reg [7:0] ExpA, ExpB, Exp_Final, ExpA_true, ExpB_true, Exp_true_afteradd, Exp_true_afteradd_1;
    reg [23:0] MantA, MantB;
    reg [48:0] Mant_aftermul;
    reg [22:0] Mant_Final, Mant_Final_1;

    always @ (dataA_i, dataB_i) begin

        // separate parts
			SignProduct_A = dataA_i[31];
			SignProduct_B = dataB_i[31];
			ExpA = dataA_i[30:23]; ExpB = dataB_i[30:23];
			MantA = { 1'b1, dataA_i[22:0] };
			MantB = { 1'b1, dataB_i[22:0] };

        // calculate sign bit
        SignProduct_Final = SignProduct_A ^ SignProduct_B;

        // multiply two mantissas
        Mant_aftermul = MantA * MantB;

        // sutract each exponent to get "real exponent"
        ExpA_true = ExpA - 8'd127;
        ExpB_true = ExpB - 8'd127;
        Exp_true_afteradd = ExpA_true + ExpB_true;  // add two exponents

        if (Mant_aftermul[47] == 1'b0) begin      // if mantissas not overflow
            Exp_true_afteradd_1 = Exp_true_afteradd + 8'd0;     // add 1 to the result exponent after adding them
            Exp_Final = Exp_true_afteradd_1 + 8'd127;           // convert to floating point format
            Mant_Final [22:0] = Mant_aftermul [45:23];          // result = bit 45th to 23th
            //Mant_Final_1 = Mant_Final + 23'd0;                  // add 1 to the mant final
            data_o = { SignProduct_Final, Exp_Final[7:0], Mant_Final[22:0] };
        end
        else begin
            Exp_Final = Exp_true_afteradd + 8'd127 + 8'd1;             // convert to floating point format
            Mant_Final [22:0] = Mant_aftermul [46:24];          // result = bit 46th to 24th
				// Mant_Final_1 = 23'd0;
				// Exp_true_afteradd_1 = 8'd0;
            data_o = { SignProduct_Final, Exp_Final[7:0], Mant_Final[22:0] };
        end
    end
endmodule
