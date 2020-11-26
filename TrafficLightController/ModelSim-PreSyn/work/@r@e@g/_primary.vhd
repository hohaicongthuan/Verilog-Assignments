library verilog;
use verilog.vl_types.all;
entity REG is
    port(
        d               : in     vl_logic_vector(5 downto 0);
        q               : out    vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end REG;
