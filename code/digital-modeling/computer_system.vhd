-- not in book

entity computer_system is
end entity computer_system;

-- end not in book


architecture abstract of computer_system is

  subtype word is bit_vector(31 downto 0);

  signal address : natural;
  signal read_data, write_data : word;
  signal mem_read, mem_write : bit := '0';
  signal mem_ready : bit := '0';

begin

  cpu : process is
    variable instr_reg : word;
    variable PC : natural;
    -- . . .    -- other declarations
  begin
    loop
      address <= PC;
      mem_read <= '1';
      wait until mem_ready = '1';
      instr_reg := read_data;
      mem_read <= '0';
      wait until mem_ready = '0';
      PC := PC + 4;
      -- . . .    -- execute the instruction
    end loop;
  end process cpu;

  memory : process is
    type memory_array is array (0 to 2**14 - 1) of word;
    variable store : memory_array := (
				       -- . . .
				       -- not in book
				       0 => X"0000_0000",
				       1 => X"0000_0004",
				       2 => X"0000_0008",
				       3 => X"0000_000C",
				       4 => X"0000_0010",
				       5 => X"0000_0014",
				       others => X"0000_0000"
				        -- end not in book
				     );
  begin
    wait until mem_read = '1' or mem_write = '1';
    if mem_read = '1' then
      read_data <= store( address / 4 );
      mem_ready <= '1';
      wait until mem_read = '0';
      mem_ready <= '0';
    else
      -- . . .    -- perform write access
    end if;
  end process memory;

end architecture abstract;
