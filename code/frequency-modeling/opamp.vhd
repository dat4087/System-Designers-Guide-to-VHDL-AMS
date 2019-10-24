library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity opamp is
  port ( terminal plus_in, minus_in, output : electrical );
end entity opamp;

----------------------------------------------------------------

architecture slew_limited of opamp is

  constant gain : real := 50.0;
  quantity v_in across plus_in to minus_in;
  quantity v_out across i_out through output;
  quantity v_amplified : voltage;

begin

  v_amplified == gain * v_in;

  v_out == v_amplified'slew(1.0e6,-1.0e6);

end architecture slew_limited;
