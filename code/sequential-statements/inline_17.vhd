entity inline_17 is

end entity inline_17;


----------------------------------------------------------------


architecture test of inline_17 is
begin


  process_4_f : process is
  begin

    -- code from book:

    for i in 10 to 1 loop
      -- . . .
    end loop;

    for i in 10 downto 1 loop
      -- . . .
    end loop;

    -- end of code from book

    wait;
  end process process_4_f;


end architecture test;
