library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

package clock_power_pkg is

  constant Tpw : delay_length := 4 ns;

  signal clock_phase1, clock_phase2 : std_ulogic;

  terminal analog_plus_supply, analog_ground : electrical;

end package clock_power_pkg;
