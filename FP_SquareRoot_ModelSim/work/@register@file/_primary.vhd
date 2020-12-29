library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        addr_rda_i      : in     vl_logic_vector(2 downto 0);
        addr_rdb_i      : in     vl_logic_vector(2 downto 0);
        data_i          : in     vl_logic_vector(31 downto 0);
        addr_wr_i       : in     vl_logic_vector(2 downto 0);
        WE_i            : in     vl_logic;
        clk             : in     vl_logic;
        RDA_o           : out    vl_logic_vector(31 downto 0);
        RDB_o           : out    vl_logic_vector(31 downto 0)
    );
end RegisterFile;
