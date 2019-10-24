library project;

entity inline_02 is
end entity inline_02;


architecture test of inline_02 is
begin

  process is

    use project.mem_pkg;
    use project.mem_pkg.all;
    variable words : word_array(0 to 3);

  begin
    assert
    -- code from book (in text)
    mem_pkg'path_name = ":project:mem_pkg:"
    -- end code from book
    ;
    report mem_pkg'path_name;

    assert
    -- code from book (in text)
    word'path_name = ":project:mem_pkg:word"
    -- end code from book
    ;
    report word'path_name;

    assert
    -- code from book (in text)
    word_array'path_name = ":project:mem_pkg:word_array"
    -- end code from book
    ;

    report word_array'path_name;

    assert
    -- code from book (in text)
    load_array'path_name = ":project:mem_pkg:load_array"
    -- end code from book
    ;
    report load_array'path_name;

    load_array(words, "/dev/null");
    wait;
  end process;

end architecture test;
