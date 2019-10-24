library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity switch_dig is
  generic ( r_open : resistance := 1.0e6;
            r_closed : resistance := 1.0e-3;
            trans_time : real := 1.0e-9 );
  port ( sw_state : in std_logic;
         terminal p1, p2 : electrical );
end entity switch_dig;

----------------------------------------------------------------

architecture linear of switch_dig is
  
  signal r_sig : resistance := r_open;
  quantity v across i through p1 to p2;
  quantity r : resistance;
  
begin
  
  -- detect switch state and assign resistance value to r_sig
  DetectState: process (sw_state)
  begin
    if (sw_state'event and sw_state = '0') then
      r_sig <= r_open;
    elsif (sw_state'event and sw_state = '1') then
      r_sig <= r_closed;
    end if;
  end process DetectState;

  r == r_sig'ramp(trans_time, trans_time);
  v == r * i;

end architecture linear;
