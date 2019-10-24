-- This digital clock allows user to specify the duty cycle using
-- the parameters "on_time" and "off_time"

library ieee;  use ieee.std_logic_1164.all;

entity clock_duty is

  generic ( on_time : time := 20 us;
            off_time : time := 19.98 ms ); 
  
  port ( clock_out    : out std_logic := 'Z' );
  
end entity clock_duty;


architecture ideal of clock_duty is

begin

  process
  begin
    wait for 1 us;
    clock_out <= '1';
    wait for on_time;
    clock_out <= '0';
    wait for off_time;
  end process;

end architecture ideal;
