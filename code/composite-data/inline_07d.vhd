entity inline_07d is

end entity inline_07d;


----------------------------------------------------------------


architecture test of inline_07d is
begin


  process_1_i : process is

    -- code from book:

    type A is array (1 to 4, 31 downto 0) of boolean;

    -- end of code from book

    variable free_map : bit_vector(1 to 10) := "0011010110";
    variable count : natural;

  begin

    -- code from book (just the conditions):

    assert A'left(1) = 1;      assert A'low(1) = 1;
    assert A'right(2) = 0 ;    assert A'high(2) = 31;

    assert A'length(1) = 4;    assert A'length(2) = 32;

    assert A'ascending(1) = true;    assert A'ascending(2) = false;

    assert A'low = 1;    assert A'length = 4;

    --

    count := 0;
    for index in free_map'range loop
      if free_map(index) = '1' then
        count := count + 1;
      end if;
    end loop;

    -- end of code from book

    wait;
  end process process_1_i;


end architecture test;
