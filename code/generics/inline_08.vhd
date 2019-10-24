entity inline_08 is
end entity inline_08;


architecture test of inline_08 is

  -- code from book

  subtype state_vector is bit_vector(1 to 5);

  -- end code from book

  signal clk, reset : bit := '0';
  signal word_in, word_out : bit_vector(0 to 31);
  signal state_in, state_out : state_vector;

begin

  -- code from book

  word_reg : entity work.reg(behavioral)
    generic map ( width => 32 )
    port map ( -- . . . );
    -- not in book
               d => word_in, q => word_out, clk => clk, reset => reset );
    -- end not in book

  state_reg : entity work.reg(behavioral)
    generic map ( width => state_vector'length )
    port map ( -- . . . );
    -- not in book
               d => state_in, q => state_out, clk => clk, reset => reset );

  -- end code from book

  clk_gen : clk <= '1' after 10 ns, '0' after 20 ns when clk = '0';

  reset_gen : reset <= '1' after 80 ns, '0' after 105 ns;

  stimulus_word : word_in <= X"11111111" after 25 ns,
                             X"22222222" after 65 ns,
		             X"33333333" after 85 ns,
		             X"44444444" after 125 ns;

  stimulus_state : state_in <= "00001" after 25 ns,
                               "00010" after 65 ns,
		               "00011" after 85 ns,
		               "00100" after 125 ns;

end architecture test;
