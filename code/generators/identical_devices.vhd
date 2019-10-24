library device_lib;

configuration identical_devices of led_bar_display is

  for device_level

    for device_array

      for limiting_resistor : resistor
        use entity device_lib.resistor(ideal);
      end for;

      for segment_led : led
        use entity device_lib.led(ideal);
      end for;

    end for;

  end for;

end configuration identical_devices;
