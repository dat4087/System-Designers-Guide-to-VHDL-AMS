entity inline_20d is

end entity inline_20d;


----------------------------------------------------------------


architecture test of inline_20d is
begin


  process_5_c : process is
  begin

    -- code from book:

    assert false
      report "Initialization complete" severity note;

    --

    report "Initialization complete";

    -- end of code from book

    wait;
  end process process_5_c;


end architecture test;
