-- code from book:

entity and_or_inv is
  port ( a1, a2, b1, b2 : in bit := '1';
         y : out bit );
end entity and_or_inv;

-- end of code from book


----------------------------------------------------------------


architecture functional of and_or_inv is
begin

  func : y <= not ((a1 and a2) or (b1 and b2));

end architecture functional;


----------------------------------------------------------------


entity inline_23 is

end entity inline_23;


----------------------------------------------------------------


library util;  use util.stimulus_generators.all;

architecture test of inline_23 is

  signal A, B, C, F : bit;
  signal test_input : bit_vector(2 downto 0);

begin


  -- code from book:

  f_cell : entity work.and_or_inv
    port map ( a1 => A, a2 => B, b1 => C, b2 => open, y => F );

  -- end of code from book


  ----------------


  stimulus : all_possible_values( bv => test_input,
				  delay_between_values => 10 ns );

  (A, B, C) <= test_input;

  verifier :
    postponed assert F = not ((A and B) or C)
      report "function model produced unexpected result";


end architecture test;
