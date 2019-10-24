configuration controller_with_timing of controller is

  for structural

    for state_reg : reg
      use entity work.reg(gate_level)
      generic map ( t_setup => 200 ps, t_hold => 150 ps, t_pd => 150 ps,
                    width => width );
    end for;

    -- . . .

  end for;

end configuration controller_with_timing;
