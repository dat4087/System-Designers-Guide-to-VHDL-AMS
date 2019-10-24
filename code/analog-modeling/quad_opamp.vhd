library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity quad_opamp is
  port ( terminal plus_in, minus_in, output : electrical_vector(1 to 4) );
end entity quad_opamp;

----------------------------------------------------------------

architecture slew_limited of quad_opamp is
  
  constant gain : real := 50.0;
  quantity v_in across plus_in to minus_in;
  quantity v_out across i_out through output;
  quantity v_amplified : real_vector(1 to 4);
        
begin

  v_amplified(1) == gain * v_in(1);
  v_amplified(2) == gain * v_in(2);
  v_amplified(3) == gain * v_in(3);
  v_amplified(4) == gain * v_in(4);
  
  real_vector(v_out) == v_amplified'slew(1.0e6,-1.0e6);
  
end architecture slew_limited;
