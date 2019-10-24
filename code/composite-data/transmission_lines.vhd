-- not in book

library ieee_proposed;  use ieee_proposed.electrical_systems.all;

package transmission_lines_types is

  type word is array (0 to 31) of bit;

  subtype bus_lines is integer range 0 to 31;
  nature electrical_bus is array (bus_lines) of electrical;

end package transmission_lines_types;



library ieee_proposed;  use ieee_proposed.electrical_systems.all;

use work.transmission_lines_types.all;

-- end not in book

entity transmission_lines is
  port ( terminal data_bus : electrical_bus;
         signal clk : in bit;  signal data_out : out word );
end entity transmission_lines;

----------------------------------------------------------------

architecture abstract of transmission_lines is
  constant threshold : voltage := 1.5;
  quantity bus_voltages across bus_currents through
           data_bus to electrical_ref;
begin
  
  logic_value_maps : process (clk) is
  begin
    if clk = '1' then
      for index in bus_lines loop
        if bus_voltages(index) > threshold then
          data_out(index) <= '1';
        else
          data_out(index) <= '0';
        end if;
      end loop;
    end if;
  end process logic_value_maps;
  
  -- additional VHDL-AMS code to describe reflections and attenuation
  -- ...
  
end architecture abstract;
