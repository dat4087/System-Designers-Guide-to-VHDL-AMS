library ieee_proposed;
use ieee_proposed.electrical_systems.all;
use ieee_proposed.thermal_systems.all;

entity temperature_dependent_resistor is
  port ( terminal n1, n2 : electrical;
         quantity temp : in temperature );
end entity temperature_dependent_resistor;

architecture linear_approx of temperature_dependent_resistor is
  constant resistance_at_0 : real := 1.0E6;
  constant resistance_drop_per_kelvin : real := 100.0;
  quantity resistance : real;
  quantity V across I through n1 to n2;
begin
  resistance == resistance_at_0 - temp * resistance_drop_per_kelvin;
  V == I * resistance;
end architecture linear_approx;
