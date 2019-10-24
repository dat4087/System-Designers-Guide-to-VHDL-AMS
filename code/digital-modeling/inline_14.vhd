entity inline_14 is

end entity inline_14;


----------------------------------------------------------------


architecture test of inline_14 is

  signal PC, functional_next_PC, equivalent_next_PC : integer := 0;

begin


  block_3_p : block is
    port ( next_PC : out integer );
    port map ( next_PC => functional_next_PC );
  begin

    -- code from book:

    PC_incr : next_PC <= PC + 4 after 5 ns;

    -- end of code from book

  end block block_3_p;


  ----------------


  block_3_q : block is
    port ( next_PC : out integer );
    port map ( next_PC => equivalent_next_PC );
  begin

    -- code from book:

    PC_incr : process is
    begin
      next_PC <= PC + 4 after 5 ns;
      wait on PC;
    end process PC_incr;

    -- end of code from book

  end block block_3_q;


  ----------------


  stimulus : process is
  begin
    for i in 1 to 10 loop
      PC <= i after 20 ns;
      wait for 20 ns;
    end loop;
    wait;
  end process stimulus;

  verifier :
  assert functional_next_PC = equivalent_next_PC
    report "Functional and equivalent models give different results";


end architecture test;
