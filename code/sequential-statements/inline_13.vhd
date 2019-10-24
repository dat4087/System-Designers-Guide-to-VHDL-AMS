entity inline_13 is

end entity inline_13;


----------------------------------------------------------------


architecture test of inline_13 is

  signal count_out : integer;

begin


  process_4_b : process is
  begin

    -- code from book:

    for count_value in 0 to 127 loop
      count_out <= count_value;
      wait for 5 ns;
    end loop;

    -- end of code from book

    wait;
  end process process_4_b;


end architecture test;

