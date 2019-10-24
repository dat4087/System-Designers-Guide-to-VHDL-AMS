entity limiter is
  generic ( limit_high : real := 4.8;	 -- upper limit
            limit_low : real := -4.8 );  -- lower limit
  port ( quantity input : in real;
         quantity output : out real);					
end entity limiter;

----------------------------------------------------------------

architecture simple of limiter is
  constant slope : real := 1.0e-4;
begin

  if input > limit_high use    -- upper limit exceeded, so limit input signal
    output == limit_high + slope*(input - limit_high);
  elsif input < limit_low use  -- lower limit exceeded, so limit input signal
    output == limit_low + slope*(input - limit_low);
  else		               -- no limit exceeded, so pass input signal as is
    output == input;
  end use;

  break on input'above(limit_high), input'above(limit_low);

end architecture simple;
