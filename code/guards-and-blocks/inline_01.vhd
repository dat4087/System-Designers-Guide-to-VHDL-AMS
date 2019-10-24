entity inline_01 is

end entity inline_01;


----------------------------------------------------------------


architecture test of inline_01 is

  function pulled_up ( drivers : bit_vector ) return bit is
  begin
    for index in drivers'range loop
      if drivers(index) = '0' then
        return '0';
      end if;
    end loop;
    return '1';
  end function pulled_up;

  type state_type is (init_state, state1, state2, state3);
  type state_vector is array (integer range <>) of state_type;

  function resolve_state ( drivers : state_vector ) return state_type is
  begin
    return drivers(drivers'left);
  end function resolve_state;


  -- code from book:

  signal interrupt_request : pulled_up bit bus;

  signal stored_state : resolve_state state_type register := init_state;

  -- end of code from book

begin


end architecture test;
