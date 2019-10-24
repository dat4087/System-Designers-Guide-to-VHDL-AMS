entity inline_05 is

end entity inline_05;


----------------------------------------------------------------


architecture test of inline_05 is

  type phase_type is (wash, other_phase);
  signal phase : phase_type := other_phase;

  type cycle_type is (delicate_cycle, other_cycle);
  signal cycle_select : cycle_type := delicate_cycle;

  type speed_type is (slow, fast);
  signal agitator_speed : speed_type := slow;

  signal agitator_on : boolean := false;

begin

  process_1_e : process (phase, cycle_select) is
  begin

    -- code from book:

    if phase = wash then
      if cycle_select = delicate_cycle then
        agitator_speed <= slow;
      else
        agitator_speed <= fast;
      end if;
      agitator_on <= true;
    end if;

    -- end of code from book

  end process process_1_e;

  stimulus : process is
  begin
    cycle_select <= other_cycle;	wait for 100 ns;
    phase <= wash;			wait for 100 ns;
    cycle_select <= delicate_cycle;	wait for 100 ns;
    cycle_select <= other_cycle;	wait for 100 ns;
    phase <= other_phase;		wait for 100 ns;

    wait;
  end process stimulus;

end architecture test;
