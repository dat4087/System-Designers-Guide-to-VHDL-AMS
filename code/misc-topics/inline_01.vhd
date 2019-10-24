entity inline_01 is

end entity inline_01;


----------------------------------------------------------------


architecture test of inline_01 is

  type std_ulogic is (t1, t2, t3);
  subtype std_logic is std_ulogic;

  -- code from book:

  type std_ulogic_vector is array ( natural range <> ) of std_ulogic;

  type std_logic_vector is array ( natural range <>) of std_logic;

  -- end of code from book

begin
end architecture test;
