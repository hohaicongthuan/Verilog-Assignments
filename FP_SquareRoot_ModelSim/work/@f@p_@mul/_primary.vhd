library verilog;
use verilog.vl_types.all;
entity FP_Mul is
    generic(
        BUS_WIDTH       : integer := 32
    );
    port(
        data_iA         : in     vl_logic_vector;
        data_iB         : in     vl_logic_vector;
        data_o          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BUS_WIDTH : constant is 1;
end FP_Mul;