entity tb_and_multiple is

end entity tb_and_multiple;


----------------------------------------------------------------


architecture test_behavioral of tb_and_multiple is

  -- code from book:

  signal count_value : bit_vector(7 downto 0);
  signal terminal_count : bit;

  -- end of code from book

begin

  -- code from book:

  tc_gate : entity work.and_multiple(behavioral)
    port map ( i => count_value, y => terminal_count);

  -- end of code from book

  stumulus : process is
  begin
    			wait for 10 ns;
    count_value <= "10000000";	wait for 10 ns;
    count_value <= "11111110";	wait for 10 ns;
    count_value <= "01111111";	wait for 10 ns;
    count_value <= "11111111";	wait for 10 ns;
    count_value <= "00000000";	wait for 10 ns;

    wait;
  end process stumulus;

end architecture test_behavioral;
