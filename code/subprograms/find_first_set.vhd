entity find_first_set is
end entity find_first_set;



architecture test of find_first_set is

  -- code from book

  procedure find_first_set ( v : in bit_vector;
                             found : out boolean;
                             first_set_index : out natural ) is
  begin
    for index in v'range loop
      if v(index) = '1' then
        found := true;
        first_set_index := index;
        return;
      end if;
    end loop;
    found := false;
  end procedure find_first_set;

  -- end code from book

begin

  stimulus : process is

    -- code from book (in text)

    variable int_req : bit_vector (7 downto 0);
    variable top_priority : natural;
    variable int_pending : boolean;
    -- . . .

    -- end code from book

    constant block_count : natural := 16;

    -- code from book (in text)

    variable free_block_map : bit_vector(0 to block_count-1);
    variable first_free_block : natural;
    variable free_block_found : boolean;
    -- . . .

    -- end code from book

  begin
    int_req := "00010000";

    -- code from book (in text)

    find_first_set ( int_req, int_pending, top_priority );

    -- end code from book

    free_block_map := (others => '0');

    -- code from book (in text)

    find_first_set ( free_block_map, free_block_found, first_free_block );

    -- end code from book

    wait;
  end process stimulus;

end architecture test;
