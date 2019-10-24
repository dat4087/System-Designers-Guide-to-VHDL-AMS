library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity lowpass is
  port ( terminal input : electrical;
         terminal output : electrical );
end entity lowpass;

----------------------------------------------------------------

architecture dot of lowpass is

  quantity vin across input to electrical_ref;
  quantity vout across iout through output to electrical_ref;
  constant tp : real := 15.9e-3;  -- filter time constant

begin

  vin == vout + tp * vout'dot;

end architecture dot; 
