entity resolve_tri_state_logic is
end entity resolve_tri_state_logic;



architecture test of resolve_tri_state_logic is

  -- code from book (in text)

  type tri_state_logic is ('0', '1', 'Z');

  type tri_state_logic_array is array (integer range <>) of tri_state_logic;

  -- end code from book


  -- code from book

  function resolve_tri_state_logic ( values : in tri_state_logic_array )
                                   return tri_state_logic is
    variable result : tri_state_logic := 'Z';
  begin
    for index in values'range loop
      if values(index) /= 'Z' then
        result := values(index);
      end if;
    end loop;
    return result;
  end function resolve_tri_state_logic;

  -- end code from book


  -- code from book (in text)

  signal s1 : resolve_tri_state_logic tri_state_logic;

  subtype resolved_logic is resolve_tri_state_logic tri_state_logic;

  signal s2, s3 : resolved_logic;

  -- end code from book

begin

  source_1 : s1 <= 'Z',
                   '0' after 10 ns,
                   'Z' after 20 ns,
                   '1' after 30 ns,
                   'Z' after 40 ns,
	           '1' after 200 ns,
	           'Z' after 220 ns;

  source_2 : s1 <= 'Z',
                   '0' after 110 ns,
                   'Z' after 120 ns,
                   '1' after 130 ns,
                   'Z' after 140 ns,
	           '1' after 200 ns,
	           '0' after 210 ns,
	           'Z' after 220 ns;

end architecture test;
