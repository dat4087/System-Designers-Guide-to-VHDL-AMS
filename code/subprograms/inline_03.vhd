entity inline_03 is

end entity inline_03;


----------------------------------------------------------------


library ieee;  use ieee.numeric_bit.all;

architecture test of inline_03 is

  constant T_delay_adder : delay_length := 10 ns;

  -- code from book:

  function bv_add ( bv1, bv2 : in bit_vector ) return bit_vector is
  begin
    -- . . .
    -- not in book
    return bit_vector(unsigned(bv1) + unsigned(bv2));
    -- end not in book
  end function bv_add;

  signal source1, source2, sum : bit_vector(0 to 31);

  -- end of code from book


begin


  -- code from book:

  adder : sum <= bv_add(source1, source2) after T_delay_adder;

  -- end of code from book


  ----------------


  stimulus : process is
  begin
    wait for 50 ns;
    source1 <= X"00000002";  source2 <= X"00000003";  wait for 50 ns;
                             source2 <= X"FFFFFFF0";  wait for 50 ns;
    source1 <= X"00000010";                           wait for 50 ns;

    wait;
  end process stimulus;


end architecture test;
