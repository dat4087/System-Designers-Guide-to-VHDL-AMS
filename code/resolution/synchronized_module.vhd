library ieee;  use ieee.std_logic_1164.all;

entity synchronized_module is
end entity synchronized_module;



architecture test of synchronized_module is

  use work.synchronize.all;

  signal barrier : std_logic;

begin

  pullup : barrier <= 'H';

  -- code from book

  synchronized_module : process is
    -- . . .
  begin
    init_synchronize(barrier);
    -- . . .
    loop
      -- . . .
      begin_synchronize(barrier);
      -- . . .    -- perform operation, synchronized with other processes
      end_synchronize(barrier);
      -- . . .
    end loop;
  end process synchronized_module;

  -- end code from book

  another_synchronized_module : process is
  begin
    init_synchronize(barrier);
    loop
      wait for 10 ns;
      begin_synchronize(barrier);
      -- . . .    -- perform operation, synchronized with other processes
      end_synchronize(barrier);
    end loop;
  end process another_synchronized_module;

end architecture test;
