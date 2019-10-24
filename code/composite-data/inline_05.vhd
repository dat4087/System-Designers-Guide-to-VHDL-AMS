entity inline_05 is

end entity inline_05;


----------------------------------------------------------------


architecture test of inline_05 is

  subtype coeff_ram_address is integer range 0 to 63;

  -- code from book:

  type coeff_array is array (coeff_ram_address) of real;

  -- end of code from book

  
begin


  process_1_c : process is

    -- code from book:

    type point is array (1 to 3) of real;
    constant origin : point := (0.0, 0.0, 0.0);
    variable view_point : point := (10.0, 20.0, 0.0);

    -- end of code from book

  begin
    wait;
  end process process_1_c;


  process_1_d : process is

    type point is array (1 to 3) of real;

    -- code from book:

    variable view_point : point := (1 => 10.0, 2 => 20.0, 3 => 0.0);

    -- end of code from book

  begin
    wait;
  end process process_1_d;


  process_1_e : process is

    -- code from book:

    variable coeff : coeff_array := (0 => 1.6, 1 => 2.3, 2 => 1.6, 3 to 63 => 0.0);

    -- end of code from book

  begin
    wait;
  end process process_1_e;


  process_1_f : process is

    -- code from book:

    variable coeff : coeff_array := (0 => 1.6, 1 => 2.3, 2 => 1.6, others => 0.0);

    -- end of code from book

  begin
    wait;
  end process process_1_f;


  process_1_g : process is

    -- code from book:

    variable coeff : coeff_array := (0 | 2 => 1.6, 1 => 2.3, others => 0.0);

    -- end of code from book

  begin
    wait;
  end process process_1_g;


  process_1_h : process is

    -- code from book:

    -- error: Associations in array aggregate must be all named or all positional
    -- variable coeff : coeff_array := (1.6, 2.3, 2 => 1.6, others => 0.0);  -- illegal

    -- end of code from book

  begin
    wait;
  end process process_1_h;


end architecture test;
