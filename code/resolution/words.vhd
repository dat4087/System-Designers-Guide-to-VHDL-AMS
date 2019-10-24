package words is

  type X01Z is ('X', '0', '1', 'Z');
  type uword is array (0 to 31) of X01Z;

  type uword_vector is array (natural range <>) of uword;

  function resolve_word ( contribution : uword_vector ) return uword;

  subtype word is resolve_word uword;

  -- not in book
  type ubyte is array (0 to 7) of X01Z;
  -- end not in book

end package words;

--------------------------------------------------

package body words is

  type table is array (X01Z, X01Z) of X01Z;

  constant resolution_table : table :=
    --  'X'  '0'  '1'  'Z'
    --  ------------------
    ( ( 'X', 'X', 'X', 'X' ),    -- 'X'
      ( 'X', '0', 'X', '0' ),    -- '0'
      ( 'X', 'X', '1', '1' ),    -- '1'
      ( 'X', '0', '1', 'Z' ) );  -- 'Z'

  function resolve_word ( contribution : uword_vector ) return uword is
    variable result : uword := (others => 'Z');
  begin
    for index in contribution'range loop
      for element in uword'range loop
        result(element) :=
          resolution_table( result(element), contribution(index)(element) );
      end loop;
    end loop;
    return result;
  end function resolve_word;

end package body words;
