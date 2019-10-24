entity inline_04a is

end entity inline_04a;


----------------------------------------------------------------


architecture test of inline_04a is
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

    bus_stimulus := new stimulus_record;

    bus_stimulus.all := stimulus_record'(20 ns, real_vector'(0.0, 5.0, 0.0, 42.0) );

    report time'image(bus_stimulus.all.stimulus_time);

    report time'image(bus_stimulus.stimulus_time);

    wait;
  end process;


end architecture test;
