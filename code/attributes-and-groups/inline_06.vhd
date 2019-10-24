entity inline_06 is

end entity inline_06;


----------------------------------------------------------------

use std.textio.all;

architecture test of inline_06 is

  subtype encoding_type is bit_vector(1 downto 0);
  attribute encoding : encoding_type;

begin


  process1 : process is

    -- code from book:

    type controller_state is (idle, active, fail_safe);
    type load_level is (idle, busy, overloaded);

    attribute encoding of idle [ return controller_state ] : literal is b"00";
    attribute encoding of active [ return controller_state ] : literal is b"01";
    attribute encoding of fail_safe [ return controller_state ] : literal is b"10";

    -- end of code from book

    variable L : line;

  begin
    write(L, string'("process1"));
    writeline(output, L);
    write(L, idle [ return controller_state ] ' encoding);
    writeline(output, L);
    write(L, active [ return controller_state ] ' encoding);
    writeline(output, L);
    write(L, fail_safe [ return controller_state ] ' encoding);
    writeline(output, L);
    wait;
  end process process1;


  process2 : process is

    type controller_state is (idle, active, fail_safe);
    type load_level is (idle, busy, overloaded);

    attribute encoding of idle : literal is b"11";

    variable L : line;

  begin
    write(L, string'("process2"));
    writeline(output, L);
    write(L, idle [ return controller_state ] ' encoding);
    writeline(output, L);
    write(L, idle [ return load_level ] ' encoding);
    writeline(output, L);
    wait;
  end process process2;


end architecture test;
