library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity capacitor is
  generic ( cap : capacitance;
            r_esr : resistance := 0.0;
            v_ic : voltage := real'low );
  port ( terminal p1, p2 : electrical );
end entity capacitor;

----------------------------------------------------------------

architecture esr of capacitor is
  
  quantity v across i through p1 to p2;
  quantity vc : voltage;  -- Internal voltage across capacitor
  
begin
  
  if domain = quiescent_domain and v_ic /= real'low use
    vc == v_ic;
    i == 0.0;
  else
    vc == v - (i * r_esr); 
    i == cap * vc'dot;
  end use;
  
end architecture esr;
