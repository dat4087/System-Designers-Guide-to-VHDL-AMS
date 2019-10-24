entity inline_05 is

end entity inline_05;


architecture test of inline_05 is

  subtype word is bit_vector(0 to 31);
  type word_array is array (integer range <>) of word;

  function resolve_words ( words : word_array ) return word is
  begin
    if words'length > 0 then
      return words(words'left);
    else
      return X"00000000";
    end if;
  end function resolve_words;

  subtype resolved_word is resolve_words word;

  -- code from book:

  signal source_bus_1, source_bus_2 : resolved_word bus;
  signal address_bus : resolved_word bus;

  disconnect all : resolved_word after 2 ns;

  -- end of code from book

  signal s : word;
  signal g : boolean;

begin


  b : block (g) is
  begin
    source_bus_1 <= guarded s after 4 ns;
    source_bus_2 <= guarded s after 4 ns;
    address_bus <= guarded s after 4 ns;
  end block b;

  stimulus : process is
  begin
    s <= X"DDDDDDDD";
    wait for 10 ns;
    g <= true;
    wait for 10 ns;
    s <= X"AAAAAAAA";
    wait for 10 ns;
    g <= false;
    wait for 10 ns;
    s <= X"11111111";

    wait;
  end process stimulus;

end architecture test;
