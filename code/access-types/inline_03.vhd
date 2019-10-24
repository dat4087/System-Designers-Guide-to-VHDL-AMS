entity inline_03 is

end entity inline_03;


----------------------------------------------------------------


architecture test of inline_03 is
begin


  process is

    type natural_ptr is access natural;

    -- code from book:

    variable count1, count2 : natural_ptr;

    -- end of code from book

  begin

    -- code from book:

    count1 := new natural'(5);
    count2 := new natural'(10);

    count2 := count1;

    count1.all := 20;

    -- end of code from book

    assert
    -- code from book:
    count1 = count2
    -- end of code from book
    ;

    -- code from book:

    count1 := new natural'(30);
    count2 := new natural'(30);

    -- end of code from book

    assert count1 = count2;

    assert
    -- code from book:
    count1.all = count2.all
    -- end of code from book
    ;

    -- code from book:

    if count1 /= null then
      count1.all := count1.all + 1;
    end if;

    -- end of code from book

    wait;
  end process;


end architecture test;
