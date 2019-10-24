library ieee;  use ieee.std_logic_1164.all;
library IEEE_proposed;  use IEEE_proposed.electrical_systems.all;
                        
entity comparator is
  port ( terminal plus_in, minus_in : electrical;
         signal output : out std_ulogic );
end entity comparator;

----------------------------------------------------------------

architecture hysteresis of comparator is
  
  constant threshold_margin : real := 0.2;
  quantity v_in across plus_in to minus_in;
        
begin
  
  comp_behavior : process is
    variable threshold : real := threshold_margin;
  begin
    if v_in > threshold then
      output <= '1' after 10 ns;
      threshold := -threshold_margin;
    else
      output <= '0' after 10 ns;
      threshold := threshold_margin;
    end if;
    wait on v_in'above(threshold);
  end process comp_behavior;
                                
end architecture hysteresis;
