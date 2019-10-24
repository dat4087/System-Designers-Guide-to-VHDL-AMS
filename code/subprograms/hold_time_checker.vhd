entity hold_time_checker is
end entity hold_time_checker;



architecture test of hold_time_checker is

  constant Thold_d_clk : delay_length := 3 ns;

  signal clk, d : bit := '0';

begin

  -- code from book

  hold_time_checker : process ( clk, d ) is
    variable last_clk_edge_time : time := 0 fs;
  begin
    if clk'event and clk = '1' then
      last_clk_edge_time := now;
    end if;
    if d'event then
      assert now - last_clk_edge_time >= Thold_d_clk
        report "hold time violation";
    end if;
  end process hold_time_checker;

  -- end code from book

  clk_gen : clk <= '1' after 10 ns, '0' after 20 ns when clk = '0';

  stimulus : d <= '1' after 15 ns,
                  '0' after 53 ns,
                  '1' after 72 ns;

end architecture test;
