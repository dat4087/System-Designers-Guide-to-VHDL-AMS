library ieee_proposed;  use ieee_proposed.electrical_systems.all;
library ieee;  use ieee.math_real.all;
               
entity v_source is
  port ( terminal p, m : electrical );
end entity v_source;

----------------------------------------------------------------

architecture source_sine of v_source is
  constant ampl : real := 1.0;
  constant freq : real := 60.0;
  quantity v across i through p to m;
begin
  v == ampl * sin(2.0 * math_pi * freq * now);
end architecture source_sine;
