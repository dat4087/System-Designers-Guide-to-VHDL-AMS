library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_08a is

end entity inline_08a;


architecture test of inline_08a is

  -- code from book

  terminal bias_node : electrical;

  --

  subnature accurate_electrical is electrical
    tolerance "accurate_voltage" across "accurate_current" through;

  --

  terminal n1, n2 : accurate_electrical;

  --

  quantity n1_n2_voltage across n1_n2_current through n1 to n2;

  --

  quantity internal_voltage : voltage tolerance n1_n2_voltage'tolerance;
  quantity internal_current : current tolerance n1_n2_current'tolerance;

  --

  terminal bus_a_end, bus_b_end : electrical_vector(15 downto 0);
  quantity bus_currents through bus_a_end to bus_b_end;

  -- end code from book

begin

  -- code from book

  bias_node'reference == 0.5;

  -- end code from book
  
end architecture test;
