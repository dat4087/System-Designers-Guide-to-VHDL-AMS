entity gain is
  generic ( k : real := 1.0 );  -- gain multiplier
  port ( quantity input : in real;
         quantity output : out real );
end entity gain;

----------------------------------------------------------------

architecture simple of gain is
begin

  output == k * input;

end architecture simple;
