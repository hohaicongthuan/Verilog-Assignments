 // This is a testbench for FP_SquareRoot.v
 
 `timescale 1ns/1ps

module Testbench();
    parameter waittime = 3000;
    parameter clocktime = 30;
    parameter DATAWIDTH = 32;
    integer i, outfile;

    reg clk, start;
    reg [DATAWIDTH - 1:0] data_i;
    wire [DATAWIDTH - 1:0] data_o;
    
    reg [31:0] TestCases [100:0];

    initial begin
      clk = 1'b0; // Initial value of the clock signal
      forever #clocktime clk = ~clk; // Generates clock pulses forever
  end
    
    initial begin
        outfile = $fopen("TestResults.txt", "w");
        start = 1'b0;
        $readmemb("TestCases.txt", TestCases);

        for (i = 0; i < 100; i = i + 1) begin
            start = 1'b1;
            data_i = TestCases[i];
            #clocktime; #clocktime; #clocktime;
            start = 1'b0;
            #waittime;
            $fdisplay(outfile, "%b", data_o);
        end

        $fclose(outfile);
        #2000 $finish;
    end

    FP_SQRT FP_SR_Inst0(
        .data_i(data_i),
        .data_o(data_o),
        .start(start),
        .clk(clk)
    );
endmodule