entity inline_04d is

end entity inline_04d;


----------------------------------------------------------------


architecture test of inline_04d is
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

    bus_stimulus := new stimulus_record;

    bus_stimulus.all := stimulus_record'(20 ns, B"0011");

    report time'image(bus_stimulus.all.stimulus_time);

    report time'image(bus_stimulus.stimulus_time);

    wait;
  end process;


end architecture test;
