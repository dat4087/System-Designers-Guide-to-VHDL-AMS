library ieee;  use ieee.std_logic_1164.all;

entity bus_module is
  port ( synch : inout std_ulogic;  -- . . . );
  -- not in book
         other_port : in std_ulogic := 'U' );
  -- end not in book
end entity bus_module;

--------------------------------------------------

-- not in book



library ieee;  use ieee.std_logic_1164.all;

entity bus_based_system is
end entity bus_based_system;

-- end not in book


architecture top_level of bus_based_system is

  signal synch_control : std_logic;
  -- . . .

begin

  synch_control_pull_up : synch_control <= 'H';

  bus_module_1 : entity work.bus_module(behavioral)
    port map ( synch => synch_control, -- . . . );
      -- not in book
               other_port => open );
      -- end not in book

  bus_module_2 : entity work.bus_module(behavioral)
    port map ( synch => synch_control, -- . . . );
      -- not in book
               other_port => open );
      -- end not in book

  -- . . .

end architecture top_level;



architecture behavioral of bus_module is
begin

  behavior : process is
    -- . . .
    -- not in book
    constant Tdelay_synch : delay_length := 10 ns;
    constant wait_delay : delay_length := 100 ns;
    -- end not in book
  begin
    synch <= '0'  after Tdelay_synch;
    -- . . .
    -- not in book
    wait for wait_delay;
    -- end not in book
    -- ready to start operation
    synch <= 'Z' after Tdelay_synch;
    wait until synch = 'H';
    -- proceed with operation
    -- . . .
  end process behavior;

end architecture behavioral;
