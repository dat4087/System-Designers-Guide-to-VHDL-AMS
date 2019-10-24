library cmos_lib;  use cmos_lib.bulk_cmos_nfet;

configuration full of notch_filter is
  
  for opamp_based  -- architecture of notch_filter
  
    for all : simple_opamp
      use entity work.opamp(struct);

      for struct  -- architecture of opamp
  
        for m1, m2 : nfet
          use entity bulk_cmos_nfet(detailed);
        end for;

        for others : nfet
          use entity bulk_cmos_nfet(basic);
        end for;

        -- ...
  
      end for;  -- end of architecture struct

    end for;

    -- ...  -- bindings for other component instances
  
  end for;  -- end of architecture opamp_based

end configuration full;
