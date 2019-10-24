library ieee;  use ieee.std_logic_1164.all;

entity reg is
  generic ( t_setup, t_hold, t_pd : delay_length;
            width : positive );
  port ( clock : in std_logic;
         reset_n : in std_logic := 'H';
         data_in : in std_logic_vector(0 to width - 1);
         data_out : out std_logic_vector(0 to width - 1) );
end entity reg;



-- not in book

architecture gate_level of reg is

begin

  store : process (clock, reset_n) is
  begin
    if reset_n = '0' or reset_n = 'L' then
      data_out <= (others => '0') after t_pd;
    elsif rising_edge(clock) then
      data_out <= data_in after t_pd;
    end if;
  end process store;

end architecture gate_level;

-- end not in book
