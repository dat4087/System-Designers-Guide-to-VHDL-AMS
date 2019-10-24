library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity multiple_opamp is
  generic ( size : positive;
            gains : real_vector );
  port ( terminal inputs, outputs : electrical_vector(1 to size) );
end entity multiple_opamp;

----------------------------------------------------------------

architecture ideal of multiple_opamp is
  
  quantity v_in across i_in through inputs to electrical_ref;
  quantity v_out across outputs to electrical_ref;
  alias gains_alias : real_vector(1 to size) is gains;
        
begin
  
  assert gains'length = size
    report "gains vector size differs from input/output size";
        
  amplify : procedural is
  begin
    for index in 1 to size loop
      v_out(index) := v_in(index) * gains_alias(index);
    end loop;
  end procedural amplify;
        
end architecture ideal;
