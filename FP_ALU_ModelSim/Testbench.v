 `timescale 1ns/1ps

module Testbench();
    parameter waittime = 20;
    parameter DATAWIDTH = 32;
    integer i, outfile;

    reg [1:0] ALU_Op;
    reg [DATAWIDTH - 1:0] data_iA, data_iB;
    wire [DATAWIDTH - 1:0] data_o;
    wire flg_negative, flg_zero;
    
    /*
    initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #10 Clk = ~Clk; // Generates clock pulses forever
    end
    */
    
    initial begin
        outfile = $fopen("TestResults.txt", "w");
        
        data_iA = 32'b10111111101000000000000000000000;
        data_iB = 32'b00111111101000000000000000000000;
        
        ALU_Op  = 2'b00;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        ALU_Op  = 2'b01;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        ALU_Op  = 2'b10;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        ALU_Op  = 2'b11;
        #waittime;
        $fdisplay(outfile, "%b", data_o);

        $fclose(outfile);
        #2000 $finish;
    end

    //always @ (Clk) #10 Clk <= ~Clk;

    ALU ALU_Inst(
        .data_iA(data_iA),
        .data_iB(data_iB),
        .data_o(data_o),
        .flg_negative(flg_negative),
        .flg_zero(flg_zero),
        .ALU_Op(ALU_Op)
    );
endmodule