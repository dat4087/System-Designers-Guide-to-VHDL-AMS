library ieee;  use ieee.std_logic_1164.all;

use work.serial_interface_defs.all;

entity serial_interface is
  port ( clock_phi1, clock_phi2 : in std_logic;
         serial_select : in std_logic;
         reg_address : in reg_address_vector;
         data : inout data_vector;
         interrupt_request : out std_logic;
         rx_serial_data : in std_logic;
         tx_serial_data : out std_logic );
end entity serial_interface;


-- not in book

architecture test of serial_interface is
begin
end architecture test;

-- end not in book
