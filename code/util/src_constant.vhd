-- Voltage Pulse Source (Includes Frequency Domain settings)

library ieee;  use ieee.math_real.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity src_constant is
  
  generic ( level : real := 1.0;       -- Constant output value (V)
            ac_mag : real := 1.0;      -- AC magnitude 
            ac_phase : real := 0.0 );  -- AC phase (degrees)

  port ( quantity output : out real );

end entity src_constant;


architecture ideal of src_constant is

  -- Declare quantity in frequency domain for AC analysis 
  quantity ac_spec : real spectrum ac_mag, math_2_pi * ac_phase / 360.0;

begin

  if domain = quiescent_domain or domain = time_domain use
    output == level;
  else	
    output == ac_spec;  -- used for frequency (AC) analysis
  end use;

end architecture ideal;
