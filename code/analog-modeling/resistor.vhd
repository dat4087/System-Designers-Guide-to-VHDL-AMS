library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity resistor is 
  port ( terminal node1, node2 : electrical );
end entity resistor;

architecture ideal of resistor is
  constant R : real := 1000.0;
  quantity v across i through node1 to node2;
begin
  v == i * R; 
end architecture ideal;
