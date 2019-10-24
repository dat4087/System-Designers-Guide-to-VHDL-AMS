entity inline_01 is
end entity inline_01;


architecture test of inline_01 is

  component computer_system is
    port ( other_port : in bit := '0' );
  end component computer_system;

begin

  system_under_test : component computer_system
    port map ( other_port => open );

end architecture test;



configuration inline_01_test of inline_01 is

  for test

    -- code from book (in text)

    for system_under_test : computer_system
      use entity work.computer_system(block_level)
      generic map ( instrumented => true )
      -- . . .
      -- not in book
      ;
      -- end not in book
    end for;

    -- end code from book

  end for;

end configuration inline_01_test;
