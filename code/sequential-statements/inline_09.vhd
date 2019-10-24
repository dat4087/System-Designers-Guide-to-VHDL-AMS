entity inline_09 is

end entity inline_09;


----------------------------------------------------------------


architecture test of inline_09 is
begin


  process_2_d : process is

    -- code from book:

    variable N : integer := 1;

    --

    constant C : integer := 1;

    -- end of code from book

    constant expression : integer := 7;

  begin

    -- code from book:

    -- error: Case choice must be a locally static expression

    -- case expression is         -- example of an illegal case statement
    --   when N | N+1 => -- . . .
    --   when N+2 to N+5 => -- . . .
    --   when others => -- . . .
    -- end case;

    --

    case expression is
      when C | C+1 => -- . . .
      when C+2 to C+5 => -- . . .
      when others => -- . . .
    end case;

    -- end of code from book

    wait;
  end process process_2_d;


end architecture test;
