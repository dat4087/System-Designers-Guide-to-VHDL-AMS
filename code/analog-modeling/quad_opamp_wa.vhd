library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity quad_opamp_wa is
  port (terminal n1, n2, output : electrical_vector(1 to 4));
end entity quad_opamp_wa ;

----------------------------------------------------------------

architecture slew_limited of quad_opamp_wa is
  
  quantity vin across n1 to n2;
  quantity vout across iout through output;
  quantity vamp1 : real;
  quantity vamp2 : real;
  quantity vamp3 : real;
  quantity vamp4 : real;
  constant gain : real := 50.0;
        
begin

  vamp1 == gain*vin(1);	
  vamp2 == gain*vin(2);
  vamp3 == gain*vin(3);
  vamp4 == gain*vin(4);

  vout(1) == vamp1'slew(1.0e6,-1.0e6);
  vout(2) == vamp2'slew(1.0e6,-1.0e6);
  vout(3) == vamp3'slew(1.0e6,-1.0e6);
  vout(4) == vamp4'slew(1.0e6,-1.0e6);

end architecture slew_limited ;
