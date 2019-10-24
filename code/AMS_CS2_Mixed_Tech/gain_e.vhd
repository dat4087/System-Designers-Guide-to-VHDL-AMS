library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity gain_e is
  generic ( k : real := 1.0);  -- gain multiplier
  port ( terminal input : electrical;
         terminal output : electrical );
end entity gain_e;

----------------------------------------------------------------

architecture simple of gain_e is

  quantity vin across input to electrical_ref;
  quantity vout across iout through output to electrical_ref;

begin

  vout == k * vin;

end architecture simple;
