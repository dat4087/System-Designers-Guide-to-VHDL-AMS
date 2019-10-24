library ieee;  use ieee.math_real.all;

entity lead_lag is
  generic ( k : real := 400.0;     -- gain multiplier
            f1 : real := 5.0;	   -- break frequency (zero)
            f2 : real := 2000.0);  -- break frequency (pole)
  port ( quantity input : in real;
         quantity output : out real);
end entity lead_lag;

----------------------------------------------------------------

architecture simple of lead_lag is

  constant num : real_vector := (f1 * math_2_pi, 1.0);
  constant den : real_vector := (f2 * math_2_pi, 1.0);

begin

  output == k * input'ltf(num, den);

end architecture simple;
