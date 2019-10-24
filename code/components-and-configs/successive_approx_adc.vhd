library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity successive_approx_adc is
  generic ( t_setup, t_hold, t_pd : delay_length;
            width : positive );
  port ( terminal analog_in : electrical;
         signal clock : in std_logic;
         signal start : in std_logic;
         signal eoc : out std_logic;
         signal data_out : out std_logic_vector(0 to width - 1) );
end entity successive_approx_adc;


-- not in book

architecture struct of successive_approx_adc is

begin

end architecture struct;
