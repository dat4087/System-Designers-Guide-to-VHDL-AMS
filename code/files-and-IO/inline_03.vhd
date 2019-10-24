entity inline_03 is

end entity inline_03;


----------------------------------------------------------------


architecture test of inline_03 is
begin


  process is

    type element_type is (t1, t2, t3);

    type file_type is file of element_type;

    -- code from book:

    procedure write ( file f : file_type;  value : in element_type );

    -- end of code from book

    procedure write ( file f : file_type;  value : in element_type ) is
    begin
    end;

  begin
    wait;
  end process;


end architecture test;
