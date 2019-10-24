library ieee_proposed;  use ieee_proposed.mechanical_systems.all;
use ieee_proposed.fluidic_systems.all;

entity inline_04a is

end entity inline_04a;


----------------------------------------------------------------


architecture test of inline_04a is

  -- code from book:
        
  type engine_nodes is (intake, compressor, combustion, exhaust);
  type engines is range 1 to 4;
  nature aircraft_engine_flows is array (engine_nodes, engines) of fluidic;
        
  --

  nature sensor_matrix is array (1 to 100, 1 to 100) of translational;
  
  --

  terminal sensor_grid : sensor_matrix;
  
  --

  quantity sensor_data across sensor_grid to translational_ref;

  -- end of code from book

begin


  process_1_b : process is
    variable total_displacement, average_displacement : real;
  begin

    -- code from book:
    
    total_displacement := 0.0;
    for x in 1 to 100 loop
      for y in 1 to 100 loop
        total_displacement := total_displacement + sensor_data(x, y);
      end loop;
    end loop;
    average_displacement := total_displacement / 10000.0;
    
    --end code from book

    wait;
  end process process_1_b;


end architecture test;
