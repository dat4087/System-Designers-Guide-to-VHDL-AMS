entity inline_07d is

end entity inline_07d;


----------------------------------------------------------------


architecture test of inline_07d is
begin


  process is

    -- code from book:

    type value_cell;

    type value_ptr is access value_cell;

    type value_cell is record
        value : bit_vector(0 to 3);
        next_cell : value_ptr;
      end record value_cell;

    variable value_list : value_ptr;

    -- end of code from book

  begin

    -- code from book:

    if value_list /= null then
      -- . . .       -- do something with the list
      -- not in book
      report "value_list /= null";
      -- end not in book
    end if;

    value_list := new value_cell'( B"1000", value_list );

    value_list := new value_cell'( B"0010", value_list );

    value_list := new value_cell'( B"0000", value_list );

    -- end of code from book

    wait;
  end process;


end architecture test;
