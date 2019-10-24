architecture do_nothing of ROM is
begin
end architecture do_nothing;


entity tb_rom is
end entity tb_rom;


architecture test of tb_rom is

  signal address : natural := 0;
  signal data : bit_vector(0 to 7);
  signal enable : bit := '0';

begin

  dut : entity work.ROM(do_nothing)
    port map ( address => address, data => data, enable => enable );

  stimulus : process is
  begin
    wait for 100 ns;
    address <= 1000;  wait for 10 ns;
    enable <= '1', '0' after 10 ns;  wait for 90 ns;
    address <= 1004;  wait for 10 ns;
    enable <= '1', '0' after 10 ns;  wait for 90 ns;
    address <= 1008;  wait for 10 ns;
    enable <= '1', '0' after 10 ns;  wait for 90 ns;

    wait;
  end process stimulus;

end architecture test;
