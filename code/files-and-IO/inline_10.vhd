entity inline_10 is

end entity inline_10;


----------------------------------------------------------------


architecture test of inline_10 is
begin


  process is

    use std.textio.all;
    variable L : line;

    -- code from book:

    type speed_category is (stopped, slow, fast, maniacal);
    variable speed : speed_category;

    -- end of code from book

  begin

    speed := stopped;

    -- code from book:

    write ( L, speed_category'image(speed) );

    -- end of code from book

    writeline(output, L);

    speed := slow;
    write ( L, speed_category'image(speed) );
    writeline(output, L);
    speed := fast;
    write ( L, speed_category'image(speed) );
    writeline(output, L);
    speed := maniacal;
    write ( L, speed_category'image(speed) );
    writeline(output, L);

    -- code from book:

    readline( input, L );
    speed := speed_category'value(L.all);

    -- end of code from book

    wait;
  end process;


end architecture test;
