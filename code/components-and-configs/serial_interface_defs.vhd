library ieee;  use ieee.std_logic_1164.all;

package serial_interface_defs is

  subtype reg_address_vector is std_logic_vector(1 downto 0);

  constant status_reg_address : reg_address_vector := B"00";
  constant control_reg_address : reg_address_vector := B"01";
  constant rx_data_register : reg_address_vector := B"10";
  constant tx_data_register : reg_address_vector := B"11";

  subtype data_vector is std_logic_vector(7 downto 0);

  -- . . .    -- other useful declarations

  component serial_interface is
    port ( clock_phi1, clock_phi2 : in std_logic;
           serial_select : in std_logic;
           reg_address : in reg_address_vector;
           data : inout data_vector;
           interrupt_request : out std_logic;
           rx_serial_data : in std_logic;
           tx_serial_data : out std_logic );
  end component serial_interface;

end package serial_interface_defs;
