entity inline_05a is

end entity inline_05a;


architecture test of inline_05a is

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

  quantity v_in, v_amplified : real;
  constant gain : real := 10.0;
  constant v_neg : real := -10.0;
  constant v_pos : real := 10.0;
  
begin

  -- code from book

  v_amplified == limited ( gain * v_in, v_neg, v_pos );

  -- end code from book

end architecture test;
