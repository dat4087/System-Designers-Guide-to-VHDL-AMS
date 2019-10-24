entity addu is
end entity addu;


architecture test of addu is

  subtype word32 is bit_vector(31 downto 0);

  -- code in book

  procedure addu ( a, b : in word32;
                   result : out word32;  overflow : out boolean ) is
    variable sum : word32;
    variable carry : bit := '0';
  begin
    for index in sum'reverse_range loop
      sum(index) := a(index) xor b(index) xor carry;
      carry := ( a(index) and b(index) ) or ( carry and ( a(index) xor b(index) ) );
    end loop;
    result := sum;
    overflow := carry = '1';
  end procedure addu;

  -- end code in book

begin

  stimulus : process is

    -- code in book (in text)

    variable PC, next_PC : word32;
    variable overflow_flag : boolean;
    -- . . .

    -- end code in book

  begin
    PC := X"0000_0010";

    -- code in book (in text)

    addu ( PC, X"0000_0004", next_PC, overflow_flag);

    -- end code in book

    PC := X"FFFF_FFFC";
    addu ( PC, X"0000_0004", next_PC, overflow_flag);

    wait;
  end process stimulus;

end architecture test;
