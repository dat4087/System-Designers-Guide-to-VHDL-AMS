package MVL4 is

  type MVL4_ulogic is ('X', '0', '1', 'Z');  -- unresolved logic type

  type MVL4_ulogic_vector is array (natural range <>) of MVL4_ulogic;

  function resolve_MVL4 ( contribution : MVL4_ulogic_vector )
                        return MVL4_ulogic;

  subtype MVL4_logic is resolve_MVL4 MVL4_ulogic;

  -- code from book (in text)

  type MVL4_logic_vector is array (natural range <>) of MVL4_logic;

  -- end code from book

end package MVL4;

--------------------------------------------------

package body MVL4 is

  type table is array (MVL4_ulogic, MVL4_ulogic) of MVL4_ulogic;

  constant resolution_table : table :=
    --  'X'  '0'  '1'  'Z'
    --  ------------------
    ( ( 'X', 'X', 'X', 'X' ),    -- 'X'
      ( 'X', '0', 'X', '0' ),    -- '0'
      ( 'X', 'X', '1', '1' ),    -- '1'
      ( 'X', '0', '1', 'Z' ) );  -- 'Z'

  function resolve_MVL4 ( contribution : MVL4_ulogic_vector )
                        return MVL4_ulogic is
    variable result : MVL4_ulogic := 'Z';
  begin
    for index in contribution'range loop
      result := resolution_table(result, contribution(index));
    end loop;
    return result;
  end function resolve_MVL4;

end package body MVL4;
