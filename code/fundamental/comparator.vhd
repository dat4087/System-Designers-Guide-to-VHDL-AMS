library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity comparator is
  port ( terminal plus, minus : electrical;
         signal value : out bit );
end entity comparator;

architecture ideal of comparator is
  quantity diff across plus to minus;
begin
  
  comp_behavior: process is
  begin
    if diff > 0.0 then
      value <= '1' after 5 ns;
    else
      value <= '0' after 5 ns;
    end if;
    wait on diff'above(0.0);
  end process comp_behavior;
  
end architecture ideal;
