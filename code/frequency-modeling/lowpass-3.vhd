library ieee_proposed;  use ieee_proposed.electrical_systems.all;
library ieee;  use ieee.math_real.all;

entity lowpass is
  port ( terminal input : electrical;
         terminal output : electrical );
end entity lowpass;

----------------------------------------------------------------

architecture ltf of lowpass is

  quantity vin across input to electrical_ref;
  quantity vout across iout through output to electrical_ref;
  constant wp : real := 10.0 * math_2_pi;   -- pole in rad/s
  constant num : real_vector := (0 => wp);  -- numerator in s
  constant den : real_vector := (wp, 1.0);  -- denominator in s
  
begin

  vout == vin'ltf(num, den);

end architecture ltf;
