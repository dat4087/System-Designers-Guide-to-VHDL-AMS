entity list_search is

end entity list_search;


----------------------------------------------------------------


architecture test of list_search is

  signal s : bit_vector(0 to 3);

begin

  process is

    type value_cell;

    type value_ptr is access value_cell;

    type value_cell is record
        value : bit_vector(0 to 3);
        next_cell : value_ptr;
      end record value_cell;

    variable value_list, current_cell : value_ptr;
    variable search_value : bit_vector(0 to 3);

  begin
    value_list := new value_cell'( B"1000", value_list );
    value_list := new value_cell'( B"0010", value_list );
    value_list := new value_cell'( B"0000", value_list );

    search_value := B"0010";

    -- code from book:

    current_cell := value_list;
    while current_cell /= null
        and current_cell.value /= search_value loop
      current_cell := current_cell.next_cell;
    end loop;
    assert current_cell /= null
      report "search for value failed";

    -- end of code from book

    search_value := B"1111";

    current_cell := value_list;
    while current_cell /= null
        and current_cell.value /= search_value loop
      current_cell := current_cell.next_cell;
    end loop;
    assert current_cell /= null
      report "search for value failed";

    wait;
  end process;

end architecture test;
