-- code from book

library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity adc_with_ref is
  port ( quantity v_in : in voltage;
         signal d_out : out bit;
         quantity v_ref : in voltage := 1.0 );
end entity adc_with_ref;

-- end code from book


architecture signal_flow of adc_with_ref is
begin
end architecture signal_flow;



library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_17a is

end entity inline_17a;


architecture test of inline_17a is

begin

  block_1 : block is

    quantity sensor_in : voltage;
    signal sensor_data_out : bit;

  begin
    
    sensor_in == 5.0;

    -- code from book

    default_adc : entity work.adc_with_ref(signal_flow)
      port map ( sensor_in, sensor_data_out );

    -- end code from book

  end block block_1;


  block_2 : block is

    quantity sensor_in : voltage;
    signal sensor_data_out : bit;
    constant v_supply : voltage := 10.0;

  begin
    
    sensor_in == 5.0;

    -- code from book

    fixed_adc : entity work.adc_with_ref(signal_flow)
      port map ( sensor_in, sensor_data_out, v_ref => v_supply / 2.0 );

    -- end code from book

  end block block_2;

end architecture test;
