entity tb_max3 is

end entity tb_max3;


----------------------------------------------------------------


architecture test_check_error of tb_max3 is

  signal a, b, c, z : integer := 0;

begin

  dut : entity work.max3(check_error)
    port map ( a => a, b => b, c => c, z => z );

  stumulus : process is

  begin
    wait for 10 ns;
    a <= 7;				wait for 10 ns;
		b <= 10;		wait for 10 ns;
    			    c <= 15;	wait for 10 ns;
    a <= 12;				wait for 10 ns;
    a <= 20;				wait for 10 ns;

    wait;
  end process stumulus;

end architecture test_check_error;
