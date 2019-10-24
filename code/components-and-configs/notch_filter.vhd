library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity notch_filter is
  port ( terminal input, output, vdd, vss, gnd : electrical );
end entity notch_filter;

----------------------------------------------------------------

architecture opamp_based of notch_filter is
  
  component simple_opamp is
    port ( terminal plus_in, minus_in, output, vdd, vss, gnd : electrical );
  end component simple_opamp;
  -- ...
  
  terminal opamp1_in, opamp1_out, opamp2_in, -- ...
    -- not in book
    other_terminal
    -- end not in book
    : electrical;

begin
  
  opamp1 : component simple_opamp
    port map ( plus_in => gnd, minus_in => opamp1_in, output => opamp1_out,
               vdd => vdd, vss => vss, gnd => gnd );

    opamp2 : component simple_opamp
      port map ( plus_in => gnd, minus_in => opamp2_in, output => output,
                 vdd => vdd, vss => vss, gnd => gnd );

  -- other component instances
  -- ...
  
end architecture opamp_based;
