library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_03a is

end entity inline_03a;


architecture test of inline_03a is

  -- code from book

  nature electrical_bus is
    record
      strobe : electrical;
      databus : electrical_vector(0 to 7);
    end record;
  terminal ebus : electrical_bus;
  quantity bus_voltages across ebus to ground;

  --

  alias e_strobe is bus_voltages.strobe;
  alias e_data is bus_voltages.databus;

  -- end code from book

begin

end architecture test;
