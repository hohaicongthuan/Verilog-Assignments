library verilog;
use verilog.vl_types.all;
entity ALU_Mux4to1 is
    generic(
        DATA_WIDTH      : integer := 32
    );
    port(
        data_00         : in     vl_logic_vector;
        data_01         : in     vl_logic_vector;
        data_10         : in     vl_logic_vector;
        data_11         : in     vl_logic_vector;
        data_o          : out    vl_logic_vector;
        sel             : in     vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end ALU_Mux4to1;
