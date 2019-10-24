entity inline_09 is

end entity inline_09;


----------------------------------------------------------------


architecture test of inline_09 is

begin

  process is

    type value_cell;

    type value_ptr is access value_cell;

    type value_cell is record
        value : bit_vector(0 to 3);
        next_cell : value_ptr;
      end record value_cell;

    variable value_list, cell_to_be_deleted : value_ptr;

  begin
    value_list := new value_cell'( B"1000", value_list );
    value_list := new value_cell'( B"0010", value_list );
    value_list := new value_cell'( B"0000", value_list );

    -- code from book:

    cell_to_be_deleted := value_list;
    value_list := value_list.next_cell;
    deallocate(cell_to_be_deleted);

    while value_list /= null loop
      cell_to_be_deleted := value_list;
      value_list := value_list.next_cell;
      deallocate(cell_to_be_deleted);
    end loop;

    -- end of code from book

    wait;
  end process;

end architecture test;
