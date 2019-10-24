library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity variable_comparator is
  port ( terminal a : electrical;
         terminal ref : electrical;
         signal d : out std_ulogic );
end entity variable_comparator;

----------------------------------------------------------------

architecture ideal of variable_comparator is
  quantity v_ref across ref;
  quantity vin across a;
begin
  
  comparator_behavior : process is
  begin
    if vin > v_ref then
      d <= '1' after 5 ns;
    else
      d <= '0' after 5 ns;
    end if;
    wait on vin'above(v_ref / 2.0);
  end process comparator_behavior;
  
end architecture ideal;
