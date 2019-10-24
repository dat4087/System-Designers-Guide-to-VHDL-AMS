library ieee_proposed;
use ieee_proposed.electrical_systems.all, ieee_proposed.thermal_systems.all;

entity resistor_pack is
  generic ( resistances_at_298K : real_vector;
            temperature_coeff : real := 0.0 );
  port ( terminal p1, p2 : electrical_vector(1 to resistances_at_298K'length);
         quantity package_temp : in temperature );
end entity resistor_pack;

----------------------------------------------------------------

architecture coupled of resistor_pack is

  quantity v across i through p1 to p2;
  quantity effective_resistance : real_vector(1 to resistances_at_298K'length);

begin

  resistor_array : for index in 1 to resistances_at_298K'length generate

    effective_resistance(index)
      == resistances_at_298K(index)
          + ( package_temp - 298.0 ) * temperature_coeff;

    v(index ) == i(index) * effective_resistance(index);

  end generate resistor_array;

end architecture coupled;
