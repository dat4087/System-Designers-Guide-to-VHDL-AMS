entity inline_06 is

end entity inline_06;


----------------------------------------------------------------


architecture test of inline_06 is

  type integer_file is file of integer;

begin


  process is

    -- code from book:

    file lookup_table_file, result_file : integer_file;

    -- end of code from book

  begin
    wait;
  end process;


  process is

    type element_type is (t1, t2, t3);

    -- code from book:

    type file_type is file of element_type;

    procedure file_open ( file f : file_type;
                          external_name : in string;
                          open_kind : in file_open_kind := read_mode );

    -- end of code from book

    procedure file_open ( file f : file_type;
                          external_name : in string;
                          open_kind : in file_open_kind := read_mode ) is
    begin
    end;

  begin
    wait;
  end process;


  process is

    -- code from book:

    file lookup_table_file : integer_file open read_mode is "lookup-values";

    -- end of code from book

  begin
    wait;
  end process;


  process is

    -- code from book:

    file lookup_table_file : integer_file;
    -- . . .

    -- end of code from book

  begin

    -- code from book:

    file_open ( lookup_table_file,
                external_name => "lookup-values", open_kind => read_mode );

    -- end of code from book

    wait;
  end process;


  process is

    type element_type is (t1, t2, t3);
    type file_type is file of element_type;

    -- code from book:

    type file_open_status is (open_ok, status_error, name_error, mode_error);

    procedure file_open ( status : out file_open_status;
                          file f : file_type;
                          external_name : in string;
                          open_kind : in file_open_kind := read_mode );

    procedure file_close ( file f : file_type );

    -- end of code from book

    procedure file_open ( status : out file_open_status;
                          file f : file_type;
                          external_name : in string;
                          open_kind : in file_open_kind := read_mode ) is
    begin
    end;

    procedure file_close ( file f : file_type ) is
    begin
    end;

  begin
    wait;
  end process;


end architecture test;
