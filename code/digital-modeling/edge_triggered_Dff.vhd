entity edge_triggered_Dff is
  port ( D : in bit;  clk : in bit;  clr : in bit;
         Q : out bit );
end entity edge_triggered_Dff;

--------------------------------------------------

architecture behavioral of edge_triggered_Dff is
begin

  state_change : process (clk, clr) is
  begin
    if clr = '1' then
      Q <= '0' after 2 ns;
    elsif clk'event and clk = '1' then
      Q <= D after 2 ns;
    end if;
  end process state_change;

end architecture behavioral;
