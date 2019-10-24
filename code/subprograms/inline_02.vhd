entity inline_02 is

end entity inline_02;


----------------------------------------------------------------


architecture test of inline_02 is

  constant val1 : integer := 1;

  procedure p ( signal s1, s2 : in bit;  val1 : in integer ) is
  begin
    null;
  end procedure p;

begin


  block_3_a : block is

    signal s1, s2 : bit;

  begin

    -- code from book:

    call_proc : p ( s1, s2, val1 );

    -- end of code from book

  end block block_3_a;


  ----------------


  block_3_b : block is

    signal s1, s2 : bit;

  begin

    -- code from book:

    call_proc : process is
    begin
      p ( s1, s2, val1 );
      wait on s1, s2;
    end process call_proc;

    -- end of code from book

  end block block_3_b;


end architecture test;
