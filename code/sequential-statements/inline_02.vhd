entity inline_02 is

end entity inline_02;


----------------------------------------------------------------


architecture test of inline_02 is

  signal sel : integer range 0 to 1 := 0;
  signal input_0 : integer := 0;
  signal input_1 : integer := 10;
  signal result : integer;

begin

  process_1_b : process (sel, input_0, input_1) is
  begin

    -- code from book:

    if sel = 0 then
      result <= input_0;  -- executed if sel = 0
    else
      result <= input_1;  -- executed if sel /= 0
    end if;

    -- end of code from book

  end process process_1_b;

  stimulus : process is
  begin
    sel <= 1 after 40 ns;
    input_0 <= 1 after 10 ns, 2 after 30 ns, 3 after 50 ns;
    input_1 <= 11 after 15 ns, 12 after 35 ns, 13 after 55 ns;
    wait;
  end process stimulus;

end architecture test;
