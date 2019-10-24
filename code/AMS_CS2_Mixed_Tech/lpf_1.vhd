entity lpf_1 is
  generic ( fp : real; 		   -- pole freq in hertz
            gain : real := 1.0 );  -- filter gain
  port ( quantity input : in real;
         quantity output : out real);
end entity lpf_1;

----------------------------------------------------------------

library ieee;  use ieee.math_real.all;

architecture simple of lpf_1 is

  constant wp : real := math_2_pi*fp;
  constant num : real_vector := (0 => wp * gain);  -- "0 =>" is needed to give
                                                   -- vector index when only
                                                   -- a single element is used.
  constant den : real_vector := (wp, 1.0);

begin

  output == input'ltf(num, den);

end architecture simple;
