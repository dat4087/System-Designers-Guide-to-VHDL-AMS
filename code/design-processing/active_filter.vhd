-- not in book

library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity resistor is
  port ( terminal node1, node2 : electrical );
end entity resistor;


library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity capacitor is
  port ( terminal node1, node2 : electrical );
end entity capacitor;


library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity LF353_opamp is
  port ( terminal plus, minus, output, pos_supply, neg_supply : electrical );
end entity LF353_opamp;


library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity active_filter is
end entity active_filter;

-- end not in book



library widget_parts, wasp_lib;

architecture component_based of active_filter is
  
  -- declaration of signals, terminals, quantities, etc
  -- ...
  
  -- not in book

  terminal input, node2, node3, node4, node7, node15, Vdd, Vss : electrical;

  -- end not in book

begin
  
  R1 : entity wasp_lib.resistor
    port map ( node1 => input, node2 => node2 );

  C1 : entity widget_parts.capacitor
    port map ( node1 => node3, node2 => ground );

  Amp1 : entity work.LF353_opamp
    port map ( plus => node4, minus => node7, output => node15,
               pos_supply => Vdd, neg_supply => Vss );

  -- other component instantiations
  -- ...
  
end architecture component_based;
