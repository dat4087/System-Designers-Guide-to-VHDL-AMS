library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity comparator is
  port ( terminal a : electrical;
         signal d : out std_ulogic );
end entity comparator;

----------------------------------------------------------------

architecture ideal of comparator is
  constant ref_voltage : real := 5.0;
  quantity vin across a;
begin

  comparator_behavior : process is
  begin
    if vin > ref_voltage / 2.0 then
      d <= '1' after 5 ns;
    else
      d <= '0' after 5 ns;
    end if;
    wait on vin'above(ref_voltage / 2.0);
  end process comparator_behavior;

end architecture ideal;
