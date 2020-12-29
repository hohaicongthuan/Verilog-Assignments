library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        BUS_WIDTH       : integer := 32
    );
    port(
        data_iA         : in     vl_logic_vector;
        data_iB         : in     vl_logic_vector;
        data_o          : out    vl_logic_vector;
        flg_negative    : out    vl_logic;
        flg_zero        : out    vl_logic;
        ALU_Op          : in     vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BUS_WIDTH : constant is 1;
end ALU;
