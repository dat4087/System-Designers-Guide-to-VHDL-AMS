library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity timer is
  generic ( threshold : real;
            clamp_on_resistance, clamp_off_resistance : real );
  port ( signal trigger_n, reset : in std_ulogic;  signal q : out std_ulogic;
         terminal rc_ext : electrical );
end entity timer;

----------------------------------------------------------------

architecture behavioral of timer is
  
  quantity v_rc_ext across i_clamp through rc_ext to electrical_ref;
  signal q_n : std_ulogic := '1';
        
begin
  
  if q_n = '1' use
    i_clamp == v_rc_ext / clamp_on_resistance;
  else
    i_clamp == v_rc_ext / clamp_off_resistance;
  end use;
        
  timer_state : process ( trigger_n, reset, v_rc_ext'above(threshold) ) is
  begin
    if reset = '1' or reset = 'H' or v_rc_ext > threshold then
      q <= '0';  q_n <= '1';
    elsif trigger_n = '0' or trigger_n = 'L' then
      q <= '1';  q_n <= '0';
    end if;
  end process timer_state;
        
  break on q_n;
        
end architecture behavioral;
