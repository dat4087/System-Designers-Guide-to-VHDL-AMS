configuration inline_01d of reg4 is

  for struct

    -- code from book (in text)

    for bit0, bit1 : flipflop
      use entity work.edge_triggered_Dff(basic);
    end for;

    -- end code from book

  end for;

end configuration inline_01d;
