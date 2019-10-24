-- not in book

library ieee;  use ieee.std_logic_1164.all;

-- end not in book


entity program_ROM is
  port ( address : in std_ulogic_vector(14 downto 0);
         data : out std_ulogic_vector(7 downto 0);
         enable : in std_ulogic );

  subtype instruction_byte is bit_vector(7 downto 0);
  type program_array is array (0 to 2**14 - 1) of instruction_byte;
  constant program : program_array
    := ( X"32", X"3F", X"03",  -- LDA  $3F03
         X"71", X"23",         -- BLT    $23
         -- not in book
         others => X"00"
         -- end not in book
         -- . . .
       );

end entity program_ROM;
