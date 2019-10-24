library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity analog_switch is
  port ( terminal n1, n2 : electrical;
         signal control : in std_ulogic );
end entity analog_switch;

----------------------------------------------------------------

architecture ideal of analog_switch is
  quantity v across i through n1 to n2;
begin
  
  if control = '1' or control = 'H' use
    v == 0.0;
  else
    i == 0.0;
  end use;
        
  break on control;
        
end architecture ideal;
