package resolve is

  -- code from book (in text)

  subtype byte is bit_vector(0 to 7);
  type byte_array is array (integer range <>) of byte;
  function resolve ( bytes : byte_array ) return byte;
  subtype resolved_byte is resolve byte;

  -- end code from book

end package resolve;


package body resolve is

  -- code from book

  function resolve ( bytes : byte_array ) return byte is
    variable result : byte := b"0000_0000";
  begin
    for index in bytes'range loop
      result := result or bytes(index);
    end loop;
    return result;
  end function resolve;

  -- end code from book

end package body resolve;

