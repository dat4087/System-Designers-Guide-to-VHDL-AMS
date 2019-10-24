entity tb_function_plus is
end entity tb_function_plus;


architecture test of tb_function_plus is

  use work.function_plus.all;

begin

  stimulus : process is
    use std.textio.all;
    variable L : line;
  begin
    write(L, X"0002" + X"0000");
    writeline(output, L);
    write(L, X"0002" + X"0005");
    writeline(output, L);
    write(L, X"0002" + X"FFFE");
    writeline(output, L);
    
    wait;
  end process stimulus;

end architecture test;
