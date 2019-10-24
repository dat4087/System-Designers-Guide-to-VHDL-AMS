entity tb_counter is

end entity tb_counter;


----------------------------------------------------------------


architecture test_behavior of tb_counter is

  signal clk : bit := '0';
  signal count : natural;

begin

  dut : entity work.counter(behavior)
    port map ( clk => clk, count => count );

  stimulus : process is
  begin
    for cycle_count in 1 to 100 loop
      wait for 20 ns;
      clk <= '1', '0' after 10 ns;
    end loop;

    wait;
  end process stimulus;

end architecture test_behavior;
