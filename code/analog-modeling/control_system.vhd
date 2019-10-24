library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity control_system is
  port ( quantity feedback, target : in voltage;
         quantity output : out voltage );
end entity control_system;

----------------------------------------------------------------

architecture simple_feedback of control_system is
  constant gain : real := 2.0;
begin
  output == gain * ( target - feedback );
end architecture simple_feedback;
