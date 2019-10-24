library ieee;  use ieee.std_logic_1164.all;

package stimulus_types is

  constant stimulus_vector_length : positive := 10;

  type stimulus_element is record
      application_time : delay_length;
      pattern : std_logic_vector(0 to stimulus_vector_length - 1);
    end record stimulus_element;

  function stimulus_key ( stimulus : stimulus_element ) return delay_length;

end package stimulus_types;

----------------------------------------------------------------

package body stimulus_types is

  function stimulus_key ( stimulus : stimulus_element ) return delay_length is
  begin
    return stimulus.application_time;
  end function stimulus_key;

end package body stimulus_types;
