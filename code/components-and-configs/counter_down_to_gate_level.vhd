configuration counter_down_to_gate_level of counter is

  for registered

    for all : digit_register
      use configuration work.reg4_gate_level;
    end for;

    -- . . .    -- bindings for other component instances

  end for;  -- end of architecture registered

end configuration counter_down_to_gate_level;
