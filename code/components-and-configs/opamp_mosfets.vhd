library cmos_lib;
use cmos_lib.bulk_cmos_nfet;

configuration opamp_mosfets of opamp is

  for struct -- architecture of opamp

    for m1, m2 : nfet
      use entity bulk_cmos_nfet(detailed);
    end for;

    for others : nfet
      use entity bulk_cmos_nfet(basic);
    end for;

    -- ...

  end for; -- end of architecture struct

end configuration opamp_mosfets;
