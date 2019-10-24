library ieee_proposed;
use ieee_proposed.electrical_systems.all;
use ieee_proposed.mechanical_systems.all;
                        
entity inline_21a is

end entity inline_21a;


architecture test of inline_21a is

  -- code from book

  quantity d : displacement;
  
  limit d : displacement with 0.001;

  --

  quantity drive_shaft_av, axle_av, wheel_av : angular_velocity;

  --

  limit drive_shaft_av, axle_av, wheel_av : angular_velocity with 0.01;

  --

  limit all : angular_velocity with 0.01;

  --

  quantity input, preamp_out, mixer_out, agc_out : voltage;
  
  limit input, preamp_out : voltage with 1.0E-9;
  limit others : voltage with 1.0E-7;

  --

  terminal bus1 : electrical_vector(1 to 8);
  terminal bus2 : electrical_vector(1 to 8);
  quantity v_bus across bus1 to bus2;
  limit v_bus : voltage_vector with 1.0E-3;

  -- end code from book

begin

end architecture test;
