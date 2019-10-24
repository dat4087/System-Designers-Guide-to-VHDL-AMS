entity inline_06 is

end entity inline_06;


----------------------------------------------------------------


architecture test of inline_06 is

  -- code from book:
  
  type alu_func is (pass1, pass2, add, subtract);
  
  -- end of code from book
  
  signal func : alu_func := pass1;
  signal operand1 : integer := 10;
  signal operand2 : integer := 3;

begin

  process_2_a : process (func, operand1, operand2) is

    variable result : integer := 0;

  begin

    -- code from book:

    case func is
      when pass1 =>
        result := operand1;
      when pass2 =>
        result := operand2;
      when add =>
        result := operand1 + operand2;
      when subtract =>
        result := operand1 - operand2;
    end case;

    -- end of code from book

  end process process_2_a;


  stimulus : process is
  begin
    func <= pass2 after 10 ns,
	    add after 20 ns,
	    subtract after 30 ns;
    wait;
  end process stimulus;


end architecture test;
