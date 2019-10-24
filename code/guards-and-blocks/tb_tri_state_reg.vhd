use work.resolve.all;

entity tb_tri_state_reg is
end entity tb_tri_state_reg;


architecture test of tb_tri_state_reg is

  signal d1, d2, q : resolved_byte := X"00";
  signal clk1, clk2, oe1, oe2 : bit := '0';

begin

  dut1 : entity work.tri_state_reg(behavioral)
    port map ( d => d1, q => q, clock => clk1, out_enable => oe1 );

  dut2 : entity work.tri_state_reg(behavioral)
    port map ( d => d2, q => q, clock => clk2, out_enable => oe2 );

  stimulus : process is
  begin
    d1 <= X"11";  clk1 <= '1', '0' after 5 ns;  wait for 10 ns;
    oe1 <= '1', '0' after 5 ns;  wait for 10 ns;
    d2 <= X"21";  clk2 <= '1', '0' after 5 ns;  wait for 10 ns;
    oe2 <= '1', '0' after 5 ns;  wait for 10 ns;
    oe1 <= '1', '0' after 5 ns;
    oe2 <= '1', '0' after 5 ns;

    wait;
  end process stimulus;

end architecture test;
