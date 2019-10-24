-- not in book

library ieee;  use ieee.std_logic_1164.all;

entity DRAM is
  port ( a :  in std_logic_vector(0 to 10);
         d :  inout std_logic_vector(0 to 3);
         cs, we, ras, cas : in std_logic );
end entity DRAM;


architecture empty of DRAM is
begin
  d <= (others => 'Z');
end architecture empty;



library ieee;  use ieee.std_logic_1164.all;

entity memory_board is
end entity memory_board;

-- end not in book


architecture chip_level of memory_board is

  component DRAM is
    port ( a :  in std_logic_vector(0 to 10);
           d :  inout std_logic_vector(0 to 3);
           cs, we, ras, cas : in std_logic );
  end component DRAM;

  signal buffered_address : std_logic_vector(0 to 10);
  signal DRAM_data : std_logic_vector(0 to 31);
  signal bank_select : std_logic_vector(0 to 3);
  signal buffered_we, buffered_ras, buffered_cas : std_logic;

  -- . . .    -- other declarations

begin

  bank_array : for bank_index in 0 to 3 generate
  begin

    nibble_array : for nibble_index in 0 to 7 generate

      constant data_lo : natural := nibble_index * 4;
      constant data_hi : natural := nibble_index * 4 + 3;

    begin

      a_DRAM : component DRAM
        port map ( a => buffered_address,
                   d => DRAM_data(data_lo to data_hi),
                   cs => bank_select(bank_index),
                   we => buffered_we,
                   ras => buffered_ras,
                   cas => buffered_cas );

    end generate nibble_array;

  end generate bank_array;

  -- . . .    -- other component instances, etc

  -- not in book

  buffered_address <= "01010101010";
  DRAM_data <= X"01234567";

  -- end not in book

end architecture chip_level;
