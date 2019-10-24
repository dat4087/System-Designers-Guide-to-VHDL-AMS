library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity opamp is
  port ( terminal positive_supply, negative_supply : electrical;
         terminal plus_in, minus_in, output : electrical );
end entity opamp;

----------------------------------------------------------------

architecture saturating of opamp is
  
  constant gain : real := 50.0;
  quantity v_pos across positive_supply;
  quantity v_neg across negative_supply;
  quantity v_in across plus_in to minus_in;
  quantity v_out across i_out through output;
  quantity v_amplified : voltage;
  
begin
  
  if v_in'above(v_pos / gain) use 
    v_amplified == v_pos;
  elsif not v_in'above(v_neg / gain) use
    v_amplified == v_neg;
  else 
    v_amplified == gain * v_in;
  end use;
        
  break on v_in'above(v_pos/gain), v_in'above(v_neg/gain);
        
  v_out == v_amplified'slew(1.0e6,-1.0e6);
        
end architecture saturating;
