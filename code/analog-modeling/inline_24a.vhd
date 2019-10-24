library ieee_proposed;
use ieee_proposed.electrical_systems.all;
use ieee_proposed.mechanical_systems.all;
                        
entity inline_24a is

end entity inline_24a;


architecture test of inline_24a is

  -- code from book

  terminal plus, minus : electrical;
  quantity v across i through plus to minus;
  
  terminal shaft : rotational_v;
  quantity applied_torque through shaft;

  -- end code from book

begin

  -- code from book

  applied_torque == v * i;

  -- end code from book

end architecture test;
