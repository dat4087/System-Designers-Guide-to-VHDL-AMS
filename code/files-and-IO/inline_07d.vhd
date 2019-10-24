entity inline_07d_write_data is
end inline_07d_write_data;


architecture writer of inline_07d_write_data is
begin

  process
    type transform_file is file of real;
    file initial_transforms : transform_file is out "transforms.ini";
  begin
    for i in 1 to 12 loop
      write(initial_transforms, real(i));
    end loop;
    wait;
  end process;

end writer;




entity inline_07d is
end inline_07d;


architecture test of inline_07d is
begin

  process

    type transform_array is array (1 to 3, 1 to 3) of real;
    variable transform1, transform2 : transform_array;

    type transform_file is file of real;
    file initial_transforms : transform_file
      is in "transforms.ini";

    -- code from book

    procedure read_transform
                ( variable f : in transform_file;
                  variable transform : out transform_array ) is -- . . .

    -- end code from book

    begin
      for i in transform'range(1) loop
        for j in transform'range(2) loop
          if endfile(f) then
            assert false
            report "unexpected end of file in read_transform - "
                   & "some array elements not read"
              severity error;
            return;
          end if;
          read ( f, transform(i, j) );
        end loop;
      end loop;
    end read_transform;

  begin

    read_transform ( initial_transforms, transform1 );
    read_transform ( initial_transforms, transform2 );

    wait;
  end process;

end test;
