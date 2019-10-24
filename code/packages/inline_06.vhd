-- code from book:

library std, work;  use std.standard.all;

-- end of code from book


entity inline_06 is

end entity inline_06;


----------------------------------------------------------------


architecture test of inline_06 is
begin


  process_4_a : process is

    constant a : integer := 10;
    constant b : integer := 20;
    variable result : boolean;

  begin

    -- code from book:

    result := std.standard."<" ( a, b );

    -- end of code from book

    wait;
  end process process_4_a;


end architecture test;
