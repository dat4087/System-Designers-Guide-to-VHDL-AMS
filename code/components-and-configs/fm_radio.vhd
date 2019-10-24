-- not in book

library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity fm_radio is
end entity fm_radio;

-- end not in book



architecture top_level of fm_radio is

  terminal left_decoded, left_filtered : electrical;
  terminal right_decoded, right_filtered : electrical;
  -- ...

begin

  left_pilot_filter : configuration work.notch_filter_down_to_device_level
    port map ( input => left_decoded, output => left_filtered,
               vdd => vdd, vss => vss, gnd => gnd );

  -- ...

end architecture top_level;
