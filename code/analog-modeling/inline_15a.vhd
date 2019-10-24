library ieee_proposed;
use ieee_proposed.electrical_systems.all;
use ieee_proposed.thermal_systems.all;
                        
entity inline_15a is

end entity inline_15a;


architecture test of inline_15a is

  -- code from book

  terminal bridge1, bridge2 : electrical;
  quantity ambient : temperature;

  -- end code from book

begin

  ambient == 300.0;

  -- code from book

  resistor1 : entity work.temperature_dependent_resistor(linear_approx)
    port map ( n1 => bridge1, n2 => bridge2, temp => ambient );

  -- end code from book

end architecture test;
