entity inline_01 is

end entity inline_01;


----------------------------------------------------------------


architecture test of inline_01 is
begin


  process is

    -- code from book:

    type natural_ptr is access natural;

    variable count : natural_ptr;

    -- end of code from book

  begin

    -- code from book:

    count := new natural;

    count.all := 10;

    if count.all = 0 then
      -- . . .
      -- not in book
      report "count.all = 0";
      -- end not in book
    end if;

    -- end of code from book

    if count.all /= 0 then
      report "count.all /= 0";
    end if;

    -- code from book:

    count := new natural'(10);

    -- end of code from book

    wait;
  end process;


end architecture test;
