entity tb_count2 is
end entity tb_count2;


architecture test of tb_count2 is

  signal clk, q0, q1 : bit;

begin

  dut : entity work.count2(buffered_outputs)
    port map ( clk => clk, q0 => q0, q1 => q1 );

  clk_gen : clk <= not clk after 10 ns;

end architecture test;
