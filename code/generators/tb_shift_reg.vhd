library ieee;  use ieee.std_logic_1164.all;

entity tb_shift_reg is
end entity tb_shift_reg;


architecture test of tb_shift_reg is

  signal phi1, phi2, serial_data_in : std_logic := '0';
  signal parallel_data : std_logic_vector(3 downto 0);

begin

  dut : entity work.shift_reg(cell_level)
    port map ( phi1 => phi1, phi2 => phi2,
               serial_data_in => serial_data_in,
               parallel_data => parallel_data );

  clock_gen : process is
  begin
    phi1 <= '1', '0' after 4 ns;
    phi2 <= '1' after 5 ns, '0' after 9 ns;
    wait for 10 ns;
  end process clock_gen;

  stimulus : process is
  begin
    serial_data_in <= '0';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '0';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '0';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '0';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '0';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '1';  wait until phi2 = '1';
    serial_data_in <= '0';

    wait;
  end process stimulus;

end architecture test;
