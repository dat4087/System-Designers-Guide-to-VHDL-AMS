-- not in book

entity in_pad is
  port ( i : in bit;  z : out bit );
end entity in_pad;


entity reg32 is
  port ( en : in bit;  clk : in bit;  d : in bit_vector(31 downto 0);
         q : out bit_vector(31 downto 0) );
end entity reg32;


entity adder is
  port ( a, b : in bit_vector(31 downto 0);
         y : out bit_vector(31 downto 0);
	 c : out bit );
end entity adder;


entity filter is
end entity filter;

-- end not in book



library widget_cells, wasp_lib;

architecture cell_based of filter is

  -- declaration of signals, etc
  -- . . .

  -- not in book

  signal clk, filter_clk, accum_en, carry : bit;
  signal sum, alu_op1, alu_op2, result : bit_vector(31 downto 0);

  -- end not in book

begin

  clk_pad : entity wasp_lib.in_pad
    port map ( i => clk, z => filter_clk );

  accum : entity widget_cells.reg32
    port map ( en => accum_en, clk => filter_clk, d => sum,
               q => result );

  alu : entity work.adder
    port map ( a => alu_op1, b => alu_op2, y => sum, c => carry );

  -- other component instantiations
  -- . . .

end architecture cell_based;
