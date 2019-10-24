library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity battery is
  port ( terminal anode, cathode : electrical );
end entity battery;



library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity ADC is
  port ( terminal a : electrical;
         signal d : out bit );
end entity ADC;




library ieee_proposed;
use ieee_proposed.electrical_systems.all, ieee_proposed.thermal_systems.all;

entity diode_thermal is
  port ( terminal p, m : electrical;
         terminal j : thermal );
end entity diode_thermal;
