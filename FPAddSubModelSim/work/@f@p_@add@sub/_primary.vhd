library verilog;
use verilog.vl_types.all;
entity FP_AddSub is
    port(
        data_iA         : in     vl_logic_vector(31 downto 0);
        data_iB         : in     vl_logic_vector(31 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0);
        AddSub_Sel      : in     vl_logic
    );
end FP_AddSub;
