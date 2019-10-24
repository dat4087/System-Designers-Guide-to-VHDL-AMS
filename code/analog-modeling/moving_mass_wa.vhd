library ieee_proposed;  use ieee_proposed.mechanical_systems.all;
                       
entity moving_mass_wa is
  port ( terminal external_attachment : translational );
end entity moving_mass_wa;

----------------------------------------------------------------

architecture behavioral of moving_mass_wa is
  constant mass : real := 10.0;
  constant stiffness : real := 2.0;
  constant damping : real := 5.0;
  quantity position across driving_force through external_attachment;
  quantity velocity : real;
begin
  velocity == position'dot;
  driving_force == mass*velocity'dot + damping*velocity + stiffness*position; 
end architecture behavioral;
