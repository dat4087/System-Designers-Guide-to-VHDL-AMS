entity inline_15 is
  generic ( extended_reset : boolean := false );
end entity inline_15;


----------------------------------------------------------------


architecture test of inline_15 is

  signal functional_reset, equivalent_reset : bit := '0';

begin


  block_3_r : block is
    port ( reset : out bit );
    port map ( reset => functional_reset );
  begin

    -- code from book:

    reset_gen : reset <= '1', '0' after 200 ns when extended_reset else
                         '1', '0' after 50 ns;

    -- end of code from book

  end block block_3_r;


  ----------------


  block_3_s : block is
    port ( reset : out bit );
    port map ( reset => equivalent_reset );
  begin

    -- code from book:

    reset_gen : process is
    begin
      if extended_reset then
        reset <= '1', '0' after 200 ns;
      else
        reset <= '1', '0' after 50 ns;
      end if;
      wait;
    end process reset_gen;

    -- end of code from book

  end block block_3_s;


  ----------------


  verifier :
  assert functional_reset = equivalent_reset
    report "Functional and equivalent models give different results";


end architecture test;
