library verilog;
use verilog.vl_types.all;
entity Datapath_OutputGen is
    port(
        data_i          : in     vl_logic_vector(31 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0);
        data_o_i        : in     vl_logic_vector(31 downto 0)
    );
end Datapath_OutputGen;
