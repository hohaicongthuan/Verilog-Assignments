library verilog;
use verilog.vl_types.all;
entity LOADER is
    port(
        data_o          : out    vl_logic_vector(5 downto 0);
        load_i          : in     vl_logic;
        value_i         : in     vl_logic_vector(5 downto 0);
        data_i          : in     vl_logic_vector(5 downto 0)
    );
end LOADER;
