library verilog;
use verilog.vl_types.all;
entity FP_Add is
    port(
        sum             : out    vl_logic_vector(31 downto 0);
        a_original      : in     vl_logic_vector(31 downto 0);
        b_original      : in     vl_logic_vector(31 downto 0)
    );
end FP_Add;
