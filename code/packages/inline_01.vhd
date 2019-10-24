entity inline_01 is

end entity inline_01;


library ieee;

architecture test of inline_01 is

begin

  process_1_a : process is

    -- code from book:

    variable stored_state : ieee.std_logic_1164.std_ulogic;

    -- end of code from book

  begin

    wait;
  end process process_1_a;


end architecture test;
