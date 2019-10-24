-- not in book

package cache_types is

    subtype block_range is natural range 0 to 7;

end package cache_types;

-- end not in book



package cache_instrumentation is

  use work.cache_types.all;

  type shared_counters is protected

    procedure log_read_miss ( block_number : block_range;
                              is_shared : boolean );

    procedure log_write_miss ( block_number : block_range );

    procedure dump_log ( file log_file : std.textio.text );

  end protected shared_counters;

  shared variable cache_counters : shared_counters;

end package cache_instrumentation;

----------------------------------------------------------------

package body cache_instrumentation is

  type shared_counters is protected body

    type counter_record is record  -- counters for a block
      shared_read_misses,
      private_read_misses,
      write_misses : natural;
    end record counter_record;

    type counter_array is array ( block_range ) of counter_record;

    -- instrumentation data structure
    variable counters : counter_array := (others => (0, 0, 0));

    procedure log_read_miss ( block_number : block_range;
                              is_shared : boolean ) is
    begin
      if is_shared then
        counters(block_number).shared_read_misses
            := counters(block_number).shared_read_misses + 1;
      else
        counters(block_number).private_read_misses
            := counters(block_number).private_read_misses + 1;
      end if;
    end procedure log_read_miss;

    procedure log_write_miss ( block_number : block_range ) is
    begin
      counters(block_number).write_misses
          := counters(block_number).write_misses + 1;
    end procedure log_write_miss;

    procedure dump_log ( file log_file : std.textio.text ) is
      use std.textio.all;
      variable L : line;
    begin
      -- write a line of data for each block in the address space
      for block_number in block_range loop
        write ( L, string'("Block ") );
        write ( L, block_number );
        write ( L, string'(":  shared read misses = ") );
        write ( L, counters(block_number).shared_read_misses );
        -- . . .
-- not in book
        write ( L, string'(",  private read misses = ") );
        write ( L, counters(block_number).private_read_misses );
        write ( L, string'(",  write misses = ") );
        write ( L, counters(block_number).write_misses );
-- end not in book
        writeline ( log_file, L );
      end loop;
    end procedure dump_log;

  end protected body shared_counters;

end package body cache_instrumentation;
