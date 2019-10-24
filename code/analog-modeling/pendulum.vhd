library ieee;  use ieee.math_real.all;
               
entity pendulum is
end entity pendulum;

----------------------------------------------------------------

architecture constrained of pendulum is
  
  constant mass : real := 10.0;
  constant arm_length : real := 5.0;
  constant pin_angle : real := 0.25 * math_pi;
  constant pin_distance : real := 2.5;
  constant damping : real := 1.0;
  constant gravity : real := 9.81;
  constant short_length : real := arm_length - pin_distance;
  quantity phi : real := -0.5*math_pi;
  quantity current_length : real := arm_length;
        
begin
  
  if phi'above(pin_angle) use
    current_length == short_length;
  else
    current_length == arm_length;
  end use;
        
  break phi'dot => phi'dot * arm_length/short_length
    when phi'above(pin_angle);
        
  break phi'dot => phi'dot * short_length/arm_length
    when not phi'above(pin_angle);
        
  mass * current_length * phi'dot'dot
    == - mass * gravity * sin(phi) - damping * current_length * phi'dot;
        
end architecture constrained;
