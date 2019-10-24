library ieee;  use ieee.math_real.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity comp_2p2z is
  generic ( gain : real := 100.0;   -- high DC gain for good load regulation       
            fp1 : real := 7.5e3;    -- pole location to achieve crossover frequency
            fp2 : real := 531.0e3;  -- pole location to cancel effect of ESR 
            fz1 : real := 403.0;    -- zero locations to cancel L-C filter poles
            fz2 : real := 403.0 );
  port ( terminal input, output, ref : electrical );
end entity comp_2p2z;

----------------------------------------------------------------

architecture ltf of comp_2p2z is

  quantity vin across input to ref;
  quantity vout across iout through output to ref;
  constant wp1 : real := math_2_pi * fp1;  -- Pole freq (in radians)
  constant wp2 : real := math_2_pi * fp2;
  constant wz1 : real := math_2_pi * fz1;  -- Zero freq (in radians)
  constant wz2 : real := math_2_pi * fz2;
  constant num : real_vector := ( 1.0,
                                  (wz1 + wz2) / (wz1 * wz2),
                                  1.0 / (wz1 * wz2) );
  constant den : real_vector := ( 1.0e-9, 1.0,
                                  (wp1 + wp2) / (wp1 * wp2),
                                  1.0 / (wp1 * wp2) );

begin

  vout == -1.0 * gain * vin'ltf(num, den);

end architecture ltf;
