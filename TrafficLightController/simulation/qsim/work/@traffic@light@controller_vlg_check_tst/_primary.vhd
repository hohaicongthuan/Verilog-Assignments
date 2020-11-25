library verilog;
use verilog.vl_types.all;
entity TrafficLightController_vlg_check_tst is
    port(
        FG              : in     vl_logic;
        FR              : in     vl_logic;
        FY              : in     vl_logic;
        HG              : in     vl_logic;
        HR              : in     vl_logic;
        HY              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end TrafficLightController_vlg_check_tst;
