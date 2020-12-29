library verilog;
use verilog.vl_types.all;
entity FP_Abs is
    generic(
        DATA_WIDTH      : integer := 32
    );
    port(
        data_i          : in     vl_logic_vector;
        data_o          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end FP_Abs;
