library ieee;  use ieee.math_real.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity v_source is
  generic ( DC : voltage := 1.0;        -- output peak amplitude
            ac_mag : voltage := 1.0;    -- AC magnitude
            ac_phase : real := 0.0 );   -- AC phase [degree]
  port ( terminal pos, neg : electrical );
end entity v_source;

----------------------------------------------------------------

architecture behavior of v_source is
  
  quantity vout across iout through pos to neg;
  -- declare quantity in frequency domain for AC analysis
  quantity ac_spec : real spectrum ac_mag, math_2_pi*ac_phase/360.0;
        
begin

  if domain = quiescent_domain or domain = time_domain use
    vout == DC;
  else
    vout == ac_spec;  -- used for frequency (AC) analysis
  end use;

end architecture behavior;
