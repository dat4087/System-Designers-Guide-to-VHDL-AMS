entity inline_17a is

end entity inline_17a;


----------------------------------------------------------------


library ieee_proposed;  use ieee_proposed.electrical_systems.all;

architecture test of inline_17a is

  -- code from book:

  nature electrical_bus is record
      strobe : electrical;
      bus_lines : electrical_vector(0 to 15);
    end record electrical_bus;

  terminal address_bus, data_bus : electrical_bus;
  
  quantity data_voltages across data_currents through data_bus;

  -- end of code from book

begin
end architecture test;
