module Controller_NextState(CurrentState, NextState, negative, start);
    parameter   S0  = 6'd0,     S1  = 6'd1,      S2 = 6'd2,
                S3  = 6'd3,     S4  = 6'd4,      S5 = 6'd5,
                S6  = 6'd6,     S7  = 6'd7,      S8 = 6'd8,
                S9  = 6'd9,     S10 = 6'd10,    S11 = 6'd11,
                S12 = 6'd12,    S13 = 6'd13,    S14 = 6'd14,
                S15 = 6'd15,    S16 = 6'd16,    S17 = 6'd17,
                S18 = 6'd18,    S19 = 6'd19,    S20 = 6'd20,
                S21 = 6'd21,    S22 = 6'd22,    S23 = 6'd23,
                S24 = 6'd24,    S25 = 6'd25,    S26 = 6'd26,
                S27 = 6'd27,    S28 = 6'd28,    S29 = 6'd29,
                S30 = 6'd30,    S31 = 6'd31,    S32 = 6'd32,
                S33 = 6'd33,    S34 = 6'd34,    S35 = 6'd35,
                S36 = 6'd36,    S37 = 6'd37,    S38 = 6'd38,
                S39 = 6'd39,    S40 = 6'd40,    S41 = 6'd41,
                S42 = 6'd42,    S43 = 6'd43,    S44 = 6'd44,
                S45 = 6'd45,    S46 = 6'd46,    S47 = 6'd47,
                S48 = 6'd48,    S49 = 6'd49,    S50 = 6'd50;
    
    input   	start, negative;
    input   	[5:0] CurrentState;
    output reg  [5:0] NextState;

    always @ (CurrentState, start) begin
        case (CurrentState)
            S0: if (start) NextState = S1; else NextState = S0;
            S1: NextState = S2;
            S2: NextState = S3;
            S3: NextState = S4;
            S4: NextState = S5;
            S5: NextState = S6;
            S6: NextState = S7;
            S7: NextState = S8;
            S8: NextState = S9;
            S9: NextState = S10;
            S10: NextState = S11;
            S11: NextState = S12;
            S12: NextState = S13;
            S13: NextState = S14;
            S14: NextState = S15;
            S15: NextState = S16;
            S16: NextState = S17;
            S17: NextState = S18;
            S18: NextState = S19;
            S19: NextState = S20;
            S20: NextState = S21;
            S21: NextState = S22;
            S22: NextState = S23;
            S23: NextState = S24;
            S24: NextState = S25;
            S25: NextState = S26;
            S26: NextState = S27;
            S27: NextState = S28;
            S28: NextState = S29;
            S29: NextState = S30;
            S30: NextState = S31;
            S31: NextState = S32;
            S32: NextState = S33;
            S33: NextState = S34;
            S34: NextState = S35;
            S35: NextState = S36;
            S36: NextState = S37;
            S37: NextState = S38;
            S38: NextState = S39;
            S39: NextState = S40;
            S40: NextState = S41;
            S41: NextState = S42;
            S42: NextState = S43;
            S43: NextState = S44;
            S44: NextState = S45;
            S45: NextState = S46;
            S46: NextState = S47;
            S47: NextState = S48;
            S48: NextState = S49;
            S49: NextState = S50;
            S50: NextState = S0;
            default: NextState = S0;
        endcase
    end
endmodule