entity inline_09 is

end entity inline_09;


----------------------------------------------------------------


architecture test of inline_09 is
begin


  process is

    use std.textio.all;
    variable L : line;

  begin

    write(L, 42, justified => left, field => 5);
    writeline(output, L);
    write(L, 42, justified => right, field => 5);
    writeline(output, L);
    write(L, 123, field => 2);
    writeline(output, L);

    -- code from book:

    write ( L, string'( "fred" ) );
    write ( L, ' ' );
    write ( L, bit_vector'( X"3A" ) );

    -- end of code from book

    writeline(output, L);

    write(L, 3.14159, digits => 2);
    writeline(output, L);
    write(L, 123.4567, digits => 0);
    writeline(output, L);

    write(L, 40 ns, unit => ps);
    writeline(output, L);
    write(L, 23 us, unit => ms);
    writeline(output, L);

    wait;
  end process;


end architecture test;
