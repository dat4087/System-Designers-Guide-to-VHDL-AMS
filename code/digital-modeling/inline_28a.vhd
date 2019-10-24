entity inline_28a is

end entity inline_28a;


----------------------------------------------------------------


architecture test of inline_28a is

  quantity disp : real;
  constant min_high : real := 2.5;

begin


  process_3_h : process is
  begin

    -- code from book:

    wait until disp'above(min_high) for 2.0;

    -- end of code from book

    wait;
  end process process_3_h;


end architecture test;
