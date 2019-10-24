entity inline_09a is

end entity inline_09a;


----------------------------------------------------------------


library ieee_proposed;  use ieee_proposed.electrical_systems.all;

architecture test of inline_09a is

  -- code from book:

  nature electrical_vector is array (natural range <>) of electrical;

  terminal local_bus : electrical_vector(15 downto 0);
  
  subnature long_bus is electrical_vector(7 downto 0);
  terminal remote_bus : long_bus;
    
  -- end of code from book

begin
end architecture test;
