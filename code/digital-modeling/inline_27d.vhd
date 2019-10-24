entity inline_27d is

end entity inline_27d;


----------------------------------------------------------------


library wasp_lib;

-- code from book:

use wasp_lib.all;

-- end of code from book


architecture test of inline_27d is

  signal clk, filter_clk : bit;

begin


  clk_pad : entity in_pad
    port map ( i => clk, z => filter_clk );


end architecture test;
