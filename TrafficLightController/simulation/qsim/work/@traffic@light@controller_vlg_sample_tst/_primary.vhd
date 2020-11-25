library verilog;
use verilog.vl_types.all;
entity TrafficLightController_vlg_sample_tst is
    port(
        LongTime_i      : in     vl_logic_vector(5 downto 0);
        ShortTime_i     : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end TrafficLightController_vlg_sample_tst;
