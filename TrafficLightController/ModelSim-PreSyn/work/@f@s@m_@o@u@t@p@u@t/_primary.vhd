library verilog;
use verilog.vl_types.all;
entity FSM_OUTPUT is
    generic(
        S0              : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        S1              : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        S2              : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        S3              : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        CurrentState_i  : in     vl_logic_vector(1 downto 0);
        HY              : out    vl_logic;
        HG              : out    vl_logic;
        HR              : out    vl_logic;
        FY              : out    vl_logic;
        FG              : out    vl_logic;
        FR              : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S0 : constant is 1;
    attribute mti_svvh_generic_type of S1 : constant is 1;
    attribute mti_svvh_generic_type of S2 : constant is 1;
    attribute mti_svvh_generic_type of S3 : constant is 1;
end FSM_OUTPUT;
