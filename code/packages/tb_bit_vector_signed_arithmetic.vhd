entity tb_bit_vector_signed_arithmetic is
end entity tb_bit_vector_signed_arithmetic;


architecture test of tb_bit_vector_signed_arithmetic is
begin

  stimulus : process is
    use work.bit_vector_signed_arithmetic.all;
    use std.textio.all;
    variable L : line;
  begin
    write(L, X"0002" + X"0005");
    writeline(output, L);
    write(L, X"0002" + X"FFFE");
    writeline(output, L);
    write(L, - X"0005");
    writeline(output, L);
    write(L, - X"FFFE");
    writeline(output, L);
    write(L, X"0002" * X"0005");
    writeline(output, L);
    write(L, X"0002" * X"FFFD");
    writeline(output, L);

    wait;
  end process stimulus;

end architecture test;
