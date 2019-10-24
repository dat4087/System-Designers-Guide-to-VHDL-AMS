library ieee;  use ieee.std_logic_1164.all;

entity reg is
  generic ( t_setup, t_hold, t_pd : delay_length;
            width : positive );
  port ( clock : in std_logic;
         data_in : in std_logic_vector(0 to width - 1);
         data_out : out std_logic_vector(0 to width - 1) );
end entity reg;



-- not in book

architecture gate_level of reg is
begin
end architecture gate_level;

-- end not in book
