package resolved is

  type std_ulogic is ('U', 'X', '0', '1', 'Z', 'W', 'L', 'H', '-');
  type std_ulogic_vector is array ( natural range <> ) of std_ulogic;
  function resolved ( s : std_ulogic_vector ) return std_ulogic;

end package resolved;


package body resolved is

  -- code from book

  type stdlogic_table is array (std_ulogic, std_ulogic) of std_ulogic;
  constant resolution_table : stdlogic_table :=
    -- ---------------------------------------------
    --  'U', 'X', '0', '1', 'Z', 'W', 'L', 'H', '-'
    -- ---------------------------------------------
    ( ( 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U' ),  --  'U'
      ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ),  --  'X'
      ( 'U', 'X', '0', 'X', '0', '0', '0', '0', 'X' ),  --  '0'
      ( 'U', 'X', 'X', '1', '1', '1', '1', '1', 'X' ),  --  '1'
      ( 'U', 'X', '0', '1', 'Z', 'W', 'L', 'H', 'X' ),  --  'Z'
      ( 'U', 'X', '0', '1', 'W', 'W', 'W', 'W', 'X' ),  --  'W'
      ( 'U', 'X', '0', '1', 'L', 'W', 'L', 'W', 'X' ),  --  'L'
      ( 'U', 'X', '0', '1', 'H', 'W', 'W', 'H', 'X' ),  --  'H'
      ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' )   --  '-'
    );

  function resolved ( s : std_ulogic_vector ) return std_ulogic is
    variable result : std_ulogic := 'Z';  -- weakest state default
  begin
    if s'length = 1 then
      return s(s'low);
    else
      for i in s'range loop
        result := resolution_table(result, s(i));
      end loop;
    end if;
    return result;
  end function resolved;

  -- end code from book

end package body resolved;
