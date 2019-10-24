entity inline_02d is

end entity inline_02d;


----------------------------------------------------------------


architecture test of inline_02d is
begin


  process is

    -- code from book:

    type stimulus_record is record
        stimulus_time : time;
        stimulus_value : bit_vector(0 to 3);
      end record stimulus_record;

    type stimulus_ptr is access stimulus_record;

    variable bus_stimulus : stimulus_ptr;

    -- end of code from book

  begin

    -- code from book:

    bus_stimulus := new stimulus_record'( 20 ns, B"0011" );

    -- end of code from book

    wait;
  end process;


end architecture test;
