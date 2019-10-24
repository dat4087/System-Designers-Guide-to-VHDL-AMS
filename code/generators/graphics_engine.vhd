-- not in book

entity graphics_engine is
end entity graphics_engine;

-- end not in book


architecture behavioral of graphics_engine is

  type point is array (1 to 3) of real;
  type transformation_matrix is array (1 to 3, 1 to 3) of real;

  signal p, transformed_p : point;
  signal a : transformation_matrix;
  signal clock : bit;
  -- . . .

begin

  transform_stage : for i in 1 to 3 generate
  begin

    cross_product_transform : process is
      variable result1, result2, result3 : real := 0.0;
    begin
      wait until clock = '1';
      transformed_p(i) <= result3;
      result3 := result2;
      result2 := result1;
      result1 :=  a(i, 1) * p(1) + a(i, 2) * p(2) + a(i, 3) * p(3);
    end process cross_product_transform;

  end generate transform_stage;

  -- . . .    -- other stages in the pipeline, etc

  -- not in book

  clock_gen : clock <= '1' after 10 ns, '0' after 20 ns when clock = '0';

  stimulus : process is
  begin
    a <= ( (1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0) );
    p <= ( 10.0, 10.0, 10.0 );
    wait until clock = '0';
    p <= ( 20.0, 20.0, 20.0 );
    wait until clock = '0';
    p <= ( 30.0, 30.0, 30.0 );
    wait until clock = '0';
    p <= ( 40.0, 40.0, 40.0 );
    wait until clock = '0';
    p <= ( 50.0, 50.0, 50.0 );
    wait until clock = '0';
    p <= ( 60.0, 60.0, 60.0 );

    wait;
  end process stimulus;

  -- end not in book

end architecture behavioral;
