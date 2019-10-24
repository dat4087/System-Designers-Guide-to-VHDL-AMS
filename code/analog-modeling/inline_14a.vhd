library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_14a is

end entity inline_14a;


architecture test of inline_14a is

  terminal p : electrical;
  quantity v across i through p;
  constant R : resistance := 10_000.0;

  type modeling_mode_type is (ideal, non_ideal);
  constant modeling_mode : modeling_mode_type := ideal;

begin

  -- code from book

  if modeling_mode = ideal use
    v == i * R;
  else
    null; -- still need to include resistor with thermal effects!
  end use;

  -- end code from book

end architecture test;
