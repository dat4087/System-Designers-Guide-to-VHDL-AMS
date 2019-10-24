library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity volume_sensor is
  port ( terminal flow, minus_ref : electrical;
         signal clk, rst : in std_ulogic;
         signal full : out std_ulogic );
end entity volume_sensor;

----------------------------------------------------------------

architecture structural of volume_sensor is
  
  terminal minus_volume : electrical;
  signal async_full, sync1_full : std_ulogic;
  
begin
  
  int : entity work.inverting_integrator(structural)
    port map ( input => flow, output => minus_volume, rst => rst );
        
  comp : entity work.comparator(hysteresis)
    port map ( plus_in => minus_volume, minus_in => minus_ref,
               output => async_full );
        
  sync1 : entity work.dff(behav)
    port map ( d => async_full, clk => clk, q => sync1_full );
        
  sync2 : entity work.dff(behav)
    port map ( d => sync1_full, clk => clk, q => full );
        
end architecture structural;
