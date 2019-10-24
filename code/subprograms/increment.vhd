entity increment is
end entity increment;



architecture test of increment is

  subtype word32 is bit_vector(31 downto 0);

  -- code from book

  procedure increment ( a : inout word32;  by : in word32 := X"0000_0001" ) is
    variable sum : word32;
    variable carry : bit := '0';
  begin
    for index in a'reverse_range loop
      sum(index) := a(index) xor by(index) xor carry;
      carry := ( a(index) and by(index) ) or ( carry and ( a(index) xor by(index) ) );
    end loop;
    a := sum;
  end procedure increment;

  -- end code from book

begin

  stimulus : process is

    variable count : word32 := X"0001_1100";

  begin

    -- code from book (in text)

    increment(count, X"0000_0004");

    increment(count);

    increment(count, by => open);

    -- end code from book

    wait;
  end process stimulus;

end architecture test;
