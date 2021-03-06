entity negate is
end entity negate;


architecture test of negate is

  subtype word32 is bit_vector(31 downto 0);

  -- code in book

  procedure negate ( a : inout word32 ) is
    variable carry_in : bit := '1';
    variable carry_out : bit;
  begin
    a := not a;
    for index in a'reverse_range loop
      carry_out :=  a(index) and carry_in;
      a(index) := a(index) xor carry_in;
      carry_in := carry_out;
    end loop;
  end procedure negate;

  -- end code in book

begin

  stimulus : process is

    -- code in book (in text)

    variable op1 : word32;
    -- . . .

    -- end code in book

  begin
   op1 := X"0000_0002";

    -- code in book (in text)

    negate ( op1 );

    -- end code in book

    wait;
  end process stimulus;

end architecture test;
