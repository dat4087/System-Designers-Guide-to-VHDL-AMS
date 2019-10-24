configuration inline_02a of opamp is

  for struct

    -- code from book (in text)

    for m1, m2 : nfet
      use entity work.bulk_cmos_nfet(basic);
    end for;

    -- end code from book

  end for;

end configuration inline_02a;
