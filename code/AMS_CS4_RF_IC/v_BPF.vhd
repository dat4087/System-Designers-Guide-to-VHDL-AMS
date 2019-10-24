library ieee;  use ieee.math_real.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity v_BPF is

  generic ( k : real := 1.0;	   -- filter gain
            fo : real := 100.0e3;  -- center frequency [Hz]
            q : real := 0.707 );   -- quality factor

  port ( terminal input	: electrical;   
         terminal output : electrical );

end entity v_BPF;

----------------------------------------------------------------

architecture behavioral of v_BPF is

  quantity vin across input;                        
  quantity vout across iout through output;            
  constant wo : real := math_2_pi * fo;		         -- frequency in radians
  constant num : real_vector := (0.0, wo);	         -- numerator array
  constant den : real_vector := (wo * wo, wo / q, 1.0);  -- denominator array

begin

  vout == k * vin'ltf(num, den);     -- Laplace transform of output

end architecture behavioral;
