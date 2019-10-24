entity cache is
  generic ( cache_size, block_size, associativity : positive;
            benchmark_name : string(1 to 10) );
  port ( halt : in bit );
end entity cache;



architecture instrumented of cache is

begin

  -- code from book

  cache_monitor : process is

    type measurement_record is
      record
        cache_size, block_size, associativity : positive;
        benchmark_name : string(1 to 10);
        miss_rate : real;
        ave_access_time : delay_length;
      end record;
    type measurement_file is file of measurement_record;
    file measurements : measurement_file
      open append_mode is "cache-measurements";
    -- . . .

    -- not in book
    constant miss_count : natural := 100;
    constant total_accesses : natural := 1000;
    constant total_delay : delay_length := 2400 ns;
    -- end not in book

  begin
    -- . . .
    loop
      -- . . .
      -- not in book
      wait on halt;
      -- end not in book
      exit when halt = '1';
      -- . . .
    end loop;

    write ( measurements,
            measurement_record'(
              -- write values of generics for this run
              cache_size, block_size, associativity, benchmark_name,
              -- calculate performance metrics
              miss_rate => real(miss_count) / real(total_accesses),
              ave_access_time => total_delay / total_accesses ) );
    wait;

  end process cache_monitor;

  -- end code from book

end architecture instrumented;
