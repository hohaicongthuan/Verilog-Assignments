library verilog;
use verilog.vl_types.all;
entity COUNTER is
    port(
        count_o         : out    vl_logic_vector(5 downto 0);
        load_i          : in     vl_logic;
        value_i         : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic
    );
end COUNTER;
