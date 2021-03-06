entity inline_07 is

end entity inline_07;


----------------------------------------------------------------


library ieee;  use ieee.std_logic_1164.all;

architecture test of inline_07 is

  signal clk, d : std_ulogic;

  constant Tpw_clk : delay_length := 10 ns;
  constant Tsu : delay_length := 4 ns;

begin


  process_3_c : process (clk, d) is
  begin

    -- code from book:

    if clk'event and (clk = '1' or clk = 'H')
                 and (clk'last_value = '0' or clk'last_value = 'L') 
    then
      assert d'last_event >= Tsu
        report "Timing error: d changed within setup time of clk";
    end if;

    -- end of code from book

  end process process_3_c;


  ----------------


  process_3_d : process (clk, d) is
  begin

    -- code from book:

    assert (not clk'event) or clk'delayed'last_event >= Tpw_clk
      report "Clock frequency too high";

    -- end of code from book

  end process process_3_d;


  ----------------


  process_3_e : process is
  begin

    -- code from book:

    wait until clk = '1';

    -- end of code from book

    report "clk changed to '1'";
  end process process_3_e;


  ----------------


  stimulus_3_c_d : process is
  begin

    clk <= '1' after  15 ns,
           '0' after  30 ns,
           '1' after  40 ns,
           '0' after  50 ns,
           'H' after  60 ns,
           '0' after  70 ns,
           '1' after  80 ns,
           'L' after  90 ns,
           'H' after 100 ns,
           'L' after 120 ns,
           '1' after 125 ns, -- should cause error
           '0' after 130 ns; -- should cause error

    d <= '1' after  35 ns,
         '0' after  77 ns, -- should cause error
         '1' after 102 ns;

    wait;
  end process stimulus_3_c_d;


end architecture test;
