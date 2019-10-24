entity inline_01 is

end entity inline_01;


----------------------------------------------------------------


architecture test of inline_01 is
begin


  process is

    -- code from book:

    type integer_file is file of integer;

    file lookup_table_file : integer_file is "lookup-values";

    -- end of code from book

  begin
    wait;
  end process;


  process is

    -- code from book:

    type file_open_kind is (read_mode, write_mode, append_mode);

    -- end of code from book

  begin
    wait;
  end process;


  process is

    type element_type is (t1, t2, t3);

    -- code from book:

    type file_type is file of element_type;

    procedure read ( file f : file_type;  value : out element_type );

    function endfile ( file f : file_type ) return boolean;

    -- end of code from book

    procedure read ( file f : file_type;  value : out element_type ) is
    begin
    end;

    function endfile ( file f : file_type ) return boolean is
    begin
    end;

  begin
    wait;
  end process;


end architecture test;
