library ieee;  use ieee.std_logic_1164.all;

entity tb_identical_cells is
end entity tb_identical_cells;


architecture test of tb_identical_cells is

  signal clk, en : std_logic;
  signal d_in, d_out : std_logic_vector(0 to 3);

begin

  dut : configuration work.identical_cells
    generic map ( width => d_in'length )
    port map ( clock => clk, out_enable => en,
               data_in => d_in, data_out => d_out );

  stimulus : process is
  begin
    wait for 10 ns;
    d_in <= "0000";  en <= '0';  clk <= '0';  wait for 10 ns;
    clk <= '1', '0' after 5 ns;  wait for 10 ns;
    en <= '1', '0' after 5 ns;   wait for 10 ns;
    d_in <= "0101";              wait for 10 ns;
    clk <= '1', '0' after 5 ns;  wait for 10 ns;
    en <= 'H', '0' after 5 ns;   wait for 10 ns;

    wait;
  end process stimulus;

end architecture test;
