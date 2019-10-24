entity inline_05 is
end entity inline_05;


architecture test of inline_05 is

  -- code from book

  component nand3 is
    port ( a, b, c : in bit := '1';  y : out bit );
  end component nand3;

  -- end code from book

  signal s1, s2, s3 : bit;

begin

  -- code from book

  gate1 : component nand3
    port map ( a => s1, b => s2, c => open, y => s3 );

  -- end code from book

end architecture test;



-- code from book

entity nand2 is
  port ( a, b : in bit := '1';  y : out bit );
end entity nand2;

-- end code from book




configuration inline_05_test of inline_05 is

  for test

    -- code from book

    for gate1 : nand3
      use entity work.nand2(basic);
    end for;

    -- end code from book

  end for;

end configuration inline_05_test;
