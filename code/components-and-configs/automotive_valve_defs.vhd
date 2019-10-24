library ieee_proposed;
use ieee_proposed.fluidic_systems.all, ieee_proposed.mechanical_systems.all;

package automotive_valve_defs is
  
  subnature valve_fluidic is fluidic
    tolerance "valve_pressure" across "valve_vflow_rate" through;

  subnature valve_translational is translational
    tolerance "valve_displacement" across "valve_force" through;

  -- ...  -- other useful declarations
  
  component automotive_valve is
    port ( terminal p1, p2 : valve_fluidic;
           terminal control : valve_translational );
  end component automotive_valve;

end package automotive_valve_defs;
