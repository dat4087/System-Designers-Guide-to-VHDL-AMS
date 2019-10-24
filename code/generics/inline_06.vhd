-- code from book

entity reg is
  port ( d : in bit_vector;  q : out bit_vector;  -- . . . );
  -- not in book
         other_port : in bit := '0' );
  -- end not in book
end entity reg;

-- end code from book


architecture test of reg is
begin
  q <= d;
end architecture test;



entity inline_06 is

end entity inline_06;


----------------------------------------------------------------


architecture test of inline_06 is

  -- code from book

  signal small_data : bit_vector(0 to 7);
  signal large_data : bit_vector(0 to 15);
  -- . . .

  -- end code from book


begin

  -- code from book

  problem_reg : entity work.reg
    port map ( d => small_data,  q => large_data, -- . . . );
    -- not in book
               other_port => open );
    -- end not in book

  -- end code from book

end architecture test;
