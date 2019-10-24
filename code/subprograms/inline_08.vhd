entity inline_08 is

end entity inline_08;


----------------------------------------------------------------


library ieee;  use ieee.numeric_bit.all;

architecture test of inline_08 is
begin


  process_5_b : process is

    -- code from book:

    function "+" ( left, right : in bit_vector ) return bit_vector is
    begin
      -- . . .
      -- not in book
      return bit_vector( "+"(signed(left), signed(right)) );
      -- end not in book
    end function "+";

    variable addr_reg : bit_vector(31 downto 0);
    -- . . .

    -- end of code from book

    -- code from book:

    function "abs" ( right : in bit_vector ) return bit_vector is
    begin
      -- . . .
      -- not in book
      if right(right'left) = '0' then
        return right;
      else
        return bit_vector( "-"(signed(right)) );
      end if;
      -- end not in book
    end function "abs";

    variable accumulator : bit_vector(31 downto 0);
    -- . . .

    -- end of code from book

  begin

    -- code from book:

    addr_reg := addr_reg + X"0000_0004";

    -- end of code from book

    accumulator := X"000000FF";

    -- code from book:

    accumulator := abs accumulator;

    -- end of code from book

    accumulator := X"FFFFFFFE";
    accumulator := abs accumulator;

    wait;
  end process process_5_b;


end architecture test;
