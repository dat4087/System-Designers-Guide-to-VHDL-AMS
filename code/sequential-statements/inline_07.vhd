entity inline_07 is

end entity inline_07;


----------------------------------------------------------------


architecture test of inline_07 is
begin

  process_2_b : process is

    -- code from book:

    subtype index_mode is integer range 0 to 3;

    variable instruction_register : integer range 0 to 2**16 - 1;

    -- end of code from book

    variable index_value : integer;
    constant accumulator_A : integer := 1;
    constant accumulator_B : integer := 2;
    constant index_register : integer := 3;

  begin

    for i in index_mode loop
      instruction_register := i * 2**12;

      -- code from book:

      case index_mode'((instruction_register / 2**12) rem 2**2) is
        when 0 =>
          index_value := 0;
        when 1 =>
          index_value := accumulator_A;
        when 2 =>
          index_value := accumulator_B;
        when 3 =>
          index_value := index_register;
      end case;

      -- end of code from book

    end loop;

    wait;
  end process process_2_b;


end architecture test;
