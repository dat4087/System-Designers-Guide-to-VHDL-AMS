entity inline_04a is

end entity inline_04a;


----------------------------------------------------------------


architecture test of inline_04a is

  type gear_type is (gear_1, gear_2, neutral);
  signal gear : gear_type := gear_1;

  signal gear_engaged : boolean := false;

begin

  process_1_d : process (gear) is

    variable max_acceleration : real := 0.0;
    variable reverse_indicator : boolean := true;

  begin

    -- code from book:

    if gear = neutral then
      max_acceleration := 0.0;
      reverse_indicator := false;
      gear_engaged <= false;
    end if;

    -- end of code from book

  end process process_1_d;

  stimulus : process is
  begin
    gear <= gear_2 after 100 ns, neutral after 200 ns;
    wait;
  end process stimulus;

end architecture test;
