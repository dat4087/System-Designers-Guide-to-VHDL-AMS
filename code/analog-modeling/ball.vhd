library ieee_proposed;  use ieee_proposed.mechanical_systems.all;
                        
entity ball is
end entity ball;

----------------------------------------------------------------

architecture bouncer of ball is
  quantity v : velocity := 0.0;
  quantity s : displacement := 10.0;
  constant g : real := 9.81;
  constant air_res : real := 0.1;
begin
  
  if v'above(0.0) use
    v'dot == -g - v**2*air_res;
  else
    v'dot == -g + v**2*air_res;
  end use;
        
  reversal_tester : process is
  begin
    wait on s'above(0.0);
    break v => -v when s < 0.0;
  end process reversal_tester;
        
  s'dot == v;
        
end architecture bouncer;
