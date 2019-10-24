entity inline_07 is

end entity inline_07;


----------------------------------------------------------------


library ieee;  use ieee.numeric_bit.all;

architecture test of inline_07 is
begin


  process_5_a : process is

    -- code from book:

    procedure increment ( a : inout integer;   n : in integer := 1 ) is -- . . .
    -- not in book
    begin
      a := a + n;
    end procedure increment;
    -- end not in book;

    procedure increment ( a : inout bit_vector;  n : in bit_vector := B"1" ) is -- . . .
    -- not in book
    begin
      a := bit_vector(signed(a) + signed(n));
    end procedure increment;
    -- end not in book;

    procedure increment ( a : inout bit_vector;  n : in integer := 1 ) is -- . . .
    -- not in book
    begin
      a := bit_vector(signed(a) + to_signed(n, a'length));
    end procedure increment;
    -- end not in book;

    variable count_int : integer := 2;
    variable count_bv : bit_vector (15 downto 0) := X"0002";

    -- end of code from book

  begin

    -- code from book:

    increment ( count_int, 2 );
    increment ( count_int );

    increment ( count_bv, X"0002");
    increment ( count_bv, 1 );

    -- increment ( count_bv );

    -- end of code from book

    wait;
  end process process_5_a;


end architecture test;
