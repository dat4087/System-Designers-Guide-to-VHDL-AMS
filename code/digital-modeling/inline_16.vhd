entity inline_16 is

end entity inline_16;


----------------------------------------------------------------


architecture test of inline_16 is

  constant Tpd_01 : time := 800 ps;
  constant Tpd_10 : time := 500 ps;

  signal a, z : bit;

begin


  -- code from book:

  asym_delay : z <= transport a after Tpd_01 when a = '1' else
                              a after Tpd_10;

  -- end of code from book


  ----------------


  stimulus : process is
  begin
    a <= '1' after 2000 ps,
         '0' after 4000 ps,
         '1' after 6000 ps,
         '0' after 6200 ps;

    wait;
  end process stimulus;


end architecture test;
