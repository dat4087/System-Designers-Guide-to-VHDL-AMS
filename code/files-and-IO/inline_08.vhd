entity inline_08 is

end entity inline_08;


----------------------------------------------------------------


architecture test of inline_08 is
begin


  process is

    use std.textio.all;
    file f : text open read_mode is "inline_08.dat";
    variable L : line;
    variable ch : character;
    variable s : string(1 to 5);
    variable i : integer;
    variable r : real;

  begin

    readline(f, L);
    read(L, ch);
    report character'image(ch);
    read(L, ch);
    report character'image(ch);

    readline(f, L);
    read(L, s);
    report '"' & s & '"';
    read(L, s);
    report '"' & s & '"';

    readline(f, L);

    -- code from book:

    if L'length < s'length then
      read(L, s(1 to L'length));
    else
      read(L, s);
    end if;

    -- end of code from book

    report '"' & s & '"';

    readline(f, L);
    read(L, i);
    report integer'image(i);
    read(L, r);
    report real'image(r);

    wait;
  end process;


end architecture test;
