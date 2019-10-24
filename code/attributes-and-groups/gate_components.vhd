-- analyze into resource library graphics

package graphics_pkg is

  attribute graphic_symbol : string;
  attribute graphic_style : string;

end package graphics_pkg;



-- code from book

library ieee;  use ieee.std_logic_1164.all;
library graphics;

package gate_components is

  use graphics.graphics_pkg.graphic_symbol,
    graphics.graphics_pkg.graphic_style;

  component and2 is
    generic ( prop_delay : delay_length );
    port ( a, b : in std_logic;  y : out std_logic );
  end component and2;

  attribute graphic_symbol of and2 : component is "and2";
  attribute graphic_style of and2 : component is "color:default, weight:bold";

  -- . . .

end package gate_components;

-- end code from book
