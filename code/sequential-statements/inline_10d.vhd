entity inline_10d is

end entity inline_10d;


----------------------------------------------------------------


architecture test of inline_10d is

  type opcode_type is (nop, add, subtract);

  signal opcode : opcode_type := nop;

begin


  process_3_a : process (opcode) is

    variable Acc : integer := 0;
    constant operand : integer := 1;

  begin

    -- code from book:

    case opcode is
      when add =>
        Acc := Acc + operand;
      when subtract =>
        Acc := Acc - operand;
      when nop =>
        null;
    end case;

    -- end of code from book

  end process process_3_a;


  stimulus : process is
  begin
    opcode <= add after 10 ns, subtract after 20 ns, nop after 30 ns;
    wait;
  end process stimulus;


end architecture test;
