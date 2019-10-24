configuration sensor_interface_with_timing of sensor_interface is

  for structural

    for sensor_adc : adc
      use entity work.successive_approx_adc(struct)
        generic map ( t_setup => 200 ps, t_hold => 150 ps, t_pd => 150 ps,
                      width => width );
    end for;

    -- ...

  end for;

end configuration sensor_interface_with_timing;
