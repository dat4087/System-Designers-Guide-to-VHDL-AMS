-- VHDL-87


entity mux4 is
  port ( i0, i1, i2, i3, sel0, sel1 : in bit;
         z : out bit );
end mux4;


----------------------------------------------------------------


architecture functional of mux4 is
begin

  out_select : process (sel0, sel1, i0, i1, i2, i3)
    subtype bits_2 is bit_vector(1 downto 0);
  begin
    case bits_2'(sel1, sel0) is
      when "00" =>  z <= i0;
      when "01" =>  z <= i1;
      when "10" =>  z <= i2;
      when "11" =>  z <= i3;
    end case;
  end process out_select;

end functional;


----------------------------------------------------------------


entity inline_25 is

end example_subrog-25;


----------------------------------------------------------------


architecture test of inline_25 is

  signal select_line, line0, line1, result_line : bit;

  -- code from book:

  signal tied_0 : bit := '0';
  signal tied_1 : bit := '1';

  -- end of code from book

  component mux4
    port ( i0, i1, i2, i3, sel0, sel1 : in bit;
           z : out bit );
  end component;

  for all : mux4
    use entity work.mux4;

begin


  a_mux : mux4

  -- code from book:

    port map ( sel0 => select_line, i0 => line0, i1 => line1,
               z => result_line,
               sel1 => tied_0, i2 => tied_1, i3 => tied_1 );

  -- end of code from book


  ----------------


  stimulus : process
  begin
    wait for 5 ns;
    line0 <= '1';				wait for 5 ns;
    line1 <= '1';				wait for 5 ns;
    			select_line <= '1';	wait for 5 ns;
    line1 <= '0';				wait for 5 ns;
    line0 <= '0';				wait for 5 ns;

    wait;
  end process stimulus;


end test;
