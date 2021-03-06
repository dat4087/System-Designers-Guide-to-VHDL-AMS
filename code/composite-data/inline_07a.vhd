entity inline_07a is

end entity inline_07a;


----------------------------------------------------------------


library ieee_proposed;  use ieee_proposed.thermal_systems.all;

architecture test of inline_07a is

  -- code from book:

  type A is array (1 to 4, 31 downto 0) of boolean;

  nature B is array (1 to 10, 19 downto 0) of thermal;

  -- end of code from book

begin


  process_1_i : process is

    variable free_map : bit_vector(1 to 10) := "0011010110";
    variable count : natural;

  begin

    -- code from book (just the conditions):

    assert A'low(1) = 1;                       assert B'left(1) = 1;
    assert A'high(2) = 31;                     assert B'right(2) = 0;

--  assert A'reverse_range(2) is 0 to 31;      assert B'range(1) is 1 to 10;

    assert A'length(2) = 32;                   assert B'length(1) = 10;

    assert A'ascending(2) = false;             assert B'ascending(1) = true;

    assert A'low = 1;                          assert A'length = 4;
    assert B'high = 10;                        assert B'length = 10;

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
