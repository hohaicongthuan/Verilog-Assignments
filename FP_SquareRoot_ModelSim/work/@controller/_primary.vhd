library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        start           : in     vl_logic;
        control_signal  : out    vl_logic_vector(13 downto 0);
        negative        : in     vl_logic;
        clk             : in     vl_logic
    );
end Controller;
