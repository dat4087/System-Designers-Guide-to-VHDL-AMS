library ieee_proposed;  use ieee_proposed.mechanical_systems.all;
                        
entity moving_mass is
  port ( terminal external_attachment : translational );
end entity moving_mass;

----------------------------------------------------------------

architecture behavioral of moving_mass is
  constant mass : real := 10.0;
  constant stiffness : real := 2.0;
  constant damping : real := 5.0;
  quantity position across driving_force through external_attachment;
  quantity velocity : real;
begin
  position == velocity'integ;
  mass * velocity'dot == driving_force - stiffness * velocity'integ - damping * velocity
    tolerance velocity'tolerance;
end architecture behavioral;
