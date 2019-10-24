entity inline_11 is

end entity inline_11;


----------------------------------------------------------------


architecture test of inline_11 is

  signal line_in, line_out : bit := '0';

begin


  -- code from book:

  transmission_line : process (line_in) is
  begin
    line_out <= transport line_in after 500 ps;
  end process transmission_line;

  -- end of code from book


  ----------------


  stimulus : process is
  begin
    line_in <= '1' after 2000 ps,
               '0' after 4000 ps,
               '1' after 6000 ps,
               '0' after 6200 ps,
               '1' after 8000 ps,
               '0' after 8200 ps,
               '1' after 8300 ps,
               '0' after 8400 ps;

    wait;
  end process stimulus;


end architecture test;
