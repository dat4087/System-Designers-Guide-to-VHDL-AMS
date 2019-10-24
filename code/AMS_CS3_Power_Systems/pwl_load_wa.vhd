library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity pwl_load_wa is
  generic ( load_enable : boolean := true;
            res_init : resistance;
            res1 : resistance;                  
            t1 : time;
            res2 : resistance;
            t2 : time );
  port ( terminal p1, p2 : electrical );
end entity pwl_load_wa;

----------------------------------------------------------------

architecture ideal of pwl_load_wa is

  quantity v across i through p1 to p2;
  signal res_signal : resistance := res_init;

begin

  if load_enable use
    if domain = quiescent_domain or domain = frequency_domain use
       v == i * res_init; 
    else 
      v == i * res_signal'ramp(1.0e-6, 1.0e-6);
    end use;
  else 
    i == 0.0;
  end use;

  create_event: process is
  begin
    wait for t1;
    res_signal <= res1;
    wait for t2 - t1;
    res_signal <= res2;
    wait;
  end process create_event; 

end architecture ideal;
