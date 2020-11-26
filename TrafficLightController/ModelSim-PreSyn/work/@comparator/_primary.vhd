library verilog;
use verilog.vl_types.all;
entity Comparator is
    generic(
        DATA_WIDTH      : integer := 6
    );
    port(
        i_A             : in     vl_logic_vector;
        i_B             : in     vl_logic_vector;
        \Out\           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end Comparator;
