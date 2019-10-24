library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity mixer is
  port ( terminal inputs : electrical_vector(1 to 8);
         terminal output : electrical );
end entity mixer;

----------------------------------------------------------------

architecture weighted of mixer is
  
  quantity v_in across inputs;
  quantity v_out across i_out through output;
  constant gains : real_vector(1 to 8)
    := ( 0.01, 0.04, 0.15, 0.30, 0.03, 0.15, 0.04, 0.01 );
  
begin
  
  apply_weights : procedural is
    variable sum : real := 0.0;
  begin
    for index in v_in'range loop
      sum := sum + v_in(index) * gains(index);
    end loop;
    v_out := sum;
  end procedural apply_weights;
        
end architecture weighted;
