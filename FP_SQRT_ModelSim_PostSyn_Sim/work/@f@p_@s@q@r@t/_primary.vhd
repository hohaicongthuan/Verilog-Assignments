library verilog;
use verilog.vl_types.all;
entity FP_SQRT is
    port(
        start           : in     vl_logic;
        data_i          : in     vl_logic_vector(31 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic
    );
end FP_SQRT;
