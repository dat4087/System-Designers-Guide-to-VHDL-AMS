entity lessthan is
end entity lessthan;



architecture test of lessthan is

  -- code from book

  function "<" ( a, b : bit_vector ) return boolean is
    variable tmp1 : bit_vector(a'range) := a;
    variable tmp2 : bit_vector(b'range) := b;
  begin
    tmp1(tmp1'left) := not tmp1(tmp1'left);
    tmp2(tmp2'left) := not tmp2(tmp2'left);
    return std.standard."<" ( tmp1, tmp2 );
  end function "<";

  -- end code from book

  signal a, b : bit_vector(7 downto 0);
  signal result : boolean;

begin

  dut : result <= a < b;

  stimulus : process is
  begin
    wait for 10 ns;
    a <= X"02";  b <= X"04";  wait for 10 ns;
    a <= X"02";  b <= X"02";  wait for 10 ns;
    a <= X"02";  b <= X"01";  wait for 10 ns;
    a <= X"02";  b <= X"FE";  wait for 10 ns;
    a <= X"FE";  b <= X"02";  wait for 10 ns;
    a <= X"FE";  b <= X"FE";  wait for 10 ns;
    a <= X"FE";  b <= X"FC";  wait for 10 ns;

    wait;
  end process stimulus;

end architecture test;
