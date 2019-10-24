entity mem_read is
end entity mem_read;


architecture test of mem_read is

  attribute trace : string;

  subtype byte is bit_vector(7 downto 0);
  type byte_vector is array (natural range <>) of byte;

  type ram_bus is record
      d : byte;
      cmd, status, clk : bit;
    end record ram_bus;

  -- code from book

  procedure mem_read ( address : in natural;
                       result : out byte_vector;
                       signal memory_bus : inout ram_bus ) is

    attribute trace of address : constant is "integer/hex";
    attribute trace of result : variable is "byte/multiple/hex";
    attribute trace of memory_bus : signal is
      "custom/command=rambus.cmd";
    -- . . .

  begin
    -- . . .
    -- not in book
    report address'trace;
    report result'trace;
    report memory_bus'trace;
    -- end not in book
  end procedure mem_read;

  -- end code from book

  signal memory_bus : ram_bus;

begin

  process is
    variable address : natural;
    variable result : byte_vector(0 to 3);
  begin
    mem_read ( address, result, memory_bus );
    wait;
  end process;

end architecture test;
