entity tb_reg4_struct is

end entity tb_reg4_struct;

----------------------------------------------------------------

architecture tb_reg4_struct of tb_reg4_struct is

  signal d0, d1, d2, d3, en, clk, q0, q1, q2, q3 : bit;

begin

  dut : entity work.reg4(struct)
    port map ( d0 => d0, d1 => d1, d2 => d2, d3 => d3, en => en, clk => clk,
               q0 => q0, q1 => q1, q2 => q2, q3 => q3 );

  stimulus : process is
  begin
    wait for 20 ns;
    assert q0 = '0' and q1 = '0' and q2 = '0' and q3 = '0';
    (d0, d1, d2, d3) <= bit_vector'("1010");	wait for 20 ns;
    assert q0 = '0' and q1 = '0' and q2 = '0' and q3 = '0';
    en <= '1';					wait for 20 ns;
    assert q0 = '0' and q1 = '0' and q2 = '0' and q3 = '0';
    clk <= '1';					wait for 20 ns;
    assert q0 = '1' and q1 = '0' and q2 = '1' and q3 = '0';
    (d0, d1, d2, d3) <= bit_vector'("0101");	wait for 20 ns;
    assert q0 = '1' and q1 = '0' and q2 = '1' and q3 = '0';
    clk <= '0';					wait for 20 ns;
    assert q0 = '1' and q1 = '0' and q2 = '1' and q3 = '0';
    (d0, d1, d2, d3) <= bit_vector'("0000");	wait for 20 ns;
    assert q0 = '1' and q1 = '0' and q2 = '1' and q3 = '0';
    en <= '1';					wait for 20 ns;
    assert q0 = '1' and q1 = '0' and q2 = '1' and q3 = '0';
    (d0, d1, d2, d3) <= bit_vector'("1111");	wait for 20 ns;
    assert q0 = '1' and q1 = '0' and q2 = '1' and q3 = '0';

    wait;
  end process stimulus;

end architecture tbt_reg4_struct;
