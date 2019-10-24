package mem_pkg is

  subtype word is bit_vector(0 to 31);
  type word_array is array (natural range <>) of word;

  procedure load_array ( words : out word_array;  file_name : string );

end package mem_pkg;

--------------------------------------------------

package body mem_pkg is

  procedure load_array ( words : out word_array;  file_name : string ) is
    -- words'path_name = ":project:mem_pkg:load_array:words"

    use std.textio.all;
    file load_file : text open read_mode is file_name;
    -- load_file'path_name = ":project:mem_pkg:load_array:load_file"

    procedure read_line is
    -- read_line'path_name = ":project:mem_pkg:load_array:read_line:"
      variable current_line : line;
      -- current_line'path_name =
      --    ":project:mem_pkg:load_array:read_line:current_line"
    begin
      -- . . .
      -- not in book
      report current_line'path_name;
      -- end not in book
    end procedure read_line;

  begin  -- load_array
    -- . . .
    -- not in book
    report mem_pkg'path_name;
    report words'path_name;
    report load_file'path_name;
    report read_line'path_name;
    read_line;
    -- end not in book
  end procedure load_array;

end package body mem_pkg;
