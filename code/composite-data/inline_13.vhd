entity inline_13 is

end entity inline_13;


----------------------------------------------------------------


architecture test of inline_13 is
begin


  process_3_b : process is

    -- code from book:

    type array1 is array (1 to 100) of integer;
    type array2 is array (100 downto 1) of integer;

    variable a1 : array1;
    variable a2 : array2;

    -- end of code from book

  begin

    a1(11 to 20) := a1(11 to 20);
    a2(50 downto 41) := a2(50 downto 41);

    a1(10 to 1) := a1(10 to 1);
    a2(1 downto 10) := a2(1 downto 10);

    a1(10 downto 1) := a1(10 downto 1);  -- illegal
    a2(1 to 10) := a2(1 to 10);  -- illegal;

    wait;
  end process process_3_b;


end architecture test;
