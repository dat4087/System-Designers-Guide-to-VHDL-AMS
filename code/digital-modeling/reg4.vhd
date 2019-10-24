entity reg4 is
  port ( clk, clr, d0, d1, d2, d3 : in bit;
         q0, q1, q2, q3 : out bit );
end entity reg4;

----------------------------------------------

architecture struct of reg4 is
begin

  bit0 : entity work.edge_triggered_Dff(behavioral)
    port map (d0, clk, clr, q0);
  bit1 : entity work.edge_triggered_Dff(behavioral)
    port map (d1, clk, clr, q1);
  bit2 : entity work.edge_triggered_Dff(behavioral)
    port map (d2, clk, clr, q2);
  bit3 : entity work.edge_triggered_Dff(behavioral)
    port map (d3, clk, clr, q3);

end architecture struct;


