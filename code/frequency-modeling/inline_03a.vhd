library ieee_proposed;  use ieee_proposed.electrical_systems.all;
library ieee;  use ieee.math_real.all;
               
entity inline_03a is

end entity inline_03a;


architecture test of inline_03a is

  -- code from book

  constant fp : real := 10.0;            -- filter pole in hertz
  constant wp : real := math_2_pi * fp;  -- filter pole in rad/s
  constant tp : real := 1.0 / wp;        -- filter time constant

  -- end code from book

begin
end architecture test;
