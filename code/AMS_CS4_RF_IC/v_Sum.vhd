library IEEE_proposed;  use IEEE_proposed.electrical_systems.all;

entity v_Sum is
  generic ( k1 : real := 1.0;
            k2 : real := -1.0 );
  port ( terminal in1, in2 : electrical;
         terminal output : electrical );
end entity v_Sum;

----------------------------------------------------------------

architecture behavioral of v_Sum is

  quantity vin1 across in1 to electrical_ref;
  quantity vin2 across in2 to electrical_ref;
  quantity vout across iout through output to electrical_ref;

begin

  vout == k1 * vin1 + k2 * vin2;

end architecture behavioral;
