entity tb_counter is
end entity tb_counter;


architecture test of tb_counter is

  signal reset, clk : bit := '0';
  signal q : bit_vector(3 downto 0);

begin

  dut : entity work.counter(detailed_timing)
    generic map ( tipd_reset => 2 ns,
                  tipd_clk => 3 ns,
                  topd_q => 4 ns,
                  tsetup_reset => 3 ns,
                  thold_reset => 1 ns )
    port map ( reset => reset, clk => clk, q => q );

  clk_gen : clk <= '1' after 10 ns, '0' after 20 ns when clk = '0';

  reset <= '1' after 62 ns, '0' after 106 ns;

end architecture test;
