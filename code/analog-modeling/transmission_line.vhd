library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity transmission_line is
  port ( quantity vin : in voltage; 
         quantity vout : out voltage); 
end entity transmission_line;

----------------------------------------------------------------

architecture abstract of transmission_line is
  constant propagation_time : real := 2.5E-9;
  constant attenuation : real := 0.8;
begin 
  vout == attenuation * vin'delayed(propagation_time);
end architecture abstract;
