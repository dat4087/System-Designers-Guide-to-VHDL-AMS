library ieee;  use ieee.std_logic_1164.all;

entity ROM is
  generic ( load_file_name : string );
  port ( sel : in std_logic;
         address : in std_logic_vector;
         data : inout std_logic_vector );
end entity ROM;

--------------------------------------------------

architecture behavioral of ROM is

begin

  behavior : process is

    subtype word is std_logic_vector(0 to data'length - 1);
    type storage_array is
      array (natural range 0 to 2**address'length - 1) of word;
    variable storage : storage_array;
    variable index : natural;
    -- . . .    -- other declarations

    type load_file_type is file of word;
    file load_file : load_file_type open read_mode is load_file_name;

  begin

    -- load ROM contents from load_file
    index := 0;
    while not endfile(load_file) loop
      read(load_file, storage(index));
      index := index + 1;
    end loop;

    -- respond to ROM accesses
    loop
      -- . . .
    end loop;

  end process behavior;

end architecture behavioral;
