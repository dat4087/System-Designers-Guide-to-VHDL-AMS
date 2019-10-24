entity inline_03 is

end entity inline_03;


----------------------------------------------------------------


architecture test of inline_03 is
begin


  process_1_b : process is

    -- code from book:

    type symbol is ('a', 't', 'd', 'h', digit, cr, error);
    type state is range 0 to 6;

    type transition_matrix is array (state, symbol) of state;

    variable transition_table : transition_matrix;

    -- end of code from book
	
    variable next_state : state;

    -- code from book:

    type point is array (1 to 3) of real;
    type matrix is array (1 to 3, 1 to 3) of real;

    variable p, q : point;
    variable transform : matrix;

    -- end of code from book

  begin

    next_state := 
    -- code from book:

    transition_table(5, 'd');


    -- end of code from book

    for i in 1 to 3 loop
      for j in 1 to 3 loop
        if i = j then
          transform(i, j) := -1.0;
        else
          transform(i, j) := 0.0;
        end if;
      end loop;
    end loop;
    p := (1.0, 2.0, 3.0);

    -- code from book:

    for i in 1 to 3 loop
      q(i) := 0.0;
      for j in 1 to 3 loop
        q(i) := q(i) + transform(i, j) * p(j);
      end loop;
    end loop;
    -- end of code from book

    wait;
  end process process_1_b;


end architecture test;
