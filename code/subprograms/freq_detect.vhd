library ieee;  use ieee.math_real.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity freq_detect is
  port ( terminal input : electrical;
         terminal freq_out : electrical );
end entity freq_detect;

----------------------------------------------------------------

architecture threshold_crossing of freq_detect is
  
  quantity v_in across input to electrical_ref;
  quantity v_out across i_out through freq_out to electrical_ref;
  signal freq : real := 0.0;
  constant threshold : real := 0.0;
  constant scale_factor : real := 1.0e-6;
        
begin
  
  detect: process ( v_in'above(threshold) ) is
    variable t_previous : real := real'low;
  begin
    if v_in > threshold then
      freq <= scale_factor / ( now - t_previous );
      t_previous := now;
    end if;
  end process detect;
                
  v_out == freq'ramp(1.0e-9, 1.0e-9);
                
end threshold_crossing;
