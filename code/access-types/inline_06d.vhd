entity inline_06d is

end entity inline_06d;


----------------------------------------------------------------


architecture test of inline_06d is
begin


  process is

    -- code from book:

    type value_cell is record
        value : bit_vector(0 to 3);
        next_cell : value_ptr;
      end record value_cell;

    type value_ptr is access value_cell;

    -- end of code from book

  begin

    wait;
  end process;


end architecture test;
