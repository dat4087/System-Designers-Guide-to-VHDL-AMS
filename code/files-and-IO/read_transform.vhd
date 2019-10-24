entity read_transform_write_data is
end entity read_transform_write_data;


architecture writer of read_transform_write_data is
begin

  process is
    type transform_file is file of real;
    file initial_transforms : transform_file open write_mode is "transforms.ini";
  begin
    for i in 1 to 50 loop
      write(initial_transforms, real(i));
    end loop;
    wait;
  end process;

end architecture writer;




entity read_transform is
end entity read_transform;


architecture test of read_transform is
begin

  process is

    -- code from book (in text)

    type transform_array is array (1 to 3, 1 to 3) of real;
    variable transform1, transform2 : transform_array;

    type transform_file is file of real;
    file initial_transforms : transform_file open read_mode is "transforms.ini";

    -- end code from book

    -- code from book (in Figure)

    procedure read_transform ( file f : transform_file;
                               variable transform : out transform_array ) is
    begin
      for i in transform'range(1) loop
        for j in transform'range(2) loop
          if endfile(f) then
            report "unexpected end of file in read_transform - "
                   & "some array elements not read"
              severity error;
            return;
          end if;
          read ( f, transform(i, j) );
        end loop;
      end loop;
    end procedure read_transform;

    -- end code from book

  begin

    -- code from book (in text)

    read_transform ( initial_transforms, transform1 );
    read_transform ( initial_transforms, transform2 );

    -- end code from book

    wait;
  end process;

end architecture test;
