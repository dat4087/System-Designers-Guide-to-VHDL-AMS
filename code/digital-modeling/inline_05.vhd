architecture abstract of adder is
begin

  add_a_b : process (a, b) is
  begin
    sum <= a + b;
  end process add_a_b;

end architecture abstract;
