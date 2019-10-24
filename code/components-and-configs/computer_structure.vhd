configuration computer_structure of computer_system is

  for structure

    for interface_decoder : decoder_2_to_4
      use entity work.decoder_3_to_8(basic)
      generic map ( Tpd_01 => prop_delay, Tpd_10 => prop_delay )
      port map ( s0 => in0, s1 => in1, s2 => '0',
                 enable => '1',
                 y0 => out0, y1 => out1, y2 => out2, y3 => out3,
                 y4 => open, y5 => open, y6 => open, y7 => open );
    end for;

    -- . . .

  end for;

end configuration computer_structure;
