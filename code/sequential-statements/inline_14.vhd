entity inline_14 is

end entity inline_14;


----------------------------------------------------------------


architecture test of inline_14 is

    -- code from book:

    type controller_state is (initial, idle, active, error);

    -- end of code from book

  signal current_state : controller_state := initial;

begin


  process_4_c : process is
  begin

    -- code from book:

    for state in controller_state loop
      -- . . .
      -- not in book:
      current_state <= state;
      wait for 10 ns;
      -- end not in book
    end loop;

    -- end of code from book

    wait;
  end process process_4_c;


end architecture test;

