entity inline_11 is

end entity inline_11;


----------------------------------------------------------------


architecture test of inline_11 is

  signal sensitivity_list : bit := '0';

begin


  -- code from book:

  -- make "sensitivity_list" roman italic
  control_section : process ( sensitivity_list ) is
  begin
    null;
  end process control_section;

  -- end of code from book

  stimulus : process is
  begin
    sensitivity_list <= '1' after 10 ns, '0' after 20 ns;
    wait;
  end process stimulus;

end architecture test;

