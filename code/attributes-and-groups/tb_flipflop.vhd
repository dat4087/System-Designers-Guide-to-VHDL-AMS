
entity tb_flipflop is
end entity tb_flipflop;


architecture test of tb_flipflop is

  signal clk, d, q : bit;

begin

  dut : entity work.flipflop(behavior)
    generic map ( Tsetup => 3 ns )
    port map ( clk => clk, d => d, q => q );

  clk <= '1' after 10 ns, '0' after 20 ns;

  d <= '1' after 8 ns;

end architecture test;
