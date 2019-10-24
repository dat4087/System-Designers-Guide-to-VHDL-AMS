entity tb_two_port_reg.vhd is
end entity tb_two_port_reg.vhd;

----------------------------------------------------------------

architecture test of tb_two_port_reg.vhd is

    constant width : natural := 8;

    signal read_clk : bit;
    signal read_data : bit_vector(0 to width-1);
    signal write_clk : bit;
    signal write_data : bit_vector(0 to width-1);

begin

    stimulus : process is
    begin
        wait for 10 ns;
        write_data <= X"11";
        write_clk <= '1', '0' after 5 ns;
        wait for 10 ns;
        read_clk <= '1', '0' after 5 ns;
        wait for 10 ns;
        write_data <= X"22";
        write_clk <= '1', '0' after 5 ns;
        read_clk <= '1', '0' after 5 ns;
        -- read_data could be X"11" or X"22"
        wait;
    end process stimulus;

end architecture test;
