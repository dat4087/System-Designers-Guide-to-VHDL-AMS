entity inline_02a is

end entity inline_02a;


architecture test of inline_02a is
begin

  block_1 : block is

    -- code from book

    quantity input1, input2, output : real;
    quantity amplified_input1, amplified_input2 : real;

    constant gain1 : real := 2.0;
    constant gain2 : real := 4.0;

    -- end code from book

  begin

    -- code from book

    amplified_input1 == input1 * gain1;
    amplified_input2 == input2 * gain2;
    output == amplified_input1 * amplified_input2;

    -- end code from book

  end block block_1;


  block_2 : block is

    quantity input1, input2, output : real;

    constant gain1 : real := 2.0;
    constant gain2 : real := 4.0;

  begin

    -- code from book

    output == input1 * gain1 * input2 * gain2;

    -- end code from book

  end block block_2;

  
end architecture test;
