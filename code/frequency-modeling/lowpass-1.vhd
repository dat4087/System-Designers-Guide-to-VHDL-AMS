-- not in book

library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity resistor is
  generic ( res : resistance );
  port ( terminal p1, p2 : electrical );
end entity resistor;

architecture ideal of resistor is
  quantity v across i through p1 to p2;
begin
  v == i * res;
end architecture ideal;


library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity capacitor is
  generic ( cap : resistance );
  port ( terminal p1, p2 : electrical );
end entity capacitor;

architecture ideal of capacitor is
  quantity v across i through p1 to p2;
begin
  i == cap * v'dot;
end architecture ideal;

-- end not in book


library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity lowpass is
  port ( terminal input : electrical;
         terminal output : electrical );
end entity lowpass;

----------------------------------------------------------------

architecture RC of lowpass is
begin

  R : entity work.resistor(ideal)
    generic map ( res => 15.9e3 )
    port map ( p1 => input, p2 => output );

  C : entity work.capacitor(ideal)
    generic map ( cap => 1.0e-6 )
    port map ( p1 => output, p2 => electrical_ref );

end architecture RC;
