-- not in book

use work.automotive_valve_defs.all;

entity brake_system is
end entity brake_system;

-- end not in book



architecture structure of brake_system is

  use work.automotive_valve_defs.all;

  -- ...  -- declarations of other components, terminals, etc

  -- not in book
  terminal master_reservoir, brake_line : valve_fluidic;
  terminal brake_pedal : valve_translational;
  -- end not in book

begin
  
  pedal_valve : component automotive_valve
    port map ( p1 => master_reservoir,
               p2 => brake_line,
               control => brake_pedal );
    
  -- ...  -- other component instances
      
end architecture structure;
