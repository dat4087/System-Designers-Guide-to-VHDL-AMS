library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity amp_lim is
  port ( terminal ps : electrical;               -- positive supply terminal
         terminal input, output : electrical );
end entity amp_lim;

----------------------------------------------------------------

architecture simple of amp_lim is

  quantity v_pwr across i_pwr through ps to electrical_ref;
  quantity vin across iin through input to electrical_ref;
  quantity vout across iout through output to electrical_ref;
  quantity v_amplified : voltage ;
  constant gain : real := 1.0;

begin

  v_amplified == gain * vin;

  if v_amplified'above(v_pwr) use 
    vout == v_pwr;
  else 
    vout == v_amplified;
  end use;

  break on v_amplified'above(v_pwr);

  -- ignore loading effects
  i_pwr == 0.0;
  iin == 0.0;

end architecture simple;
