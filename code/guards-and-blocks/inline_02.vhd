entity inline_02 is

end entity inline_02;


----------------------------------------------------------------


architecture test of inline_02 is

  -- code from book:

  subtype word is bit_vector(0 to 31);
  type word_array is array (integer range <>) of word;

  function resolve_words ( words : word_array ) return word;

  signal s : resolve_words word bus;

  -- end of code from book

  function resolve_words ( words : word_array ) return word is
  begin
    if words'length > 0 then
      return words(words'left);
    else
      return X"00000000";
    end if;
  end function resolve_words;

  constant T_delay : delay_length := 2 ns;

begin


  process is
  begin

    -- code from book (should fail)

    s(0 to 15) <= X"003F" after T_delay;
    s(16 to 31) <= null after T_delay;

    -- end of code from book

    wait;
  end process;


end architecture test;
