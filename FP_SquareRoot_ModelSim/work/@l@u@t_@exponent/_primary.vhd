library verilog;
use verilog.vl_types.all;
entity LUT_Exponent is
    port(
        data_i          : in     vl_logic_vector(7 downto 0);
        data_o          : out    vl_logic_vector(7 downto 0)
    );
end LUT_Exponent;
