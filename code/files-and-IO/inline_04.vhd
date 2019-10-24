entity inline_04 is

end entity inline_04;


----------------------------------------------------------------


architecture test of inline_04 is
begin


  process is

    type data_file_type is file of character;
    variable ch : character;

    -- code from book:

    procedure write_to_file is
      file data_file : data_file_type open write_mode is "datafile";
    begin
      -- . . .
      -- not in book
      write(data_file, ch);
      -- end not in book
    end procedure write_to_file;

    -- end of code from book

  begin
    ch := 'A';
    write_to_file;
    ch := 'B';
    write_to_file;
    ch := 'C';
    write_to_file;

    wait;
  end process;


end architecture test;
