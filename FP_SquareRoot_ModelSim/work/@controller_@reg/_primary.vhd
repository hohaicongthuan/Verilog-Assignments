library verilog;
use verilog.vl_types.all;
entity Controller_Reg is
    port(
        NextState       : in     vl_logic_vector(5 downto 0);
        CurrentState    : out    vl_logic_vector(5 downto 0);
        clk             : in     vl_logic
    );
end Controller_Reg;
