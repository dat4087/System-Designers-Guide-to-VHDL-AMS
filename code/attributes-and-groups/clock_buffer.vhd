package constraints is

  -- code from book (in text)

  group port_pair is ( signal, signal );

  attribute max_prop_delay : time;

  -- end code from book

end package constraints;



-- code from book

library ieee;  use ieee.std_logic_1164.all;
use work.constraints.port_pair, work.constraints.max_prop_delay;

entity clock_buffer is
  port ( clock_in : in std_logic;
         clock_out1, clock_out2, clock_out3 : out std_logic );

  group clock_to_out1 : port_pair ( clock_in, clock_out1 );
  group clock_to_out2 : port_pair ( clock_in, clock_out2 );
  group clock_to_out3 : port_pair ( clock_in, clock_out3 );

  attribute max_prop_delay of clock_to_out1 : group is 2 ns;
  attribute max_prop_delay of clock_to_out2 : group is 2 ns;
  attribute max_prop_delay of clock_to_out3 : group is 2 ns;

end entity clock_buffer;

-- end code from book
