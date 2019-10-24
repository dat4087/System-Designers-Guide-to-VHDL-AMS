library ieee;  use ieee.std_logic_1164.all;
use work.project_util.all;

entity tb_limit_checker is
end entity tb_limit_checker;


architecture test of tb_limit_checker is

  signal input : word;
  signal out_of_bounds : std_logic;

begin

  dut : entity work.limit_checker(behavioral)
    port map ( input => input,
               lower_bound => X"FFFFFFF0", upper_bound => X"00000010",
	       out_of_bounds => out_of_bounds );

  stimulus : input <= X"00000000",
                      X"00000008" after 10 ns,
                      X"00000010" after 20 ns,
                      X"00000018" after 30 ns,
                      X"FFFFFFF8" after 40 ns,
                      X"FFFFFFF0" after 50 ns,
                      X"FFFFFF00" after 60 ns;

end architecture test;
