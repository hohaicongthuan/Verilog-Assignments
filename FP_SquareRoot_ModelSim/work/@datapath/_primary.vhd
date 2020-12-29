library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        data_i          : in     vl_logic_vector(31 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0);
        control_signal  : in     vl_logic_vector(13 downto 0);
        clk             : in     vl_logic;
        flg_negative    : out    vl_logic
    );
end Datapath;
