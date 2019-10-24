entity add_with_overflow is
end entity add_with_overflow;


architecture test of add_with_overflow is
begin

-- code from book

process is

  procedure add_with_overflow ( a, b : in integer;
                                sum : out integer;
                                overflow : out boolean ) is -- . . .

    -- not in book
    begin
    end;
    -- end not in book

  procedure add_with_overflow ( a, b : in bit_vector;
                                sum : out bit_vector;
                                overflow : out boolean ) is -- . . .

    -- not in book
    begin
    end;
    -- end not in book

  attribute built_in : string;

  attribute built_in of
    add_with_overflow [ integer, integer,
                        integer, boolean ] : procedure is "int_add_overflow";

  attribute built_in of
    add_with_overflow [ bit_vector, bit_vector,
                        bit_vector, boolean ] : procedure is "bit_vector_add_overflow";

begin
  -- . . .
  -- not in book
  wait;
  -- end not in book
end process;

-- end code from book

end architecture test;
