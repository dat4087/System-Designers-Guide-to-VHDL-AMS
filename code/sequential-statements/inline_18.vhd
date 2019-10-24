entity inline_18 is

end entity inline_18;


----------------------------------------------------------------


architecture test of inline_18 is
begin


  process_5_a : process is

    constant initial_value : natural := 10;
    constant max_value : natural := 8;
    constant current_character : character := 'A';
    constant input_string : string := "012ABC";
    constant free_memory : natural := 0;
    constant low_water_limit : natural := 1024;
    constant packet_length : natural := 0;
    constant clock_pulse_width : delay_length := 10 ns;
    constant min_clock_width : delay_length := 20 ns;
    constant last_position : natural := 10;
    constant first_position : natural := 5;
    constant number_of_entries : natural := 0;

  begin

    -- code from book:

    assert initial_value <= max_value;

    --

    assert initial_value <= max_value
      report "initial value too large";

    --

    assert current_character >= '0' and current_character <= '9'
      report "Input number " & input_string & " contains a non-digit";

    --

    assert free_memory >= low_water_limit
      report "low on memory, about to start garbage collect"
      severity note;

    --

    assert packet_length /= 0
      report "empty network packet received"
      severity warning;

    --

    assert clock_pulse_width >= min_clock_width
      severity error;

    --

    assert (last_position - first_position + 1) = number_of_entries
      report "inconsistency in buffer model"
      severity failure;

    -- end of code from book

    wait;
  end process process_5_a;


end architecture test;
