entity tb_SR_flipflop is

end entity tb_SR_flipflop;


----------------------------------------------------------------


architecture test_checking of tb_SR_flipflop is

  signal S, R, Q : bit := '0';

begin

  dut : entity work.SR_flipflop(checking)
    port map ( S => S, R => R, Q => Q );

  stumulus : process is

  begin
    wait for 10 ns;
    S <= '1';			wait for 10 ns;
    S <= '0';			wait for 10 ns;
    S <= '1';			wait for 10 ns;
    S <= '0';			wait for 10 ns;
    R <= '1';			wait for 10 ns;
    R <= '0';			wait for 10 ns;
    R <= '1';			wait for 10 ns;
    R <= '0';			wait for 10 ns;
    S <= '1';	R <= '1';	wait for 10 ns;
    R <= '0';			wait for 10 ns;
    S <= '0';			wait for 10 ns;

    wait;
  end process stumulus;

end architecture test_checking;
