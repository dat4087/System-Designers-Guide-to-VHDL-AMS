entity inline_04 is

end entity inline_04;


----------------------------------------------------------------


architecture test of inline_04 is

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

  signal memory_data_bus : resolved_word bus;
  disconnect memory_data_bus : resolved_word after 3 ns;

  -- end of code from book

  signal mem_sel, mem_write : boolean;
  signal cache_data_bus : word;

begin


  -- code from book:

  mem_write_buffer : block (mem_sel and mem_write) is
  begin
    memory_data_bus <=
      guarded reject 2 ns inertial cache_data_bus after 4 ns;
  end block mem_write_buffer;

  -- end of code from book

  stimulus : process is
  begin
    cache_data_bus <= X"DDDDDDDD";
    wait for 10 ns;
    mem_sel <= true;  mem_write <= true;
    wait for 10 ns;
    cache_data_bus <= X"AAAAAAAA";
    wait for 10 ns;
    mem_sel <= false;  mem_write <= false;
    wait for 10 ns;
    cache_data_bus <= X"11111111";

    wait;
  end process stimulus;

end architecture test;
