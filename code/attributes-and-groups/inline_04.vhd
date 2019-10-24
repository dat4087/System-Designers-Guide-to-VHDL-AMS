package inline_04 is

  attribute cell_name : string;

end package inline_04;



entity flipflop is

end entity flipflop;



use work.inline_04.all;

-- code from book:

architecture std_cell of flipflop is

  attribute cell_name of std_cell : architecture is "DFF_SR_QQNN";

  -- . . .       -- other declarations

begin
  -- . . .
end architecture std_cell;

-- end of code from book



-- code from book:

package model_utilities is

  attribute optimize : string;
  attribute optimize of model_utilities : package is "level_4";

  -- . . .

end package model_utilities;

-- end of code from book
