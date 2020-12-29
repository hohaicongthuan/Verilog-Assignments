 `timescale 1ns/1ps

module Testbench();
    parameter waittime = 20;
    parameter DATAWIDTH = 32;
    integer i, outfile;

    reg [DATAWIDTH - 1:0] data_iA, data_iB;
    wire [DATAWIDTH - 1:0] data_o;
    
    /*
    initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #10 Clk = ~Clk; // Generates clock pulses forever
    end
    */
    
    initial begin
        outfile = $fopen("TestResults.txt", "w");
        
        // 1 + 2
        data_iA = 32'b00111111100000000000000000000000;
        data_iB = 32'b01000000000000000000000000000000;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        // -1 + 2
        data_iA = 32'b10111111100000000000000000000000;
        data_iB = 32'b01000000000000000000000000000000;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        // 1 + -2
        data_iA = 32'b00111111100000000000000000000000;
        data_iB = 32'b11000000000000000000000000000000;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        // -1 + -2
        data_iA = 32'b10111111100000000000000000000000;
        data_iB = 32'b11000000000000000000000000000000;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        // 1 - 2
        data_iA = 32'b00111111100000000000000000000000;
        data_iB = 32'b01000000000000000000000000000000;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        // -1 - 2
        data_iA = 32'b10111111100000000000000000000000;
        data_iB = 32'b01000000000000000000000000000000;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        // 1 - -2
        data_iA = 32'b00111111100000000000000000000000;
        data_iB = 32'b11000000000000000000000000000000;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        // -1 - -2
        data_iA = 32'b10111111100000000000000000000000;
        data_iB = 32'b11000000000000000000000000000000;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        $fclose(outfile);
        #2000 $finish;
    end

    //always @ (Clk) #10 Clk <= ~Clk;

    FP_Add FPAdd_Inst(
        .sum(data_o),
        .a_original(data_iA),
        .b_original(data_iB)
    );
endmodule