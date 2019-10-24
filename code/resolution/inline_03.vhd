library ieee;  use ieee.std_logic_1164.all;

entity IO_section is
  port ( data_ack : inout std_logic;  -- . . . );
  -- not in book
         other_port : in std_ulogic := 'U' );
  -- end not in book
end entity IO_section;
