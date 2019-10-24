entity tb_counter is

end entity tb_counter;


----------------------------------------------------------------


architecture test_behavior of tb_counter is

  signal clk, reset : bit := '0';
  signal count : natural;

begin

  dut : entity work.counter(behavior)
    port map ( clk => clk, reset => reset, count => count );

  stimulus : process is
  begin

    for cycle_count in 1 to 5 loop
      wait for 20 ns;
      clk <= '1', '0' after 10 ns;
    end loop;

    reset <= '1' after 15 ns;
    for cycle_count in 1 to 5 loop
      wait for 20 ns;
      clk <= '1', '0' after 10 ns;
    end loop;

    reset <= '0' after 15 ns;
    for cycle_count in 1 to 30 loop
      wait for 20 ns;
      clk <= '1', '0' after 10 ns;
    end loop;

    wait;
  end process stimulus;

end architecture test_behavior;
