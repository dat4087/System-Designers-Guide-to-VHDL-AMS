library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity mixer_wa is
  port ( terminal inputs : electrical_vector(1 to 8);
         terminal output : electrical );
end entity mixer_wa;

----------------------------------------------------------------

architecture weighted of mixer_wa is
  
  quantity v_in across inputs;
  quantity v_out across i_out through output;
  quantity v1, v2, v3, v4, v5, v6, v7, v8 : real;
  constant gains : real_vector(1 to 8)
    := ( 0.01, 0.04, 0.15, 0.30, 0.03, 0.15, 0.04, 0.01 );
        
begin
  
	v1 == v_in(1) * gains(1);
	v2 == v_in(2) * gains(2);
	v3 == v_in(3) * gains(3);
	v4 == v_in(4) * gains(4);
	v5 == v_in(5) * gains(5);
	v6 == v_in(6) * gains(6);
	v7 == v_in(7) * gains(7);
	v8 == v_in(8) * gains(8);
        
	v_out == v1 + v2 + v3 + v4 + v5 + v6 + v7 + v8;
        
end architecture weighted;
