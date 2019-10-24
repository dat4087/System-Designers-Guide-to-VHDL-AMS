entity asym_delay is
end entity asym_delay;



architecture test of asym_delay is

  signal a, z : bit;

begin

  -- code from book

  asym_delay : process (a) is
    constant Tpd_01 : time := 800 ps;
    constant Tpd_10 : time := 500 ps;
  begin
    if a = '1' then
      z <= transport a after Tpd_01;
    else  -- a = '0'
      z <= transport a after Tpd_10;
    end if;
  end process asym_delay;

  -- end code from book


  stimulus : process is
  begin
    a <= '1' after 2000 ps,
         '0' after 4000 ps,
         '1' after 6000 ps,
         '0' after 6200 ps;
    wait;
  end process stimulus;

end architecture test;
