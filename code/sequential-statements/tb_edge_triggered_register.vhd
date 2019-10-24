entity tb_edge_triggered_register is

end entity tb_edge_triggered_register;


----------------------------------------------------------------


architecture test_check_timing of tb_edge_triggered_register is

  signal clock : bit := '0'; 
  signal d_in, d_out : real := 0.0;

begin

  dut : entity work.edge_triggered_register(check_timing)
    port map ( clock => clock, d_in => d_in, d_out => d_out );

  stumulus : process is

  begin
    wait for 20 ns;

    d_in <= 1.0;			wait for 10 ns;
    clock <= '1', '0' after 10 ns;	wait for 20 ns;

    d_in <= 2.0;			wait for 10 ns;
    clock <= '1', '0' after 5 ns;	wait for 20 ns;

    d_in <= 3.0;			wait for 10 ns;
    clock <= '1', '0' after 4 ns;	wait for 20 ns;

    wait;
  end process stumulus;

end architecture test_check_timing;
