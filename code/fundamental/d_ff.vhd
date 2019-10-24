entity d_ff is
  port ( d, clk : in bit;  q : out bit );
end d_ff;

architecture basic of d_ff is
begin
  
  ff_behavior : process is
  begin
    if clk = '1' then
      q <= d after 2 ns;
    end if;
    wait on clk;
  end process ff_behavior;
  
end architecture basic;
