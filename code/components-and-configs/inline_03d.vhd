entity inline_03d is
end entity inline_03d;


architecture test of inline_03d is

  component reg4 is
    port ( clk, clr : in bit;  d : in bit_vector(0 to 3);
           q : out bit_vector(0 to 3) );
  end component reg4;

  signal clk, clr : bit;
  signal d, q : bit_vector(0 to 3);

begin

  flag_reg : component reg4
    port map ( clk => clk, clr => clr, d => d, q => q );

end architecture test;


configuration inline_03d_test of inline_03d is

  for test

    -- code from book (in text)

    for flag_reg : reg4
      use configuration work.reg4_gate_level;
    end for;

    -- end code from book

  end for;

end configuration inline_03d_test;
