entity tb_cos is

end entity tb_cos;


----------------------------------------------------------------


architecture test_fixed_length_series of tb_cos is

  signal theta, result : real := 0.0;

begin

  dut : entity work.cos(fixed_length_series)
    port map ( theta => theta, result => result );

  stimulus : process is

    constant pi : real := 3.1415927;

  begin
    wait for 10 ns;
    theta <= pi / 6.0;		wait for 10 ns;
    theta <= pi / 4.0;		wait for 10 ns;
    theta <= pi / 3.0;		wait for 10 ns;
    theta <= pi / 2.0;		wait for 10 ns;

    wait;
  end process stimulus;

end architecture test_fixed_length_series;
