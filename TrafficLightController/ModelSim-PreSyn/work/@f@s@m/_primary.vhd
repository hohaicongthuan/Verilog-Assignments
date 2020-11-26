library verilog;
use verilog.vl_types.all;
entity FSM is
    port(
        TS              : in     vl_logic;
        TL              : in     vl_logic;
        clk             : in     vl_logic;
        HY              : out    vl_logic;
        HG              : out    vl_logic;
        HR              : out    vl_logic;
        FY              : out    vl_logic;
        FG              : out    vl_logic;
        FR              : out    vl_logic
    );
end FSM;
