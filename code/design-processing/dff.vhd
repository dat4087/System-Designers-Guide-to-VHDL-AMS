library ieee;  use ieee.std_logic_1164.all;
               
entity dff is
  port ( signal d, clk : in std_ulogic;  q : out std_ulogic );
end entity dff;

----------------------------------------------------------------

architecture behav of dff is
begin
  
  storage : process ( clk ) is
  begin
    if clk'event and (clk = '1' or clk = 'H') then
      q <= d after 5 ns;
    end if;
  end process storage;
        
end architecture behav;
