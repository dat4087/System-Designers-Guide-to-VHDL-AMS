-- not in book

entity alarm_clock is
end entity alarm_clock;

-- end not in book


architecture top_level of alarm_clock is

  use work.counter_types.digit;

  signal reset_to_midnight, seconds_clk : bit;
  signal seconds_units, seconds_tens : digit;
  -- . . .

begin

  seconds : configuration work.counter_down_to_gate_level
    port map ( clk => seconds_clk, clr => reset_to_midnight,
               q0 => seconds_units, q1 => seconds_tens );

  -- . . .

  -- not in book

  clk_gen : seconds_clk <= not seconds_clk after 20 ns;

  clr_gen : reset_to_midnight <= '1' after 95 ns,
		                 '0' after 135 ns;

  -- end not in book;

end architecture top_level;
