library verilog;
use verilog.vl_types.all;
entity FSM_REG is
    port(
        d               : in     vl_logic_vector(1 downto 0);
        q               : out    vl_logic_vector(1 downto 0);
        clk             : in     vl_logic
    );
end FSM_REG;
