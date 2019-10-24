entity limit is
end entity limit;



architecture test of limit is

  -- code from book

  function limit ( value, min, max : integer ) return integer is
  begin
    if value > max then
      return max;
    elsif value < min then
      return min;
    else
      return value;
    end if;
  end function limit;

  -- end code from book

begin

  tester : process is

    variable new_temperature, current_temperature, increment : integer;
    variable new_motor_speed, old_motor_speed,
             scale_factor, error : integer;

  begin

    current_temperature := 75;
    increment := 10;

    -- code from book (in text)

    new_temperature := limit ( current_temperature + increment, 10, 100 );

    -- end code from book

    increment := 60;
    new_temperature := limit ( current_temperature + increment, 10, 100 );
    increment := -100;
    new_temperature := limit ( current_temperature + increment, 10, 100 );

    old_motor_speed := 1000;
    scale_factor := 5;
    error := 5;

    -- code from book (in text)

    new_motor_speed := old_motor_speed
                       + scale_factor * limit ( error, -10, +10 );

    -- end code from book

    error := 15;
    new_motor_speed := old_motor_speed
                       + scale_factor * limit ( error, -10, +10 );

    error := -20;
    new_motor_speed := old_motor_speed
                       + scale_factor * limit ( error, -10, +10 );

    wait;
  end process tester;

end architecture test;
