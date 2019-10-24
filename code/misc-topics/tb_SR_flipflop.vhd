entity tb_SR_flipflop is
end entity tb_SR_flipflop;


architecture test of tb_SR_flipflop is

  signal s_n, r_n, q, q_n : bit;

begin

  dut : entity work.SR_flipflop
    port map ( s_n, r_n, q, q_n );

  s_n <= '1',
         '0' after 10 ns, '1' after 15 ns,
         '0' after 30 ns, '1' after 40 ns;

  r_n <= '0', '1' after 5 ns,
         '0' after 20 ns, '1' after 25 ns,
         '0' after 30 ns, '1' after 35 ns;

end architecture test;
