library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_01a is

end entity inline_01a;


----------------------------------------------------------------


-- code from book:

library widget_parts, wasp_lib;

use widget_parts.capacitor;

-- end of code from book


architecture test of inline_01a is

  terminal node3 : electrical;

begin

  -- code from book:

  C1 : entity capacitor
    port map ( node1 => node3, node2 => ground );

  -- end of code from book

end architecture test;
