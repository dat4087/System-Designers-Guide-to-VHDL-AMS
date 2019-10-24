package physical_attributes is

  -- code from book (in text)

  attribute layout_ignore : boolean;
  attribute pin_number : positive;

  -- end code from book

end package physical_attributes;


-- code from book

library ieee;  use ieee.std_logic_1164.all;
use work.physical_attributes.all;

entity \74x138\ is
  generic ( Tpd : time );
  port ( en1, en2a_n, en2b_n : in std_logic;
         s0, s1, s2 : in std_logic;
         y0, y1, y2, y3, y4, y5, y6, y7 : out std_logic );

  attribute layout_ignore of Tpd : constant is true;

  attribute pin_number of s0 : signal is 1;
  attribute pin_number of s1 : signal is 2;
  attribute pin_number of s2 : signal is 3;
  attribute pin_number of en2a_n : signal is 4;
  -- . . .

end entity \74x138\;

-- code from book
