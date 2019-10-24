library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity bit_to_analog is
  port ( d : in bit;
         terminal a : electrical ); 
end entity bit_to_analog;

----------------------------------------------------------------

architecture ideal of bit_to_analog is
  constant v_low : real := 0.0;
  constant v_high : real := 5.0;
  signal v_in : real := 0.0;
  quantity v_out across i_out through a to electrical_ref;
begin
  
  v_in <= v_high when d = '1' else v_low;
  v_out == v_in'ramp(1.0e-9);
  
end architecture ideal;
