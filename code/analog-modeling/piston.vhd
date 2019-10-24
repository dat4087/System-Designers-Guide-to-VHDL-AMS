library ieee_proposed;  use ieee_proposed.mechanical_systems.all;
                       
entity piston is
  port ( terminal motion : translational );
end entity piston;

--------------------------------------------------------------

architecture simple of piston is
  constant mass : real := 10.0;
  quantity resultant_displacement across applied_force through motion;
begin
  applied_force == mass * resultant_displacement'dot'dot;
end architecture simple;
