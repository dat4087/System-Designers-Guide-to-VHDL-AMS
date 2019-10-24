library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity transmission_line_wa is
  port ( quantity vin : in voltage; 
         quantity vout : out voltage); 
end entity transmission_line_wa;

----------------------------------------------------------------

architecture abstract of transmission_line_wa is
  constant propagation_time : real := 2.5E-9;
  constant attenuation : real := 0.8;
  quantity vin_temp : real;
begin 
  vin_temp == vin;
  vout == attenuation * vin_temp'delayed(propagation_time);
end architecture abstract;
