library verilog;
use verilog.vl_types.all;
entity register_OE is
    generic(
        DATA_WITDH      : integer := 32
    );
    port(
        clk             : in     vl_logic;
        data_i          : in     vl_logic_vector;
        data_o          : out    vl_logic_vector;
        OE_i            : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WITDH : constant is 1;
end register_OE;
