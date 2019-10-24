entity inline_13 is

end entity inline_13;


----------------------------------------------------------------


library ieee;  use ieee.std_logic_1164.all;

architecture test of inline_13 is

  signal s : std_ulogic;

begin


  process_3_o : process is
  begin
    s <= '1' after 11 ns,
         'X' after 12 ns,
         '1' after 14 ns,
         '0' after 15 ns,
         '1' after 16 ns,
         '1' after 17 ns,
         '1' after 20 ns,
         '0' after 25 ns;
    wait for 10 ns;

    -- code from book:

    s <= reject 5 ns inertial '1' after 8 ns;

    -- end of code from book

    wait;
  end process process_3_o;


end architecture test;
