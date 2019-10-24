entity do_arith_op is
end entity do_arith_op;


architecture test of do_arith_op is

  type func_code is (add, subtract);

  signal op1 : integer := 10;
  signal op2 : integer := 3;
  signal dest : integer := 0;
  signal func : func_code := add;

  signal Z_flag : boolean := false;

  constant Tpd : delay_length := 3 ns;

begin

  stimulus : process is

    -- code from book

    procedure do_arith_op ( op : in func_code ) is
      variable result : integer;
    begin
      case op is
        when add =>
          result := op1 + op2;
        when subtract =>
          result := op1 - op2;
      end case;
      dest  <=  result after Tpd;
      Z_flag  <=  result = 0 after Tpd;
    end procedure do_arith_op;

    -- end code from book

  begin
    wait for 10 ns;

    -- code from book (in text)

    do_arith_op ( add );

    -- end code from book

    wait for 10 ns;

    -- code from book (in text)

    do_arith_op ( func );

    -- end code from book

    wait for 10 ns;
    do_arith_op ( subtract );
    wait for 10 ns;
    op2 <= 10;
    wait for 10 ns;
    do_arith_op ( subtract );

    wait;
  end process stimulus;

end architecture test;
