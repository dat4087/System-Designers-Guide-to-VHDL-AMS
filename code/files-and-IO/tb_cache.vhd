entity tb_cache is
end entity tb_cache;



architecture test of tb_cache is

  signal halt : bit := '0';

begin

  dut : entity work.cache(instrumented)
    generic map ( cache_size => 128*1024, block_size => 16,
                  associativity => 2, benchmark_name => "dhrystone " )
    port map ( halt => halt );

  halt <= '1' after 10 ns;

end architecture test;



entity tb_cache_read_data is
end entity tb_cache_read_data;


architecture reader of tb_cache_read_data is
begin

  process is

    type measurement_record is
      record
        cache_size, block_size, associativity : positive;
        benchmark_name : string(1 to 10);
        miss_rate : real;
        ave_access_time : delay_length;
      end record;
    type measurement_file is file of measurement_record;
    file measurements : measurement_file open read_mode is "cache-measurements";
    variable measurement : measurement_record;

    use std.textio.all;
    variable L : line;

  begin
    while not endfile(measurements) loop
      read(measurements, measurement);
      write(L, measurement.cache_size);
      write(L, ' ');
      write(L, measurement.block_size);
      write(L, ' ');
      write(L, measurement.associativity);
      write(L, ' ');
      write(L, measurement.benchmark_name);
      write(L, ' ');
      write(L, measurement.miss_rate);
      write(L, ' ');
      write(L, measurement.ave_access_time);
      writeline(output, L);

    end loop;

    wait;
  end process;

end architecture reader;
