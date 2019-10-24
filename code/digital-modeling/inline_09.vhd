entity inline_09 is

end entity inline_09;


----------------------------------------------------------------


architecture test of inline_09 is

  signal clk, reset, trigger, test0, test1 : bit := '0';

begin


  process_3_h : process is
  begin

    -- code from book:

    wait until clk = '1';

    -- end of code from book

    report "clk rising edge detected";

  end process process_3_h;


  ----------------


  process_3_i : process is
  begin

    -- code from book:

    wait on clk until reset = '0';

    -- end of code from book

    report "synchronous reset detected";

  end process process_3_i;


  ----------------


  process_3_j : process is
  begin

    -- code from book:

    wait until trigger = '1' for 1 ms;

    -- end of code from book

    if trigger'event and trigger = '1' then
      report "trigger rising edge detected";
    else
      report "trigger timeout";
    end if;

  end process process_3_j;


  ----------------


  -- code from book:

  test_gen : process is
  begin
    test0 <= '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns;
    test1 <= '0' after 10 ns, '1' after 30 ns;
    wait;
  end process test_gen;

  -- end of code from book


  ----------------


  stimulus_3_h_i_j : process is
  begin
    clk <= '1' after 10 ns, '0' after 20 ns,
           '1' after 30 ns, '0' after 40 ns,
           '1' after 50 ns, '0' after 60 ns,
           '1' after 70 ns, '0' after 80 ns;
    reset <= '1' after 45 ns, '0' after 75 ns;
    trigger <= '1' after 10 ns, '0' after 20 ns,
               '1' after 30 ns, '0' after 40 ns;
           
    wait;
  end process stimulus_3_h_i_j;


end architecture test;
