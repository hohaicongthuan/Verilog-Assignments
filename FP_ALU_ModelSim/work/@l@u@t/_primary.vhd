library verilog;
use verilog.vl_types.all;
entity LUT is
    port(
        data_i          : in     vl_logic_vector(11 downto 0);
        data_o          : out    vl_logic_vector(22 downto 0)
    );
end LUT;
