architecture arch of ent is

  type t is . . .;

  signal s : t;

  procedure p1 ( . . . ) is
    variable v1 : t;
  begin
    v1 := s;
  end procedure p1;

begin  -- arch

  proc1 : process is

    variable v2 : t;

    procedure p2 ( . . . ) is
      variable v3 : t;
    begin
      p1 ( v2, v3, . . . );
    end procedure p2;

  begin  -- proc1
    p2 ( v2, . . . );
  end process proc1;

  proc2 : process is
    . . .
  begin  -- proc2
    p1 ( . . . );
  end process proc2;

end architecture arch;
