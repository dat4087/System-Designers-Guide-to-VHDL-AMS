-- not in book

use work.serial_interface_defs.all;

entity microcontroller is
end entity microcontroller;

-- end not in book



library ieee;  use ieee.std_logic_1164.all;

architecture structure of microcontroller is

  use work.serial_interface_defs.serial_interface;

  -- . . .    -- declarations of other components, signals, etc

  -- not in book
  signal buffered_phi1, buffered_phi2, serial_a_select : std_logic;
  signal internal_addr : std_logic_vector(1 downto 0);
  signal internal_data_bus : data_vector;
  signal serial_a_int_req, rx_data_a, tx_data_a : std_logic;
  -- end not in book

begin

  serial_a : component serial_interface
    port map ( clock_phi1 => buffered_phi1,
               clock_phi2 => buffered_phi2,
               serial_select => serial_a_select,
               reg_address => internal_addr(1 downto 0),
               data => internal_data_bus,
               interrupt_request => serial_a_int_req,
               rx_serial_data => rx_data_a,
               tx_serial_data => tx_data_a );

  -- . . .    -- other component instances

end architecture structure;
