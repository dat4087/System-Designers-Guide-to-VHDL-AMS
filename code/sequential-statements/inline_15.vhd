entity inline_15 is

end entity inline_15;


----------------------------------------------------------------


architecture test of inline_15 is
begin

  -- code from book:

  erroneous : process is
    variable i, j : integer;
  begin
    i := loop_param;          -- error!
    for loop_param in 1 to 10 loop
      loop_param := 5;        -- error!
    end loop;
    j := loop_param;          -- error!
  end process erroneous;

  -- end of code from book


end architecture test;
