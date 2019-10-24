library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_09a is

end entity inline_09a;


architecture test of inline_09a is

  -- code from book

  constant num_sensors : positive := 8;
  terminal sensors_raw,
           sensors_buffered : electrical_vector(num_sensors - 1 downto 0);
  -- ...

  -- end code from book

begin

  -- code from book

  buf_amps : entity work.multiple_opamp(ideal)
    generic map ( size => num_sensors,
                  gains => real_vector'(num_sensors - 1 downto 0 => 1.0) )
    port map ( sensors_raw, sensors_buffered );

  -- end code from book

end architecture test;
