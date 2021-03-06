-- not in book

entity control_processor is
  generic ( Tpd : delay_length := 3 ns );
end entity control_processor;

-- end not in book



architecture rtl of control_processor is

  type func_code is (add, subtract);

  signal op1, op2, dest : integer;
  signal Z_flag : boolean;
  signal func : func_code;
  -- . . .

begin

  alu : process is

    procedure do_arith_op is
      variable result : integer;
    begin
      case func is
        when add =>
          result := op1 + op2;
        when subtract =>
          result := op1 - op2;
      end case;
      dest  <=  result after Tpd;
      Z_flag  <=  result = 0 after Tpd;
    end procedure do_arith_op;

  begin
    -- . . .
    do_arith_op;
    -- . . .
    -- not in book
    wait on op1, op2, func;
    -- end not in book
  end process alu;

  -- . . .

  -- not in book

  stimulus : process is
  begin
    op1 <= 0;  op2 <= 0;	wait for 10 ns;
    op1 <= 10; op2 <= 3;	wait for 10 ns;
    func <= subtract;		wait for 10 ns;
    op2 <= 10;			wait for 10 ns;

    wait;
  end process stimulus;

  -- end not in book

end architecture rtl;
