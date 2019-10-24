-- not in book

entity processor is
end entity processor;

architecture behavioral of processor is
begin
end architecture behavioral;

entity multiprocessor is
end entity multiprocessor;

-- end not in book


architecture system of multiprocessor is

  -- . . .    -- signal declarations

-- not in book

    use work.cache_types.all;

    constant num_PEs : positive := 4;

    type block_range_vector is array(0 to num_PEs - 1) of block_range;

    signal cache_clk : bit;
    signal hit, read, block_is_shared : bit_vector(0 to num_PEs - 1);
    signal current_block_number : block_range_vector;

-- end not in book

begin

  PE_array : for PE_index in 0 to num_PEs - 1 generate

    -- a processing element
    PE : entity work.processor(behavioral)
--        port map ( . . . );
-- replaces elided code in book (for syntactic correctness)
      ;
--

    -- and its attached level-2 cache
    L2_cache : entity work.cache(behavioral)
        port map ( -- . . . );
-- replaces elided code in book (for syntactic correctness)
            cache_clk => cache_clk,
            hit => hit(PE_index),
            read => read(PE_index),
            block_is_shared => block_is_shared(PE_index),
            current_block_number => current_block_number(PE_index) );
--

    -- . . .

  end generate PE_array;

  -- the instrumentation process that periodically dumps
  -- recorded counts to the output file
  log_controller : process is
    use work.cache_instrumentation.all;
  begin
    wait for 10 ms;
    cache_counters.dump_log ( std.textio.output );
  end process log_controller;

  -- . . .


-- not in book

    stimulus : process is
    begin
        wait for 100 ns;
        hit <= "1000";
        read <= "1011";
        block_is_shared <= "0001";
        current_block_number <= (0, 0, 0, 0);
        cache_clk <= '1', '0' after 10 ns;
        wait for 90 ns;
        hit <= "0001";
        read <= "1011";
        block_is_shared <= "0011";
        current_block_number <= (0, 0, 0, 0);
        cache_clk <= '1', '0' after 10 ns;
        wait for 90 ns;
        hit <= "0000";
        read <= "1011";
        block_is_shared <= "0011";
        current_block_number <= (1, 1, 0, 0);
        cache_clk <= '1', '0' after 10 ns;
        wait;
    end process stimulus;

-- end not in book

end architecture system;
