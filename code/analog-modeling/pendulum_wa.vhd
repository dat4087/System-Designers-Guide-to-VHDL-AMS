-- Pendulum example. Look at velocity quantity, phi_dot, to see effects of 
-- discontinuity. Run simulation for about 20 sec.

library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;

library ieee; use ieee.math_real.all;

entity pendulum_wa is
end entity pendulum_wa;

-- ======================================================================================
-- constrained architecture
-- ======================================================================================
architecture constrained of pendulum_wa is
	constant mass : real := 10.0;
	constant arm_length : real := 5.0;
	constant pin_angle : real := 0.25*math_pi;
	constant pin_distance : real := 2.5;
	constant damping : real := 1.0;
	constant gravity : real := 9.81;
	constant short_length : real := arm_length-pin_distance;
	quantity phi : real := -0.5*math_pi;
	signal current_length : real := arm_length;
	quantity acceleration, velocity : real;
	quantity phi_dot : real;
	signal pin_thresh : boolean;
	signal phi_dot_at_pin_thresh : real := 0.0;
	signal transition : boolean := false;

begin
    if domain = quiescent_domain use
	    phi == -0.5*math_pi;
		phi'dot == 0.0;
	elsif transition and pin_thresh use
		phi == pin_angle;
		phi'dot == phi_dot_at_pin_thresh*arm_length/short_length;
	elsif transition and not pin_thresh use
		phi == pin_angle;
		phi'dot == phi_dot_at_pin_thresh*short_length/arm_length;
	else
		mass*acceleration == -mass*gravity*sin(phi)-damping*velocity;
		velocity == current_length*phi'dot;
	end use;

	acceleration == velocity'dot;
	phi_dot == phi'dot;

	pin_thresh <= phi'above(pin_angle);

	process
		begin
		wait on pin_thresh;
		phi_dot_at_pin_thresh <= phi_dot;
		if pin_thresh = true then
			current_length <= short_length;
			transition <= true;
		else
			current_length <= arm_length;
			transition <= true;
		end if;
		wait for 1 us;
		transition <= false;
	end process;
	break on pin_thresh;
	break on transition;
	
end architecture constrained;



