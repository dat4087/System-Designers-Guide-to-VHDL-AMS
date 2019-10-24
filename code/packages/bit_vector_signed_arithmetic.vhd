package bit_vector_signed_arithmetic is

  function "+" ( bv1, bv2 : bit_vector ) return bit_vector;

  function "-" ( bv : bit_vector ) return bit_vector;

  function "*" ( bv1, bv2 : bit_vector ) return bit_vector;

  -- . . .

end package bit_vector_signed_arithmetic;

--------------------------------------------------

-- not in book
library ieee;  use ieee.numeric_bit.all;
-- end not in book

package body bit_vector_signed_arithmetic is

  function "+" ( bv1, bv2 : bit_vector ) return bit_vector is -- . . .
  -- not in book
  begin
    return bit_vector( "+"(signed(bv1), signed(bv2)) );
  end function "+";
  -- end not in book

  function "-" ( bv : bit_vector ) return bit_vector is -- . . .
  -- not in book
  begin
    return bit_vector( "-"(signed(bv)) );
  end function "-";
  -- end not in book

  function mult_unsigned ( bv1, bv2 : bit_vector ) return bit_vector is
    -- . . .
  begin
    -- not in book
    -- . . .
    return bit_vector( "*"(unsigned(bv1), unsigned(bv2)) );
    -- end not in book
  end function mult_unsigned;

  function "*" ( bv1, bv2 : bit_vector ) return bit_vector is
  begin
    if bv1(bv1'left) = '0' and bv2(bv2'left) = '0' then
      return mult_unsigned(bv1, bv2);
    elsif bv1(bv1'left) = '0' and bv2(bv2'left) = '1' then
      return -mult_unsigned(bv1, -bv2);
    elsif bv1(bv1'left) = '1' and bv2(bv2'left) = '0' then
      return -mult_unsigned(-bv1, bv2);
    else
      return mult_unsigned(-bv1, -bv2);
    end if;
  end function "*";

  -- . . .

end package body bit_vector_signed_arithmetic;
