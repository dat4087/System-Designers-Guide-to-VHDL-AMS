entity inline_17 is

end entity inline_17;


----------------------------------------------------------------


architecture test of inline_17 is

  signal s, r, q, q_n : bit := '0';

begin

  q <= '1' when s = '1' else
       '0' when r = '1';

  q_n <= '0' when s = '1' else
         '1' when r = '1';


  -- code from book:

  check : process is
  begin
    assert not (s = '1' and r = '1')
      report "Incorrect use of S_R_flip_flop: s and r both '1'";
    wait on s, r;
  end process check;

  -- end of code from book


  stimulus : process is
  begin
    wait for 10 ns;
    s <= '1';	wait for 10 ns;
    s <= '0';	wait for 10 ns;
    r <= '1';	wait for 10 ns;
    r <= '0';	wait for 10 ns;
    s <= '1';	wait for 10 ns;
    r <= '1';	wait for 10 ns;
    s <= '0';	wait for 10 ns;
    r <= '0';	wait for 10 ns;

    wait;
  end process stimulus;


end architecture test;
