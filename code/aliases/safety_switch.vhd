library ieee_proposed;
use ieee_proposed.electrical_systems.all, ieee_proposed.mechanical_systems.all;

entity safety_switch is
  port ( terminal neutral : electrical;
         terminal relay_actuator : translational );
end entity safety_switch;

-- code from book

library ieee_proposed;
use ieee_proposed.electrical_systems.all, ieee_proposed.mechanical_systems.all;

architecture basic of safety_switch is
  
  quantity neutral_potential across neutral to ground;
  quantity relay_position across relay_actuator to anchor;
  -- ...
  
begin
  -- ...
end architecture basic;

-- end code from book
