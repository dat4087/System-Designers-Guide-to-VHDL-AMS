configuration misc_logic_reconfigured of misc_logic is

  for gate_level

    for gate1 : nand3
      generic map ( Tpd => 1.6 ns )
      port map ( a => c, c => a, b => b, y => y );
    end for;

  end for;

end configuration misc_logic_reconfigured;
