library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_05a is
end entity inline_05a;



architecture test of inline_05a is

  signal start_n, reset, time_out : std_ulogic;
  terminal interval_rc : electrical;

begin

  -- code from book (in text)

  interval_timer : entity work.timer(behavioral)
    generic map ( threshold => 2.5,
                  clamp_on_resistance => 0.01,
                  clamp_off_resistance => 10.0E+6 )
    port map ( trigger_n => start_n, reset => reset, q => time_out,
               rc_ext => interval_rc );

  -- end code from book

end architecture test;
