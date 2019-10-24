library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity std_logic_to_analog is
  port ( d : in std_logic;
         terminal a : electrical ); 
end entity std_logic_to_analog;

----------------------------------------------------------------

architecture ideal of std_logic_to_analog is
  constant v_low : real := 0.0;
  constant v_high : real := 5.0;
  constant v_unknown : real := 2.0;
  signal v_in : real := 0.0;
  quantity v_out across i_out through a to electrical_ref;
begin
  
  v_in <= v_high when d = '1' or d = 'H' else
          v_low when d = '0' or d = 'L' else
          v_unknown;
  
  v_out == v_in'slew(2.0e+9, -1.0e+9);
        
end architecture ideal;
