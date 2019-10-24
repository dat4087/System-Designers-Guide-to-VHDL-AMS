package inline_02 is

  -- code from book

  subtype word32 is bit_vector(31 downto 0);

  procedure add ( a, b : in word32;
                  result : out word32;  overflow : out boolean );

  function "<" ( a, b : in word32 ) return boolean;

  constant max_buffer_size : positive;

  -- end code from book

end package inline_02;


package body inline_02 is

  -- code from book

  constant max_buffer_size : positive := 4096;

  -- end code from book

end package body inline_02;
