entity limited is
end entity limited;



architecture test of limited is

  -- code from book

  function limited ( value, min, max : real ) return real is
  begin
    if value > max then
      return max;
    elsif value < min then
      return min;
    else
      return value;
    end if;
  end function limited;

  -- end code from book

begin

  tester : process is

    variable new_temperature, current_temperature, increment : real;
    variable new_motor_speed, old_motor_speed,
             scale_factor, error : real;

  begin

    current_temperature := 75.0;
    increment := 10.0;

    -- code from book (in text)

    new_temperature := limited ( current_temperature + increment, 10.0, 100.0 );

    -- end code from book

    increment := 60.0;
    new_temperature := limited ( current_temperature + increment, 10.0, 100.0 );
    increment := -100.0;
    new_temperature := limited ( current_temperature + increment, 10.0, 100.0 );

    old_motor_speed := 1000.0;
    scale_factor := 5.0;
    error := 5.0;

    -- code from book (in text)

    new_motor_speed := old_motor_speed
                       + scale_factor * limited ( error, -10.0, +10.0 );

    -- end code from book

    error := 15.0;
    new_motor_speed := old_motor_speed
                       + scale_factor * limited ( error, -10.0, +10.0 );

    error := -20.0;
    new_motor_speed := old_motor_speed
                       + scale_factor * limited ( error, -10.0, +10.0 );

    wait;
  end process tester;

end architecture test;
