entity read_array_write_data is
end entity read_array_write_data;


architecture writer of read_array_write_data is
begin

  process is

    type integer_file is file of integer;
    file data_file : integer_file open write_mode is "coeff-data";

  begin
    write(data_file, 0);
    write(data_file, 1);
    write(data_file, 2);
    write(data_file, 3);
    write(data_file, 4);
    write(data_file, 5);
    write(data_file, 6);
    write(data_file, 7);
    write(data_file, 8);
    write(data_file, 9);
    write(data_file, 10);
    write(data_file, 11);
    write(data_file, 12);
    write(data_file, 13);
    write(data_file, 14);
    write(data_file, 15);
    write(data_file, 16);
    write(data_file, 17);
    write(data_file, 18);

    wait;
  end process;

end architecture writer;



entity read_array is
end entity read_array;


architecture test of read_array is
begin

  process is

    -- code from book (in text)

    type integer_vector is array (integer range <>) of integer;

    -- end code from book

    -- code from book (in Figure)

    impure function read_array ( file_name : string;  array_length : natural )
                               return integer_vector is
      type integer_file is file of integer;
      file data_file : integer_file open read_mode is file_name;
      variable result : integer_vector(1 to array_length) := (others => 0);
      variable index : integer := 1;
    begin
      while not endfile(data_file) and index <= array_length loop
        read(data_file, result(index));
        index := index + 1;
      end loop;
      return result;
    end function read_array;

    -- end code from book

    -- code from book (in text)

    constant coeffs : integer_vector := read_array("coeff-data", 16);

    -- end code from book

  begin
    wait;
  end process;

end architecture test;

