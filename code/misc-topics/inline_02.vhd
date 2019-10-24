entity inline_02 is

end entity inline_02;


----------------------------------------------------------------


architecture test of inline_02 is

  signal s : bit;

begin

  -- code from book:

  p : postponed process is
    -- . . .
  begin
    -- . . .
    wait until s = '1';
    -- . . .       -- s may not be '1'!!
    -- not in book
    report bit'image(s);
    wait;
    -- end not in book
  end postponed process p;

  -- end of code from book

  stimulus : process is
  begin
    wait for 10 ns;
    s <= '1';
    wait for 0 ns;
    s <= '0';
    wait;
  end process stimulus;

end architecture test;
