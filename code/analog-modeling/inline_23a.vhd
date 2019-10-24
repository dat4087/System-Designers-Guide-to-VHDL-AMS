library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_23a is

end entity inline_23a;


architecture test of inline_23a is

  signal digital_level : integer;
  constant num_levels : integer := 63;
  constant max_voltage : real := 10.0;
  
begin

  block_1 : block is

    quantity analog_voltage : real;

  begin
    
    -- code from book

    analog_voltage == real(digital_level) / real(num_levels) * max_voltage;

    -- end code from book

  end block block_1;


  block_2 : block is

    signal real_digital_level : real;
    quantity analog_voltage : real;

  begin
    
    -- code from book

    real_digital_level <= real(digital_level);
    analog_voltage == real_digital_level'ramp(1.0E-6) / real(num_levels) * max_voltage;

    -- end code from book

  end block block_2;


end architecture test;
