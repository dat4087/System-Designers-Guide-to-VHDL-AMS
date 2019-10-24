configuration interlock_control_with_estimates of interlock_control is

  for detailed_timing

  end for;

  -- . . .

end configuration interlock_control_with_estimates;

--------------------------------------------------

configuration interlock_control_with_actual of interlock_control is

  for detailed_timing

    for ex_interlock_gate : nor_gate
      generic map ( Tpd01 => 320 ps, Tpd10 => 230 ps );
    end for;

    -- . . .

  end for;

end configuration interlock_control_with_actual;
