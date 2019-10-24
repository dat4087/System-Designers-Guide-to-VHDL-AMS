procedure p1 is

  variable v : integer;

  procedure p2 is
    variable v : integer;
  begin  -- p2
    . . .
    v := v + 1;
    . . .
  end procedure p2;

begin  -- p1
  . . .
  v := 2 * v;
  . . .
end procedure p1;
