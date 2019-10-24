-- not in book

library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity sensor_interface is

end entity sensor_interface;

-- end not in book



architecture structural of sensor_interface is
  
  component adc is
    generic ( width : positive );
    port ( terminal analog_in : electrical;
           signal clock : in std_logic;
           signal start : in std_logic;
           signal eoc : out std_logic;
           signal data_out : out std_logic_vector(0 to width - 1) );
  end component adc;

  -- ...

  -- not in book
  terminal sensor_input : electrical;
  signal clk, start_conversion, end_conversion : std_logic;
  signal sensor_data : std_logic_vector(0 to 7);
  -- end not in book
  
begin
  
  sensor_adc : component adc
    generic map ( width => sensor_data'length )
    port map ( analog_in => sensor_input,
               clock => clk,
               start => start_conversion,
               eoc => end_conversion,
               data_out => sensor_data );

  -- ...
  
end architecture structural;
