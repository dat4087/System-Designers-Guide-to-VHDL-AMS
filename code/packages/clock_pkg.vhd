library ieee;  use ieee.std_logic_1164.all;

package clock_pkg is

  constant Tpw : delay_length := 4 ns;

  signal clock_phase1, clock_phase2 : std_ulogic;

end package clock_pkg;
