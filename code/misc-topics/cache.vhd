-- not in book

use work.cache_types.all;

entity cache is
    port ( cache_clk : in bit;
           hit, read, block_is_shared : in bit;
           current_block_number : block_range );
end entity cache;

-- end not in book


architecture behavioral of cache is

  use work.cache_instrumentation.all;
  -- . . .

begin

  cache_controller : process is
    -- . . .    -- local variables used by the cache controller
  begin
    -- . . .
-- not in book
      wait until cache_clk = '1';
-- end not in book
    -- if cache miss, record in the instrumentation shared variable
    if hit = '0' then
      if read = '1' then
        cache_counters.log_read_miss ( current_block_number,
                                       block_is_shared = '1' );
      else
        cache_counters.log_write_miss ( current_block_number );
      end if;
    end if;
    -- . . .
  end process cache_controller;

  -- . . .

end architecture behavioral;
