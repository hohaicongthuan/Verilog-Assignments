library verilog;
use verilog.vl_types.all;
entity TrafficLightController is
    port(
        clk             : in     vl_logic;
        ShortTime_i     : in     vl_logic_vector(5 downto 0);
        LongTime_i      : in     vl_logic_vector(5 downto 0);
        HR              : out    vl_logic;
        HY              : out    vl_logic;
        HG              : out    vl_logic;
        FR              : out    vl_logic;
        FY              : out    vl_logic;
        FG              : out    vl_logic
    );
end TrafficLightController;
