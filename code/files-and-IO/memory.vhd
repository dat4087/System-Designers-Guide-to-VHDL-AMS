library ieee;  use ieee.numeric_bit.all, std.textio.all;

architecture file_loaded of memory is
begin

  mem_behavior : process is

    constant high_address : natural := mem_size - 1;

    type memory_array is
      array (natural range 0 to high_address / 4) of dlx_word;

    variable mem : memory_array;

    -- . . .    -- other variables as in architecture preloaded

    procedure load is

      file object_file : text open read_mode is load_file_name;
      variable L : line;
      variable line_number : natural := 0;

      type parse_state is ( expecting_abs,
                            expecting_address_or_start_or_eof,
                            expecting_eof );

      variable state : parse_state := expecting_abs;

      variable address : natural;
      variable data : natural;
      variable byte : unsigned(7 downto 0);


      function valid_hex_character ( ch : in character ) return boolean is
      begin
        return ('0' <= ch and ch <= '9')
               or ('A' <= ch and ch <= 'F')
               or ('a' <= ch and ch <= 'f');
      end function valid_hex_character;

      procedure read_hex ( L : inout line;  n : out natural ) is
        variable ch : character;
        variable result : natural := 0;
      begin
        if not valid_hex_character( L(L'left) ) then
          report "Format error in file " & load_file_name
                 & " on line " & integer'image(line_number) severity failure;
          return;
        end if;
        loop
          read(L, ch);
          if '0' <= ch and ch <= '9' then
            result := result*16 + character'pos(ch) - character'pos('0');
          elsif 'A' <= ch and ch <= 'F' then
            result := result*16 + character'pos(ch) - character'pos('A') + 10;
          else  -- 'a' <= ch and ch <= 'f'
            result := result*16 + character'pos(ch) - character'pos('a') + 10;
          end if;
          exit when L'length = 0 or not valid_hex_character( L(L'left) );
        end loop;
        n := result;
      end read_hex;

      procedure find_token_end ( variable L : in line;
                                 last : out positive ) is
        variable index : positive := L'left;
      begin
        while index < L'right
            and not ( L(index+1) = ' '
                      or L(index+1) = character'val(160)  -- NBSP
                      or L(index+1) = HT )  loop
          index := index + 1;
        end loop;
        last := index;
      end procedure find_token_end;

      function to_lowercase ( s : string ) return string is
        variable result : string(1 to s'length) := s;
      begin
        for index in result'range loop
          if 'A' <= result(index) and result(index) <= 'Z' then
            result(index) := character'val( character'pos(result(index))
                                            - character'pos('A')
                                            + character'pos('a') );
          end if;
        end loop;
        return result;
      end function to_lowercase;

      procedure process_line is
        variable ch : character;
        variable last : positive;
        subtype byte_offset_range is integer range 0 to 3;
      begin
        -- skip leading whitespace
        while L'length /= 0 and
              ( L(L'left) = ' '
                or L(L'left) = character'val(160)  -- NBSP
                or L(L'left) = HT ) loop
          read(L, ch);
        end loop;
        if L'length = 0 then
          return;  -- blank line, so ignore
        end if;

        if state = expecting_abs then
          find_token_end( L, last);
          if to_lowercase( L(L'left to last) ) /= ".abs" then
            report ".abs missing in file " & load_file_name
                   & " on line " & integer'image(line_number)
              severity failure;
            return;
          end if;
          state := expecting_address_or_start_or_eof;
        elsif state = expecting_address_or_start_or_eof then
          -- not eof, since we are processing a line
          -- so must be address/data or start line
          find_token_end( L, last);
          if to_lowercase(L(L'left to last) ) = ".start" then
            -- start directive - consume token
            for index in L'left to last loop
              read(L, ch);
            end loop;
            -- skip leading whitespace
            while L'length /= 0 and
                  ( L(L'left) = ' '
                    or L(L'left) = character'val(160)  -- NBSP
                    or L(L'left) = HT ) loop
              read(L, ch);
            end loop;
            -- expecting address
            if L'length = 0 then
              report "Missing address in .start in file " & load_file_name
                   & " on line " & integer'image(line_number)
                severity failure;
              return;
            end if;
            read_hex( L, address );
            assert address = 0
              report ".start address is not 0" severity warning;
            state := expecting_eof;
          else  -- must be address/data line
            read_hex( L, address );
            loop
              -- skip leading whitespace
              while L'length /= 0 and
                    ( L(L'left) = ' '
                      or L(L'left) = character'val(160)  -- NBSP
                      or L(L'left) = HT ) loop
                read(L, ch);
              end loop;
              exit when L'length = 0;  -- nothing more on line
              read_hex( L, data );
              byte := to_unsigned(data, 8);
              case byte_offset_range'(address mod 4) is
                when 0 =>
                  mem(address/4)(31 downto 24) := byte;
                when 1 =>
                  mem(address/4)(23 downto 16) := byte;
                when 2 =>
                  mem(address/4)(15 downto 8) := byte;
                when 3 =>
                  mem(address/4)(7 downto 0) := byte;
              end case;
              address := address + 1;
            end loop;
          end if;
        else  -- state = expecting_eof
          report "Extra lines after .start in file " & load_file_name
            severity failure;
          return;
        end if;
      end procedure process_line;

    begin  -- load
      while not endfile(object_file) loop
        readline(object_file, L);
        line_number := line_number + 1;
        process_line;
      end loop;
      assert (state = expecting_address_or_start_or_eof)
             or (state = expecting_eof)
        report "Premature end of file in " & load_file_name severity failure;
    end load;

    procedure do_write is -- . . . -- as in architecture preloaded

    procedure do_read is -- . . .  -- as in architecture preloaded

  begin
    load;  -- read binary memory image into memory array
    -- . . .       -- as in architecture preloaded
  end process mem_behavior;

end architecture file_loaded;
