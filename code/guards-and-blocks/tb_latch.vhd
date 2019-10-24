entity tb_latch is
end entity tb_latch;


architecture test of tb_latch is

 signal enable : bit := '0';
 signal d, q : bit_vector(0 to 7);

begin

  dut : entity work.latch(behavioral)
    generic map ( width => 8 )
    port map ( enable => enable, d => d, q => q );

  stimulus : process is
  begin
    wait for 10 ns;
    d <= X"11";  wait for 10 ns;
    enable <= '1';  wait for 10 ns;
    d <= X"AA";  wait for 10 ns;
    enable <= '0';  wait for 10 ns;
    d <= X"00";  wait for 10 ns;

    wait;
  end process stimulus;

end architecture test;
