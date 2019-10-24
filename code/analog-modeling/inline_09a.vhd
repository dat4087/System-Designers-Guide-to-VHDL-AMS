library ieee_proposed;
use ieee_proposed.electrical_systems.all;
use ieee_proposed.mechanical_systems.all;
                        
entity inline_09a is

end entity inline_09a;


architecture test of inline_09a is


  constant R : real := 1.0e3;
  constant k : real := 10.0;

  -- code from book

  terminal p, m : electrical;
  quantity v across i through p to m;

  --

  terminal node1, node2 : translational;
  quantity d across f through node1 to node2;

  -- end code from book

begin

  -- code from book

  v == i * R;

  --

  f == d * k;

  -- end code from book

end architecture test;
