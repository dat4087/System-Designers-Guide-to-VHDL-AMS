entity inline_01 is

end entity inline_01;


----------------------------------------------------------------


architecture test of inline_01 is

  signal en : bit := '0';
  signal data_in : integer := 0;

begin

  process_1_a : process (en, data_in) is

    variable stored_value : integer := 0;

  begin

    -- code from book:

    if en = '1' then
      stored_value := data_in;
    end if;

    -- end of code from book

  end process process_1_a;

  stimulus : process is
  begin
    en <= '1' after 10 ns, '0' after 20 ns;
    data_in <= 1 after 5 ns, 2 after 15 ns, 3 after 25 ns;
    wait;
  end process stimulus;

end architecture test;
