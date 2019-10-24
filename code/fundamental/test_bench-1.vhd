library ieee_proposed;
use ieee_proposed.mechanical_systems.all;
use ieee_proposed.electrical_systems.all;

entity test_bench is
end entity test_bench;

architecture example of test_bench is
  
  signal clk, reset: bit;
  signal rpm : natural;
  signal forward : bit;
        
begin
  dut : entity work.propulsion(mixed)
    port map ( clk, reset, rpm, forward );
  
  stimulus: process is
  begin
    clk <= '1'; reset <= '0'; rpm <= 0; forward <= '1'; wait for 10 sec;
    clk <= '0'; wait for 10 sec;
    clk <= '1'; rpm <= 50; wait for 20 sec;
    clk <= '0'; wait for 20 sec;
    clk <= '1'; rpm <= 0; wait for 20 sec;
    clk <= '0'; wait for 20 sec;
    clk <= '1'; rpm <= 50; forward <= '0'; wait for 20 sec;
    clk <= '0'; wait for 20 sec;
    -- ...
    wait;
  end process stimulus;
  
end architecture example;
