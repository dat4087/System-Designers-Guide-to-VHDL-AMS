library star_lib;
use star_lib.edge_triggered_Dff;

configuration reg4_gate_level of reg4 is

  for struct  -- architecture of reg4

    for bit0 : flipflop
      use entity edge_triggered_Dff(hi_fanout);
    end for;

    for others : flipflop
      use entity edge_triggered_Dff(basic);
    end for;

  end for;  -- end of architecture struct

end configuration reg4_gate_level;
