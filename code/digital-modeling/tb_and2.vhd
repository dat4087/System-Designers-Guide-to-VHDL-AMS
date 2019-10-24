entity tb_and2 is
end entity tb_and2;


library ieee;  use ieee.std_logic_1164.all;

architecture test of tb_and2 is

  signal a, b : std_ulogic := '0';
  signal y : std_ulogic;

begin

  dut : entity work.and2(detailed_delay)
    port map ( a => a, b => b, y => y );

  stimulus : process is
  begin
    wait for 10 ns;
    a <= '1';	wait for 10 ns;
    b <= '1';	wait for 10 ns;
    b <= '0';	wait for 10 ns;

    b <= '1', '0' after  250 ps;   wait for 10 ns;
    b <= '1', '0' after  350 ps;   wait for 10 ns;
    b <= '1', '0' after  450 ps;   wait for 10 ns;
    b <= '1', '0' after  550 ps;   wait for 10 ns;
    b <= '1', '0' after  650 ps;   wait for 10 ns;
    b <= '1', '0' after  750 ps;   wait for 10 ns;
    b <= '1', '0' after  850 ps;   wait for 10 ns;

    b <= '1';	wait for 10 ns;
    b <= '0', '1' after  250 ps;   wait for 10 ns;
    b <= '0', '1' after  350 ps;   wait for 10 ns;
    b <= '0', '1' after  450 ps;   wait for 10 ns;

    b <= 'X';  wait for 10 ns;
    b <= '0';  wait for 10 ns;
    b <= 'X', '0' after 250 ps;   wait for 10 ns;
    wait;
  end process stimulus;

end architecture test;
