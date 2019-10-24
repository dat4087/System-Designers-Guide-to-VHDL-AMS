entity inline_03 is

end entity inline_03;


----------------------------------------------------------------


architecture test of inline_03 is

  function pulled_up ( drivers : bit_vector ) return bit is
  begin
    for index in drivers'range loop
      if drivers(index) = '0' then
        return '0';
      end if;
    end loop;
    return '1';
  end function pulled_up;

  signal s : pulled_up bit bus;

begin


  process is
  begin

    s <= '1' after 11 ns, '0' after 16 ns, '1' after 18 ns,
         null after 19 ns, '0' after 25 ns;
    wait for 10 ns;

    -- code from book:

    s <= reject 3 ns inertial null after 10 ns;

    -- end of code from book

    wait;
  end process;



end architecture test;
