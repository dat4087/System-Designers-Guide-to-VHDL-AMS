library ieee;  use ieee.math_real.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity lowpass is
  generic ( fp : real := 10.0;	     -- pole in Hz for 'ztf
            Fsmp : real := 10.0e3);  -- sample frequency for 'ztf 
  port ( terminal input: electrical;
         terminal output: electrical );
end entity lowpass;

----------------------------------------------------------------

architecture ztf of lowpass is

  quantity vin across input to electrical_ref;
  quantity vout across iout through output to electrical_ref;
  constant Tsmp : real := 1.0 / Fsmp;	  -- sample period
  constant wp : real := fp * math_2_pi;	  -- pole in rad/s
  constant n0 : real := Tsmp * wp; 	  -- z0 numerator coefficient (a)
  constant n1 : real := Tsmp * wp; 	  -- z-1 numerator coefficient (b)
  constant d0 : real := Tsmp * wp + 2.0;  -- z0 denominator coefficient (c)
  constant d1 : real := Tsmp * wp - 2.0;  -- z-1 denominator coefficient (d)
  constant num : real_vector := (n0, n1); 
  constant den : real_vector := (d0, d1);

begin

  vout == vin'ztf(num, den, Tsmp);

end ztf;
