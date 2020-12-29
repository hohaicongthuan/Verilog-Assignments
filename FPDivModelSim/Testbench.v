 `timescale 1ns/1ps

module Testbench();
    parameter waittime = 20;
    parameter DATAWIDTH = 32;
    integer i, outfile;

    reg [DATAWIDTH - 1:0] data_iA, data_iB;
    wire [DATAWIDTH - 1:0] data_o;

    reg [DATAWIDTH - 1:0] TestCases [10000];
    
    /*
    initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #10 Clk = ~Clk; // Generates clock pulses forever
    end
    */
    
    initial begin
        /*
        $readmemb("TestCases.txt", TestCases);

        for (i = 0; i < 10000; i = i + 1) begin
            
        end
        */
        data_iA = 32'b01000000110010011001100110011010;
        data_iB = 32'b01000000000001100110011001100110;

        outfile = $fopen("TestResults.txt", "w");
        #100
        $fdisplay(outfile, "%b", data_o);
        $fclose(outfile);
        #2000 $finish;
    end

    FP_Div FP_DIv_Inst(
        .data_iA(data_iA),
        .data_iB(data_iB),
        .data_o(data_o)
    );
endmodule