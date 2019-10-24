package function_plus is

  -- code from book (in text)

  function "+" ( bv1, bv2 : bit_vector ) return bit_vector;

  -- end code from book

end package function_plus;



package body function_plus is

  -- code from book

  function "+" ( bv1, bv2 : bit_vector ) return bit_vector is

    alias norm1 : bit_vector(1 to bv1'length) is bv1;
    alias norm2 : bit_vector(1 to bv2'length) is bv2;

    variable result : bit_vector(1 to bv1'length);
    variable carry : bit := '0';

  begin
    if bv1'length /= bv2'length then
      report "arguments of different length" severity failure;
    else
      for index in norm1'reverse_range loop
        result(index) := norm1(index) xor norm2(index) xor carry;
        carry := ( norm1(index) and norm2(index) )
              or ( carry and ( norm1(index) or norm2(index) ) );
      end loop;
    end if;
    return result;
  end function "+";

  -- end code from book

end package body function_plus;
