entity tb_edge_triggered_Dff is
end entity tb_edge_triggered_Dff;


architecture test of tb_edge_triggered_Dff is

  signal D, clk, clr, Q : bit := '0';

begin

  dut : entity work.edge_triggered_Dff(behavioral)
    port map ( D => D, clk => clk, clr => clr,
	       Q => Q );

  stimulus : process is
  begin
    D <= '1';	wait for 10 ns;
    clk <= '1';	wait for 10 ns;
    D <= '0';	wait for 10 ns;
    clk <= '0';	wait for 10 ns;
    D <= '1';	wait for 10 ns;
    clr <= '1';	wait for 10 ns;
    clk <= '1';	wait for 10 ns;
    clr <= '0';	wait for 10 ns;
    clk <= '0';	wait for 10 ns;

    wait;
  end process stimulus;

end architecture test;
