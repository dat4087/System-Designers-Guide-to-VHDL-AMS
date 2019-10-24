entity sum2 is
  generic ( k1, k2 : real := 1.0 );  	-- Optional gain multipliers
  port ( quantity in1, in2 : in real;	-- Input quantity ports
         quantity output : out real );	-- Output quantity port
end entity sum2;

architecture simple of sum2 is
begin
  output == k1 * in1 + k2 * in2;  -- Sum of inputs (with optional gain)
end architecture simple;
