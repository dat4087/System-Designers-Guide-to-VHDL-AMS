package inline_02 is

  -- code from book

  type std_ulogic is ('U', 'X', '0', '1', 'Z', 'W', 'L', 'H', '-');

  type std_ulogic_vector is array ( natural range <> ) of std_ulogic;

  function resolved ( s : std_ulogic_vector ) return std_ulogic;

  subtype std_logic is resolved std_ulogic;

  type std_logic_vector is array ( natural range <>) of std_logic;

  subtype X01 is resolved std_ulogic range 'X' to '1'; -- ('X','0','1')
  subtype X01Z is resolved std_ulogic range 'X' to 'Z'; -- ('X','0','1','Z')
  subtype UX01 is resolved std_ulogic range 'U' to '1'; -- ('U','X','0','1')
  subtype UX01Z is resolved std_ulogic range 'U' to 'Z'; -- ('U','X','0','1','Z')

  -- end code from book

end package inline_02;



package body inline_02 is

  function resolved ( s : std_ulogic_vector ) return std_ulogic is
  begin
    return 'U';
  end function resolved;

end package body inline_02;
