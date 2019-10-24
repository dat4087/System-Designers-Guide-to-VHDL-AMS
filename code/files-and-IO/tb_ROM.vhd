library ieee;  use ieee.std_logic_1164.all;

entity tb_ROM_write_data is
end entity tb_ROM_write_data;


architecture writer of tb_ROM_write_data is
begin

  process is

    subtype word is std_logic_vector(0 to 7);
    type load_file_type is file of word;
    file load_file : load_file_type open write_mode is "tb_ROM.dat";

  begin
    write(load_file, word'(X"00"));
    write(load_file, word'(X"01"));
    write(load_file, word'(X"02"));
    write(load_file, word'(X"03"));
    write(load_file, word'(X"04"));
    write(load_file, word'(X"05"));
    write(load_file, word'(X"06"));
    write(load_file, word'(X"07"));
    write(load_file, word'(X"08"));
    write(load_file, word'(X"09"));
    write(load_file, word'(X"0A"));
    write(load_file, word'(X"0B"));
    write(load_file, word'(X"0C"));
    write(load_file, word'(X"0D"));
    write(load_file, word'(X"0E"));
    write(load_file, word'(X"0F"));

    wait;
  end process;

end architecture writer;



library ieee;  use ieee.std_logic_1164.all;

entity tb_ROM is
end entity tb_ROM;


architecture test of tb_ROM is

  signal sel : std_logic;
  signal address : std_logic_vector(3 downto 0);
  signal data : std_logic_vector(0 to 7);

begin

  dut : entity work.ROM(behavioral)
    generic map ( load_file_name => "tb_ROM.dat" )
    port map ( sel, address, data );

end architecture test;
