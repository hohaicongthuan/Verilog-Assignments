library verilog;
use verilog.vl_types.all;
entity Datapath_Mux2to1 is
    generic(
        DATA_WITDH      : integer := 32
    );
    port(
        data_o          : out    vl_logic_vector;
        data_0          : in     vl_logic_vector;
        data_1          : in     vl_logic_vector;
        sel_i           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WITDH : constant is 1;
end Datapath_Mux2to1;
