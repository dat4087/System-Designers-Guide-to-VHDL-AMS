library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity resistor is
  port ( terminal p1, p2 : electrical );
end entity resistor;

architecture ideal of resistor is
  quantity v across i through p1 to p2;
  constant resistance : real := 10000.0;
begin
  v == i * resistance;
end architecture ideal;
