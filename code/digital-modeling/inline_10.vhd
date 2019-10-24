entity inline_10 is

end entity inline_10;


----------------------------------------------------------------


architecture test of inline_10 is

  signal data : bit_vector(7 downto 0) := X"FF";
  signal s : bit := '0';

begin


  process_3_l : process is
  begin
    wait for 10 ns;

    -- code from book:

   data <= X"00";

    -- end of code from book

    wait for 10 ns;

    -- code from book:

    s <= '1';
    -- . . .
    if s = '1' then -- . . .
    -- not in book
      report "s is '1'";
    else
      report "s is '0'";
    end if;
    -- end not in boook

    -- end of code from book

    wait;
  end process process_3_l;


end architecture test;
