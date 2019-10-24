library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity inline_04a is
end entity inline_04a;


architecture test of inline_04a is

  component opamp is
    port ( terminal plus_in, minus_in, output, vdd, vss, gnd : electrical );
  end component opamp;

  terminal plus_in, minus_in, output, vdd, vss, gnd : electrical;

begin

  voltage_amp : component opamp
    port map ( plus_in => plus_in, minus_in => minus_in, output => output,
               vdd => vdd, vss => vss, gnd => gnd );

end architecture test;


configuration inline_04a_test of inline_04a is

  for test

    -- code from book (in text)

    for voltage_amp : opamp
      use configuration work.opamp_mosfets;
    end for;

    -- end code from book

  end for;

end configuration inline_04a_test;
