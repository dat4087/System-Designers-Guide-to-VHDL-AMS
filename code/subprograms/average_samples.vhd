entity average_sample is
end entity average_sample;



architecture test of average_sample is

  procedure average_test is
    
    variable average : real := 0.0;
    type sample_array is array (positive range <>) of real;
    constant samples : sample_array :=
      ( 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0 );

    -- code from book
  
    procedure average_samples is
      variable total : real := 0.0;
    begin
      assert samples'length > 0 severity failure;
      for index in samples'range loop
        total := total + samples(index);
      end loop;
      average := total / real(samples'length);
    end procedure average_samples;
  
    -- end code from book

  begin

    -- code from book (in text)

    average_samples;

    -- end code from book

  end procedure average_test;

  
begin

  average_test;

end architecture test;
