library star_lib;
use star_lib.edge_triggered_Dff;

configuration full of counter is

  for registered  -- architecture of counter

    for all : digit_register
      use entity work.reg4(struct);

      for struct  -- architecture of reg4

        for bit0 : flipflop
          use entity edge_triggered_Dff(hi_fanout);
        end for;

        for others : flipflop
          use entity edge_triggered_Dff(basic);
        end for;

      end for;  -- end of architecture struct

    end for;

    -- . . .    -- bindings for other component instances

  end for;  -- end of architecture registered

end configuration full;
