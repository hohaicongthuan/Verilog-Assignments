library verilog;
use verilog.vl_types.all;
entity Testbench is
    generic(
        waittime        : integer := 3000;
        clocktime       : integer := 30;
        DATAWIDTH       : integer := 32
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of waittime : constant is 1;
    attribute mti_svvh_generic_type of clocktime : constant is 1;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
end Testbench;
