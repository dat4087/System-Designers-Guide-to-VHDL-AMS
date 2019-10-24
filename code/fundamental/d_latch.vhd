entity d_latch is
  port ( d, clk : in bit;  q : out bit );
end d_latch;

architecture basic of d_latch is
begin

  latch_behavior : process is
  begin
    if clk = '1' then
      q <= d after 2 ns;
    end if;
    wait on clk, d;
  end process latch_behavior;

end architecture basic;
