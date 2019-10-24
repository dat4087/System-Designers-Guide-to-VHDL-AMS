entity inline_02a is

end entity inline_02a;


----------------------------------------------------------------


architecture test of inline_02a is
begin


  process is

    -- code from book:

    type stimulus_record is record
        stimulus_time : time;
        stimulus_value : real_vector(0 to 3);
      end record stimulus_record;

    type stimulus_ptr is access stimulus_record;

    variable bus_stimulus : stimulus_ptr;

    -- end of code from book

  begin

    -- code from book:

    bus_stimulus := new stimulus_record'( 20 ns, real_vector'(0.0, 5.0, 0.0, 42.0) );

    -- end of code from book

    wait;
  end process;


end architecture test;
