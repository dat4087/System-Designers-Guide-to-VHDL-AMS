library ieee;  use ieee.std_logic_1164.all;

entity and2 is
  port ( a, b : in std_ulogic;  y : out std_ulogic );
end entity and2;

--------------------------------------------------

architecture detailed_delay of and2 is

  signal result : std_ulogic;

begin

  gate : process (a, b) is
  begin
    result <= a and b;
  end process gate;

  delay : process (result) is
  begin
    if result = '1' then
      y <= reject 400 ps inertial '1' after 1.5 ns;
    elsif result = '0' then
      y <= reject 300 ps inertial '0' after 1.2 ns;
    else
      y <= reject 300 ps inertial 'X' after 500 ps;
    end if;
  end process delay;

end architecture detailed_delay;
