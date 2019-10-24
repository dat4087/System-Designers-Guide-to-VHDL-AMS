entity list_traversal is

end entity list_traversal;


----------------------------------------------------------------


architecture test of list_traversal is

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

  begin
    value_list := new value_cell'( B"1000", value_list );
    value_list := new value_cell'( B"0010", value_list );
    value_list := new value_cell'( B"0000", value_list );

    -- code from book:

    current_cell := value_list;
    while current_cell /= null loop
      s <= current_cell.value;
      wait for 10 ns;
      current_cell := current_cell.next_cell;
    end loop;

    -- end of code from book

    wait;
  end process;

end architecture test;
