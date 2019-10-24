entity inline_10a is

end entity inline_10a;


----------------------------------------------------------------


architecture test of inline_10a is

  -- code from book:

  type stick_position is (down, center, up);

  -- end of code from book

  signal throttle : stick_position;

begin


  process_3_a : process (throttle) is

    variable speed : integer := 0;
    constant decrement : integer := 1;
    constant increment : integer := 1;

  begin

    -- code from book:

    case throttle is
      when down =>
        speed := speed - decrement;
      when up =>
        speed := speed + increment;
      when center =>
        null; -- no change to speed
    end case;

    -- end of code from book

  end process process_3_a;


  stimulus : process is
  begin
    throttle <= down after 10 ns, center after 20 ns, up after 30 ns;
    wait;
  end process stimulus;


end architecture test;
