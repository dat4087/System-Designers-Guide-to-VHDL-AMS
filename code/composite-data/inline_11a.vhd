entity inline_11a is

end entity inline_11a;


----------------------------------------------------------------


architecture test of inline_11a is

  -- code from book:

  type real_vector is array (natural range <>) of real;
  
  --
  
  subtype gains is real_vector(15 downto 0);
  
  --
  
  quantity max_temperatures : real_vector(1 to 10);

  -- end of code from book

begin
end architecture test;
