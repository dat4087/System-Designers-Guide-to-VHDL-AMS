configuration notch_filter_down_to_device_level of notch_filter is
  
  for opamp_based
  
    for all : simple_opamp
      use configuration work.opamp_mosfets;
    end for;

    -- ...  -- bindings for other component instances
  
  end for;  -- end of architecture opamp_based

end configuration notch_filter_down_to_device_level;
