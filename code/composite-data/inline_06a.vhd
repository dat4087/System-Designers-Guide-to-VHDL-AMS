entity inline_06a is

end entity inline_06a;


----------------------------------------------------------------


architecture test of inline_06a is

  -- code from book:

  subtype resistance is real tolerance "default_resistance";
  type resistance_array is array (1 to 4) of resistance;
  quantity resistances : resistance_array := (10.0, 20.0, 50.0, 75.0);

  -- end of code from book


begin


  block_1_f : block is

    -- code from book:

    quantity resistances : resistance_array := (1 => 10.0, 2 => 20.0, 3 => 50.0, 4 => 75.0);

    -- end of code from book

  begin
  end block block_1_f;


end architecture test;
