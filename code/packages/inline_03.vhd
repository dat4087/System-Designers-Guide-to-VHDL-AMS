entity inline_03 is

end entity inline_03;


----------------------------------------------------------------


library ieee;

architecture test of inline_03 is
begin


  process_3_a : process is

    -- code from book:

    use work.cpu_types;

    variable data_word : cpu_types.word;
    variable next_address : cpu_types.address;

    -- end of code from book

  begin
   wait;
  end process process_3_a;


  ----------------


  process_3_b : process is

    -- code from book:

    use work.cpu_types.word, work.cpu_types.address;

    variable data_word : word;
    variable next_address : address;

    -- end of code from book

  begin
    wait;
  end process process_3_b;


end architecture test;
