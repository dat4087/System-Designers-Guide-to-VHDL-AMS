entity tb_coeff_ram is

end entity tb_coeff_ram;


----------------------------------------------------------------


architecture test_abstract of tb_coeff_ram is

  use work.coeff_ram_types.all;

  signal rd, wr : bit := '0';
  signal addr : coeff_ram_address := 0;
  signal d_in, d_out : real := 0.0;

begin

  dut : entity work.coeff_ram(abstract)
    port map ( rd => rd, wr => wr,
	       addr => addr,
	       d_in => d_in, d_out => d_out );

  stumulus : process is

  begin
    wait for 100 ns;

    addr <= 10;  d_in <= 10.0;  wait for 10 ns;
    wr <= '1';			wait for 10 ns;
    d_in <= 20.0;  		wait for 10 ns;
    wr <= '0';			wait for 70 ns;

    addr <= 20;			wait for 10 ns;
    rd <= '1';			wait for 10 ns;
    addr <= 10;			wait for 10 ns;
    rd <= '0';			wait for 10 ns;

    wait;
  end process stumulus;

end architecture test_abstract;
