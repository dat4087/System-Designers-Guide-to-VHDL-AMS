architecture functional of S_R_flipflop is

begin

  q <= '1' when s = '1' else
       '0' when r = '1';

  q_n <= '0' when s = '1' else
         '1' when r = '1';

end architecture functional;


entity tb_S_R_flipflop is
end entity tb_S_R_flipflop;


architecture test of tb_S_R_flipflop is

  signal s, r : bit := '0';
  signal q, q_n : bit;

begin

  dut : entity work.S_R_flipflop(functional)
    port map ( s => s, r => r, q => q, q_n => q_n );

  stimulus : process is
  begin
    wait for 10 ns;
    s <= '1';	wait for 10 ns;
    s <= '0';	wait for 10 ns;
    r <= '1';	wait for 10 ns;
    r <= '0';	wait for 10 ns;
    s <= '1';	wait for 10 ns;
    r <= '1';	wait for 10 ns;
    s <= '0';	wait for 10 ns;
    r <= '0';	wait for 10 ns;

    wait;
  end process stimulus;

end architecture test;
