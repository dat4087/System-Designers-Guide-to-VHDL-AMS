entity edge_triggered_Dff is
  generic ( Tprop, Tsetup, Thold : delay_length );
  port ( clk : in bit;  clr : in bit; d : in bit;
         q : out bit );
end entity edge_triggered_Dff;


architecture basic of edge_triggered_Dff is
begin

  state_change : process (clk, clr) is
  begin
    if clr = '1' then
      q <= '0' after Tprop;
    elsif clk'event and clk = '1' then
      q <= d after Tprop;
    end if;
  end process state_change;

end architecture basic;


architecture hi_fanout of edge_triggered_Dff is
begin

  state_change : process (clk, clr) is
  begin
    if clr = '1' then
      q <= '0' after Tprop;
    elsif clk'event and clk = '1' then
      q <= d after Tprop;
    end if;
  end process state_change;

end architecture hi_fanout;


-- code from book

entity reg4 is
  port ( clk, clr : in bit;  d : in bit_vector(0 to 3);
         q : out bit_vector(0 to 3) );
end entity reg4;

--------------------------------------------------

architecture struct of reg4 is

  component flipflop is
    generic ( Tprop, Tsetup, Thold : delay_length );
    port ( clk : in bit;  clr : in bit;  d : in bit;
           q : out bit );
  end component flipflop;

begin

  bit0 : component flipflop
      generic map ( Tprop => 2 ns, Tsetup => 2 ns, Thold => 1 ns )
      port map ( clk => clk, clr => clr, d => d(0), q => q(0) );

  bit1 : component flipflop
      generic map ( Tprop => 2 ns, Tsetup => 2 ns, Thold => 1 ns )
      port map ( clk => clk, clr => clr, d => d(1), q => q(1) );

  bit2 : component flipflop
      generic map ( Tprop => 2 ns, Tsetup => 2 ns, Thold => 1 ns )
      port map ( clk => clk, clr => clr, d => d(2), q => q(2) );

  bit3 : component flipflop
      generic map ( Tprop => 2 ns, Tsetup => 2 ns, Thold => 1 ns )
      port map ( clk => clk, clr => clr, d => d(3), q => q(3) );

end architecture struct;

-- end code from book
