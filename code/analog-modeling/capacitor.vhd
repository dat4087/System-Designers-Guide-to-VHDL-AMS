library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity capacitor is 
  port ( terminal node1, node2 : electrical );
end entity capacitor;

architecture leakage of capacitor is
  constant c : real := 1.0E-6;
  constant r_leak : real := 10.0E6;
  quantity v_cap across i_cap, i_leak through node1 to node2;
begin
  i_cap == c * v_cap'dot; 
  i_leak == v_cap / r_leak;
end architecture leakage;
