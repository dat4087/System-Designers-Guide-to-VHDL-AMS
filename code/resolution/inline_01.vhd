entity inline_01 is

end entity inline_01;


----------------------------------------------------------------


architecture test of inline_01 is

  type MVL4_ulogic is ('X', '0', '1', 'Z');  -- unresolved logic type

  -- code from book:

  type small_int is range 1 to 4;
  type small_array is array (small_int range <>) of -- . . . ;
    -- not in book
    MVL4_ulogic;
    -- end not in book

  -- end of code from book

  type table is array (MVL4_ulogic, MVL4_ulogic) of MVL4_ulogic;
  constant resolution_table : table :=
    --  'X'  '0'  '1'  'Z'
    --  ------------------
    ( ( 'X', 'X', 'X', 'X' ),    -- 'X'
      ( 'X', '0', 'X', '0' ),    -- '0'
      ( 'X', 'X', '1', '1' ),    -- '1'
      ( 'X', '0', '1', 'Z' ) );  -- 'Z'

  function resolve_MVL4 ( contribution : small_array ) return MVL4_ulogic is
    variable result : MVL4_ulogic := 'Z';
  begin
    for index in contribution'range loop
      result := resolution_table(result, contribution(index));
    end loop;
    return result;
  end function resolve_MVL4;

  subtype MVL4_logic is resolve_MVL4 MVL4_ulogic;

  signal s : MVL4_logic;

begin

  driver_1 : s <= 'Z';

  driver_2 : s <= 'Z';

  driver_3 : s <= 'Z';

  driver_4 : s <= 'Z';

  driver_5 : s <= 'Z';

end architecture test;
