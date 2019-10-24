library ieee_proposed; use ieee_proposed.electrical_systems.all;

-- code from book
                       
entity resistor is
  generic ( resistance : real );
  port ( terminal pos, neg : electrical );
end entity resistor;

architecture simple of resistor is
  quantity v across i through pos to neg;
begin
  v == i * resistance;
end architecture simple;

-- end code from book
