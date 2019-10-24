entity tb_byte_swap is

end entity tb_byte_swap;


----------------------------------------------------------------


use work.byte_swap_types.all;


architecture test_behavior of tb_byte_swap is

  signal input, output : halfword := x"0000";

begin

  dut : entity work.byte_swap(behavior)
    port map ( input => input, output => output );

  stumulus : process is
  begin
			wait for 10 ns;
    input <= x"ff00";	wait for 10 ns;
    input <= x"00ff";	wait for 10 ns;
    input <= x"aa33";	wait for 10 ns;

    wait;
  end process stumulus;

end architecture test_behavior;
