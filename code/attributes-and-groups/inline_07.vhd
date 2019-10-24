entity inline_07 is

end entity inline_07;


----------------------------------------------------------------


architecture test of inline_07 is

  component multiplier is
  end component multiplier;

  type length is range 0 to integer'high
    units nm;
      um = 1000 nm;
      mm = 1000 um;
      mil = 25400 nm;
    end units length;

  type coordinate is record
      x, y : length;
    end record coordinate;

  type orientation_type is (up, down, left, right);

  attribute cell_allocation : string;
  attribute cell_position : coordinate;
  attribute cell_orientation : orientation_type;

  -- code from book:

  attribute cell_allocation of mult : label is "wallace_tree_multiplier";
  attribute cell_position of mult : label is ( 1200 um, 4500 um );
  attribute cell_orientation of mult : label is down;

  -- end of code from book

begin

  mult : component multiplier;

end architecture test;
